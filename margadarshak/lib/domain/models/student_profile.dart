/// The student profile: the single record every recommendation is based on.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'student_profile.freezed.dart';
part 'student_profile.g.dart';

/// Everything the app knows about one student.
///
/// The profile deliberately stores a generated [studentId] instead of a phone
/// number, and only the fields that eligibility rules actually inspect.
@freezed
abstract class StudentProfile with _$StudentProfile {
  /// Creates a student profile.
  const factory StudentProfile({
    /// A stable, non-identifying identifier. Never a phone number.
    required String studentId,

    /// The name shown in the app.
    required String displayName,

    /// How far along the student is in their education.
    required EducationStage stage,

    /// The current class number (9, 10, 11, 12 or the graduation year).
    required int currentClass,

    /// The state the student lives in, as a lower-case code such as `mh`.
    required String state,

    /// The district the student lives in.
    required String district,

    /// The social category used by most schemes.
    required SocialCategory category,

    /// The family income band.
    required IncomeBand incomeBand,

    /// Gender, recorded because some schemes are gender specific.
    required Gender gender,

    /// Whether nobody in the family has gone to college.
    required bool firstGenerationLearner,

    /// Free-form interest tags used to match careers.
    @Default(<String>{}) Set<String> interests,

    /// When the profile was created.
    required DateTime createdAt,
  }) = _StudentProfile;

  /// Reads a student profile from JSON.
  factory StudentProfile.fromJson(Map<String, Object?> json) =>
      _$StudentProfileFromJson(json);

}

/// Convenience readers for a [StudentProfile].
extension StudentProfileX on StudentProfile {
  /// The state code in upper case, the way official portals write it.
  String get stateCode => state.toUpperCase();
}
