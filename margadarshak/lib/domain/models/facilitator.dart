/// Facilitator mode: the class list, the talent flags and published modules.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';
import 'localized_text.dart';

part 'facilitator.freezed.dart';
part 'facilitator.g.dart';

/// A class that a facilitator looks after.
@freezed
abstract class FacilitatorClass with _$FacilitatorClass {
  /// Creates a class record.
  const factory FacilitatorClass({
    /// The stable identifier.
    required String classId,

    /// The facilitator who owns this class.
    required String facilitatorId,

    /// The name of the class, for example `Class 9-A`.
    required String name,

    /// The school or institution.
    required String schoolName,

    /// The state code.
    required String state,

    /// The district.
    required String district,

    /// The students in the class.
    @Default(<RosterStudent>[]) List<RosterStudent> students,

    /// When the class was created.
    required DateTime createdAt,
  }) = _FacilitatorClass;

  /// Reads a class record from JSON.
  factory FacilitatorClass.fromJson(Map<String, Object?> json) =>
      _$FacilitatorClassFromJson(json);
}

/// One student inside a facilitator's class.
@freezed
abstract class RosterStudent with _$RosterStudent {
  /// Creates a roster student.
  const factory RosterStudent({
    /// The student's identifier, the same one used in their own profile.
    required String studentId,

    /// The student's name.
    required String displayName,

    /// How far along the student is.
    required EducationStage stage,

    /// The current class number.
    required int currentClass,

    /// The social category.
    required SocialCategory category,

    /// The family income band.
    required IncomeBand incomeBand,

    /// Gender.
    required Gender gender,

    /// Whether nobody in the family has gone to college.
    required bool firstGenerationLearner,

    /// The interests the facilitator tagged.
    @Default(<String>[]) List<String> interestTags,

    /// Whether the facilitator flagged this student as talented.
    required bool isFlagged,

    /// Opportunities the facilitator recommended to this student.
    @Default(<String>[]) List<String> recommendedOpportunityIds,

    /// When the student joined the class.
    required DateTime joinedOn,
  }) = _RosterStudent;

  /// Reads a roster student from JSON.
  factory RosterStudent.fromJson(Map<String, Object?> json) =>
      _$RosterStudentFromJson(json);
}

/// A module a facilitator published.
@freezed
abstract class PublishedModule with _$PublishedModule {
  /// Creates a published module.
  const factory PublishedModule({
    /// The stable identifier.
    required String moduleId,

    /// The module title.
    required String title,

    /// What the module covers.
    required LocalizedText description,

    /// How the module is sold.
    required ModulePricing pricing,

    /// The price in rupees. Zero for free modules.
    required int priceInRupees,

    /// How long the module takes.
    required int durationMinutes,

    /// The clips the module is built from.
    @Default(<String>[]) List<String> clipIds,

    /// The facilitator who published it.
    required String ownerFacilitatorId,

    /// When it was published.
    required DateTime publishedOn,
  }) = _PublishedModule;

  /// Reads a published module from JSON.
  factory PublishedModule.fromJson(Map<String, Object?> json) =>
      _$PublishedModuleFromJson(json);
}
