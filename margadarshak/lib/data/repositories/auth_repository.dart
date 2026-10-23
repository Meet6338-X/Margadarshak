/// Signs the user in and out.
library;

import '../../core/result.dart';
import '../../domain/models/auth_user.dart';
import '../../domain/models/enums.dart';
import '../../domain/repositories/repositories.dart';
import '../services/auth_service.dart';

/// The default authentication repository.
///
/// It delegates to an [AuthService], which is either the offline service that
/// ships with the app or the Firebase one, depending on the build flags.
class LocalAuthRepository implements AuthRepository {
  /// Creates the repository.
  LocalAuthRepository({required AuthService authService}) : _authService = authService;

  final AuthService _authService;

  @override
  Future<Result<AuthUser?>> currentUser() async {
    return Result<AuthUser?>.success(_authService.currentUser);
  }

  @override
  Future<Result<AuthUser>> signIn({
    required String userId,
    required String displayName,
    required UserRole role,
  }) async {
    final result = await _authService.signIn(displayName: displayName, role: role);
    return switch (result) {
      Success<AuthUser>(:final value) => Result<AuthUser>.success(value),
      FailureResult<AuthUser>(:final failure) => Result<AuthUser>.failure(failure),
    };
  }

  @override
  Future<Result<void>> signOut() {
    return _authService.signOut();
  }

  @override
  Stream<AuthUser?> authStateChanges() => _authService.authStateChanges();
}
