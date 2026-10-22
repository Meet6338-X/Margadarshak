/// Sign-in services.
///
/// The app needs to work in two situations: on a shared family phone with no
/// network, and on a facilitator's own device with Firebase available. Both
/// situations sit behind [AuthService], so the UI never learns which one it is
/// running in.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../core/failure.dart';
import '../../core/result.dart';
import '../../domain/models/auth_user.dart';
import '../../domain/models/enums.dart';

/// Signs a user in and reports the session.
abstract interface class AuthService {
  /// Emits the current session, and every later change to it.
  Stream<AuthUser?> authStateChanges();

  /// The session that is active right now, if any.
  AuthUser? get currentUser;

  /// Signs in and returns the resulting session.
  ///
  /// [displayName] is the name the student or teacher gives themselves. The
  /// identifier never contains a phone number.
  Future<Result<AuthUser>> signIn({
    required String displayName,
    required UserRole role,
  });

  /// Ends the session.
  Future<Result<void>> signOut();
}

/// A sign-in service that keeps the session in a local file.
///
/// This is the offline default. It supports the facilitator workflow of
/// running a whole class on one shared device, because the session survives
/// an app restart without any server.
class OfflineAuthService implements AuthService {
  /// Creates the offline sign-in service.
  OfflineAuthService({this.fileName = 'session.json'});

  /// The name of the file the session is stored in.
  final String fileName;

  final StreamController<AuthUser?> _controller =
      StreamController<AuthUser?>.broadcast();
  AuthUser? _current;
  bool _loaded = false;

  @override
  Stream<AuthUser?> authStateChanges() async* {
    if (!_loaded) {
      await _load();
    }
    yield _current;
    yield* _controller.stream;
  }

  @override
  AuthUser? get currentUser {
    if (!_loaded) {
      // The file read is asynchronous, so the first read is kicked off here and
      // completed by the stream listener.
      unawaitedLoad();
    }
    return _current;
  }

  /// Starts reading the session file without blocking the caller.
  void unawaitedLoad() {
    if (_loaded) return;
    _loaded = true;
    _load().ignore();
  }

  @override
  Future<Result<AuthUser>> signIn({
    required String displayName,
    required UserRole role,
  }) async {
    try {
      final trimmed = displayName.trim();
      if (trimmed.isEmpty) {
        return FailureResult<AuthUser>(
          Failure.validation('A name is required to continue.'),
        );
      }
      final user = AuthUser(
        userId: 'local_${role.code}_${DateTime.now().millisecondsSinceEpoch}',
        displayName: trimmed,
        role: role,
      );
      await _write(user);
      _current = user;
      _controller.add(user);
      return Success<AuthUser>(user);
    } on Object catch (error) {
      return FailureResult<AuthUser>(
        Failure.storage('Could not save the session: $error'),
      );
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      final file = await _sessionFile();
      if (file.existsSync()) {
        await file.delete();
      }
      _current = null;
      _controller.add(null);
      return const Success<void>(null);
    } on Object catch (error) {
      return FailureResult<void>(
        Failure.storage('Could not clear the session: $error'),
      );
    }
  }

  /// Reads the session file.
  Future<void> _load() async {
    _loaded = true;
    try {
      final file = await _sessionFile();
      if (!file.existsSync()) return;
      final json = jsonDecode(await file.readAsString()) as Map<String, Object?>;
      _current = AuthUser(
        userId: json['userId']?.toString() ?? '',
        displayName: json['displayName']?.toString() ?? '',
        role: UserRole.fromCode(json['role']?.toString() ?? 'student'),
        email: json['email']?.toString(),
      );
      _controller.add(_current);
    } on Object catch (error) {
      debugPrint('OfflineAuthService: could not read the session: $error');
    }
  }

  /// Writes the session file.
  Future<void> _write(AuthUser user) async {
    final file = await _sessionFile();
    await file.writeAsString(
      jsonEncode(<String, Object?>{
        'userId': user.userId,
        'displayName': user.displayName,
        'role': user.role.code,
        'email': user.email,
      }),
    );
  }

  /// Resolves the session file inside the application support directory.
  Future<File> _sessionFile() async {
    final directory = await getApplicationSupportDirectory();
    return File(p.join(directory.path, fileName));
  }
}

/// A sign-in service backed by Firebase Authentication and Firestore.
class FirebaseAuthService implements AuthService {
  /// Creates the Firebase sign-in service.
  FirebaseAuthService({
    firebase_auth.FirebaseAuth? auth,
    Future<void> Function(firebase_auth.User user)? onUserCreated,
  })  : _auth = auth ?? firebase_auth.FirebaseAuth.instance,
        _onUserCreated = onUserCreated;

  final firebase_auth.FirebaseAuth _auth;
  final Future<void> Function(firebase_auth.User user)? _onUserCreated;

  final Map<String, UserRole> _roles = <String, UserRole>{};

  @override
  Stream<AuthUser?> authStateChanges() {
    return _auth.authStateChanges().map((firebase_auth.User? user) {
      if (user == null) return null;
      return AuthUser(
        userId: user.uid,
        displayName: user.displayName ?? '',
        role: _roleFor(user),
        email: user.email,
      );
    });
  }

  @override
  AuthUser? get currentUser {
    final user = _auth.currentUser;
    if (user == null) return null;
    return AuthUser(
      userId: user.uid,
      displayName: user.displayName ?? '',
      role: _roleFor(user),
      email: user.email,
    );
  }

  @override
  Future<Result<AuthUser>> signIn({
    required String displayName,
    required UserRole role,
  }) async {
    try {
      final trimmed = displayName.trim();
      if (trimmed.isEmpty) {
        return FailureResult<AuthUser>(
          Failure.validation('A name is required to continue.'),
        );
      }
      var user = _auth.currentUser;
      if (user == null) {
        final credential = await _auth.signInAnonymously();
        user = credential.user;
        await user?.updateDisplayName(trimmed);
        if (user != null) {
          await _onUserCreated?.call(user);
        }
      }
      if (user == null) {
        return FailureResult<AuthUser>(
          Failure.auth('Firebase did not return a user.'),
        );
      }
      _roles[user.uid] = role;
      return Success<AuthUser>(
        AuthUser(
          userId: user.uid,
          displayName: user.displayName ?? trimmed,
          role: role,
          email: user.email,
        ),
      );
    } on firebase_auth.FirebaseAuthException catch (error) {
      return FailureResult<AuthUser>(
        Failure.auth('Sign-in failed (${error.code}).'),
      );
    } on Object catch (error) {
      return FailureResult<AuthUser>(Failure.auth('Sign-in failed: $error'));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _auth.signOut();
      return const Success<void>(null);
    } on Object catch (error) {
      return FailureResult<void>(Failure.auth('Sign-out failed: $error'));
    }
  }

  /// Reads the role of the signed-in user.
  ///
  /// Firebase Auth does not expose custom claims synchronously, so the role
  /// chosen during sign-in is remembered for the lifetime of the session and
  /// the user id prefix is the fallback.
  UserRole _roleFor(firebase_auth.User user) {
    final known = _roles[user.uid];
    if (known != null) return known;
    return user.uid.startsWith('fac_') ? UserRole.facilitator : UserRole.student;
  }
}
