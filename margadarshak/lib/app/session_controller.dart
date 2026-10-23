/// Holds who is signed in and what their profile looks like.
library;

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../domain/models/auth_user.dart';
import '../domain/models/enums.dart';
import '../domain/models/student_profile.dart';
import '../domain/repositories/repositories.dart';

/// The session the router and the screens react to.
///
/// It is the single place that answers "who is using the app right now" and
/// "does this student still have to fill in the onboarding form".
class SessionController extends ChangeNotifier {
  /// Creates the controller.
  SessionController({
    required AuthRepository authRepository,
    required StudentRepository studentRepository,
  })  : _authRepository = authRepository,
        _studentRepository = studentRepository;

  final AuthRepository _authRepository;
  final StudentRepository _studentRepository;

  StreamSubscription<AuthUser?>? _subscription;

  AuthUser? _user;
  StudentProfile? _profile;
  bool _ready = false;

  /// The signed-in user, or `null`.
  AuthUser? get user => _user;

  /// The profile of the signed-in student, or `null`.
  StudentProfile? get profile => _profile;

  /// Whether the session has been resolved at least once.
  bool get isReady => _ready;

  /// Whether somebody is signed in.
  bool get isSignedIn => _user != null;

  /// Whether the signed-in user is a facilitator.
  bool get isFacilitator => _user?.role == UserRole.facilitator;

  /// Whether the student still has to complete the onboarding form.
  bool get needsOnboarding =>
      _user != null && _user!.role == UserRole.student && _profile == null;

  /// Starts listening to the authentication state.
  Future<void> start() async {
    _subscription = _authRepository.authStateChanges().listen(_handleAuthChanged);
    final current = await _authRepository.currentUser();
    await _handleAuthChanged(current.valueOrNull);
    _ready = true;
    notifyListeners();
  }

  /// Reloads the profile of the signed-in student.
  Future<void> refreshProfile() async {
    final user = _user;
    if (user == null || user.role != UserRole.student) return;
    final result = await _studentRepository.getProfile(user.userId);
    _profile = result.valueOrNull;
    notifyListeners();
  }

  /// Signs the current user out.
  Future<void> signOut() async {
    await _authRepository.signOut();
  }

  Future<void> _handleAuthChanged(AuthUser? user) async {
    _user = user;
    if (user == null) {
      _profile = null;
    } else if (user.role == UserRole.student) {
      final result = await _studentRepository.getProfile(user.userId);
      _profile = result.valueOrNull;
    } else {
      _profile = null;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
