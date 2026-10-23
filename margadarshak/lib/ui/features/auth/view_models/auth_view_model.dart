/// The state of the sign-in screen.
library;

import 'package:flutter/foundation.dart';

import '../../../../core/failure.dart';
import '../../../../core/result.dart';
import '../../../../domain/models/auth_user.dart';
import '../../../../domain/models/enums.dart';
import '../../../../domain/repositories/repositories.dart';

/// Drives the sign-in screen.
class AuthViewModel extends ChangeNotifier {
  /// Creates the view model.
  AuthViewModel({required AuthRepository authRepository}) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  String _displayName = '';
  UserRole _role = UserRole.student;
  bool _busy = false;
  Failure? _failure;

  /// The name the student typed.
  String get displayName => _displayName;

  /// The role the person picked.
  UserRole get role => _role;

  /// Whether the sign-in is running.
  bool get isBusy => _busy;

  /// The last failure, if any.
  Failure? get failure => _failure;

  /// Stores the typed name.
  void setDisplayName(String value) {
    _displayName = value;
    notifyListeners();
  }

  /// Stores the picked role.
  void setRole(UserRole value) {
    _role = value;
    notifyListeners();
  }

  /// Signs the person in.
  ///
  /// Returns `true` when the session was created.
  Future<bool> signIn() async {
    if (_displayName.trim().isEmpty) {
      _failure = Failure.validation('A name is required to continue.');
      notifyListeners();
      return false;
    }

    _busy = true;
    _failure = null;
    notifyListeners();

    final Result<AuthUser> result = await _authRepository.signIn(
      userId: '',
      displayName: _displayName,
      role: _role,
    );

    _busy = false;
    if (result case FailureResult<AuthUser>(:final failure)) {
      _failure = failure;
    }
    notifyListeners();
    return result.isSuccess;
  }
}
