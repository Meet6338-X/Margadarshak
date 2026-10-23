/// The result of checking one student against one opportunity.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'eligibility_result.freezed.dart';
part 'eligibility_result.g.dart';

/// The verdict for one opportunity.
@freezed
abstract class EligibilityResult with _$EligibilityResult {
  /// Creates an eligibility result.
  const factory EligibilityResult({
    /// The opportunity this result belongs to.
    required String opportunityId,

    /// The overall verdict.
    required EligibilityStatus status,

    /// The outcome of every rule that was checked.
    @Default(<RuleOutcome>[]) List<RuleOutcome> outcomes,

    /// Profile fields that were missing and therefore blocked a verdict.
    @Default(<String>[]) List<String> missingFields,

    /// The official source link, copied here so a view can show it without
    /// loading the whole opportunity again.
    required String sourceUrl,

    /// The date the source was last verified.
    required DateTime lastVerifiedAt,
  }) = _EligibilityResult;

  /// Reads an eligibility result from JSON.
  factory EligibilityResult.fromJson(Map<String, Object?> json) =>
      _$EligibilityResultFromJson(json);
}

/// Convenience readers for an [EligibilityResult].
extension EligibilityResultX on EligibilityResult {
  /// Whether the student clearly qualifies.
  bool get isEligible => status == EligibilityStatus.eligible;

  /// Whether the student clearly does not qualify.
  bool get isNotEligible => status == EligibilityStatus.notEligible;

  /// Whether more information is needed before a verdict.
  bool get needsInfo => status == EligibilityStatus.needsInfo;

  /// The outcomes of the rules that blocked the opportunity.
  List<RuleOutcome> get blockingFailures => outcomes
      .where((outcome) => outcome.isBlocking && !outcome.passed)
      .toList(growable: false);
}

/// The outcome of one rule.
@freezed
abstract class RuleOutcome with _$RuleOutcome {
  /// Creates a rule outcome.
  const factory RuleOutcome({
    /// The identifier of the rule that produced this outcome.
    required String ruleId,

    /// The reason key explaining the rule.
    required String reasonKey,

    /// Whether the rule passed.
    required bool passed,

    /// Whether this rule blocks the whole opportunity.
    required bool isBlocking,

    /// The profile value that was compared, when there was one.
    String? actualValue,

    /// The values the rule was comparing against.
    @Default(<String>[]) List<String> expectedValues,
  }) = _RuleOutcome;

  /// Reads a rule outcome from JSON.
  factory RuleOutcome.fromJson(Map<String, Object?> json) =>
      _$RuleOutcomeFromJson(json);
}
