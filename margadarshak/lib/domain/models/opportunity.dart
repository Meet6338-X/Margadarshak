/// Opportunities: scholarships, schemes, examinations and apprenticeships.
///
/// Every record in this file carries an official source link and the date it
/// was last verified. The app never shows an opportunity that does not have
/// both, which is what makes "no fabricated schemes" enforceable.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';
import 'localized_text.dart';

part 'opportunity.freezed.dart';
part 'opportunity.g.dart';

/// A scholarship, scheme, examination or apprenticeship.
@freezed
abstract class Opportunity with _$Opportunity {
  /// Creates an opportunity record.
  const factory Opportunity({
    /// The stable identifier, unique across all data packs.
    required String id,

    /// What kind of opportunity this is.
    required OpportunityKind kind,

    /// The opportunity name.
    required LocalizedText title,

    /// A short explanation of what the opportunity gives.
    required LocalizedText summary,

    /// The name of the body that publishes the opportunity.
    required String officialSourceName,

    /// The link to the official page. Mandatory — an opportunity without one
    /// is never shown to a student.
    required String officialSourceUrl,

    /// The date a human last checked the official page.
    required DateTime lastVerifiedAt,

    /// `national` or a state code such as `mh`.
    required String scope,

    /// The rules that decide whether a student qualifies.
    @Default(<EligibilityRule>[]) List<EligibilityRule> eligibilityRules,

    /// The documents a student has to collect.
    @Default(<DocumentRequirement>[]) List<DocumentRequirement> requiredDocuments,

    /// When applications open, if the record has a window.
    DateTime? applicationOpensAt,

    /// When applications close, if the record has a window.
    DateTime? applicationClosesAt,

    /// Interest and career tags used for ranking.
    @Default(<String>[]) List<String> categories,

    /// Career ids this opportunity leads towards.
    @Default(<String>[]) List<String> careerIds,

    /// The lowest class the student may be in.
    int? minClass,

    /// The highest class the student may be in.
    int? maxClass,

    /// Whether the official page states an amount. When it does not, the app
    /// says so instead of guessing.
    required bool amountDisclosed,

    /// The page where the student actually submits the application, when the
    /// official portal separates it from the information page. When it is
    /// absent the app sends the student to the official source itself.
    String? applyUrl,

    /// The concrete steps of the application flow, when the official source
    /// publishes them as steps. An empty list means the app shows only the
    /// link and the document checklist.
    @Default(<LocalizedText>[]) List<LocalizedText> applySteps,
  }) = _Opportunity;

  /// Reads an opportunity from JSON.
  factory Opportunity.fromJson(Map<String, Object?> json) =>
      _$OpportunityFromJson(json);
}

/// Convenience readers for an [Opportunity].
extension OpportunityX on Opportunity {
  /// The official source link as a [Uri], or `null` when it cannot be parsed.
  Uri? get officialUri => Uri.tryParse(officialSourceUrl);

  /// The page a student should start the application at: the dedicated apply
  /// page when the record has one, otherwise the official source.
  Uri? get applyUri => Uri.tryParse(applyUrl ?? officialSourceUrl);

  /// Whether the application window is currently open.
  bool isOpenOn(DateTime now) {
    final opens = applicationOpensAt;
    final closes = applicationClosesAt;
    if (opens != null && now.isBefore(opens)) return false;
    if (closes != null && now.isAfter(closes)) return false;
    return true;
  }

  /// The number of days left before the window closes, or `null` when the
  /// opportunity has no closing date.
  int? daysLeftToClose(DateTime now) {
    final closes = applicationClosesAt;
    if (closes == null) return null;
    final difference = closes.difference(now).inDays;
    return difference < 0 ? 0 : difference;
  }
}

/// A single, machine-checkable eligibility rule.
///
/// Rules are plain data so that they can be unit tested in isolation and so
/// that a facilitator or a partner can add a rule without touching code.
@freezed
abstract class EligibilityRule with _$EligibilityRule {
  /// Creates an eligibility rule.
  const factory EligibilityRule({
    /// The stable identifier of this rule inside its opportunity.
    required String id,

    /// The profile field the rule inspects.
    required EligibilityField field,

    /// The comparison the rule performs.
    required EligibilityOperator operator,

    /// The values the rule compares against.
    @Default(<String>[]) List<String> values,

    /// The reason shown when the rule fails.
    required String reasonKey,

    /// Whether failing this rule blocks the whole opportunity.
    @Default(true) bool isBlocking,
  }) = _EligibilityRule;

  /// Reads an eligibility rule from JSON.
  factory EligibilityRule.fromJson(Map<String, Object?> json) =>
      _$EligibilityRuleFromJson(json);
}

/// A document the student has to collect before applying.
@freezed
abstract class DocumentRequirement with _$DocumentRequirement {
  /// Creates a document requirement.
  const factory DocumentRequirement({
    /// The stable identifier.
    required String id,

    /// The name of the document.
    required LocalizedText label,

    /// Where and how to get it.
    required LocalizedText whereToGet,

    /// Whether the application cannot proceed without it.
    required bool isMandatory,

    /// The careers this document is needed for.
    @Default(<String>[]) List<String> careerIds,
  }) = _DocumentRequirement;

  /// Reads a document requirement from JSON.
  factory DocumentRequirement.fromJson(Map<String, Object?> json) =>
      _$DocumentRequirementFromJson(json);
}
