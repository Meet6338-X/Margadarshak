/// The signed-in user.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

/// The person using the app right now.
@freezed
abstract class AuthUser with _$AuthUser {
  /// Creates an authenticated user.
  const factory AuthUser({
    /// The stable user identifier.
    required String userId,

    /// The name shown in the app.
    required String displayName,

    /// Whether this user is a student or a facilitator.
    required UserRole role,

    /// The email address, when the sign-in method provides one.
    String? email,
  }) = _AuthUser;

  /// Reads an authenticated user from JSON.
  factory AuthUser.fromJson(Map<String, Object?> json) => _$AuthUserFromJson(json);

}

/// Convenience readers for an [AuthUser].
extension AuthUserX on AuthUser {
  /// Whether the user is a facilitator.
  bool get isFacilitator => role == UserRole.facilitator;
}
