/// The eligibility rules engine.
///
/// This is deliberately plain Dart with no network calls and no model calls:
/// eligibility is decided by rules against a source-linked list, so the app
/// cannot invent a scheme.
library;

import '../models/eligibility_result.dart';
import '../models/enums.dart';
import '../models/opportunity.dart';
import '../models/student_profile.dart';

/// Checks a student profile against the rules of one opportunity.
class EvaluateEligibility {
  /// Creates the evaluator.
  const EvaluateEligibility();

  /// Checks [profile] against [opportunity] and returns the verdict.
  EligibilityResult call({
    required Opportunity opportunity,
    required StudentProfile profile,
  }) {
    final outcomes = <RuleOutcome>[];
    final missingFields = <String>{};
    var blockingFailure = false;
    var blockingMissing = false;

    for (final rule in opportunity.eligibilityRules) {
      final evaluated = _evaluateRule(rule, profile);
      outcomes.add(evaluated.outcome);
      if (!evaluated.outcome.passed && evaluated.outcome.isBlocking) {
        if (evaluated.isMissing) {
          blockingMissing = true;
          missingFields.add(rule.field.code);
        } else {
          blockingFailure = true;
        }
      }
    }

    final classOutcome = _evaluateClassRange(opportunity, profile);
    if (classOutcome != null) {
      outcomes.add(classOutcome);
      if (!classOutcome.passed) blockingFailure = true;
    }

    final status = switch ((blockingFailure, blockingMissing)) {
      (true, _) => EligibilityStatus.notEligible,
      (false, true) => EligibilityStatus.needsInfo,
      (false, false) => EligibilityStatus.eligible,
    };

    return EligibilityResult(
      opportunityId: opportunity.id,
      status: status,
      outcomes: outcomes,
      missingFields: missingFields.toList(growable: false),
      sourceUrl: opportunity.officialSourceUrl,
      lastVerifiedAt: opportunity.lastVerifiedAt,
    );
  }

  RuleOutcome? _evaluateClassRange(Opportunity opportunity, StudentProfile profile) {
    final min = opportunity.minClass;
    final max = opportunity.maxClass;
    if (min == null && max == null) return null;

    final classNumber = profile.currentClass;
    final withinMin = min == null || classNumber >= min;
    final withinMax = max == null || classNumber <= max;
    final passed = withinMin && withinMax;

    return RuleOutcome(
      ruleId: 'class_range',
      reasonKey: 'rule_class_range',
      passed: passed,
      isBlocking: true,
      actualValue: '$classNumber',
      expectedValues: [
        if (min != null) 'from $min',
        if (max != null) 'to $max',
      ],
    );
  }

  ({RuleOutcome outcome, bool isMissing}) _evaluateRule(
    EligibilityRule rule,
    StudentProfile profile,
  ) {
    final value = _resolve(rule.field, profile);

    switch (value) {
      case _MissingField():
        return (
          outcome: RuleOutcome(
            ruleId: rule.id,
            reasonKey: rule.reasonKey,
            passed: false,
            isBlocking: rule.isBlocking,
            actualValue: null,
            expectedValues: rule.values,
          ),
          isMissing: true,
        );
      case _FieldValue(:final code, :final numeric):
        final passed = _compare(rule, code, numeric);
        return (
          outcome: RuleOutcome(
            ruleId: rule.id,
            reasonKey: rule.reasonKey,
            passed: passed,
            isBlocking: rule.isBlocking,
            actualValue: code,
            expectedValues: rule.values,
          ),
          isMissing: false,
        );
    }
  }

  bool _compare(EligibilityRule rule, String code, int? numeric) {
    switch (rule.operator) {
      case EligibilityOperator.equals:
      case EligibilityOperator.oneOf:
        return rule.values.any((value) => value.toLowerCase() == code.toLowerCase());
      case EligibilityOperator.atMost:
        final threshold = _numericThreshold(rule, numeric);
        return threshold != null && numeric != null && numeric <= threshold;
      case EligibilityOperator.atLeast:
        final threshold = _numericThreshold(rule, numeric);
        return threshold != null && numeric != null && numeric >= threshold;
    }
  }

  int? _numericThreshold(EligibilityRule rule, int? numeric) {
    if (rule.values.isEmpty) return null;
    final raw = rule.values.first;
    if (rule.field == EligibilityField.incomeBand) {
      return IncomeBand.fromCode(raw).rank;
    }
    return int.tryParse(raw);
  }

  _ProfileField _resolve(EligibilityField field, StudentProfile profile) {
    switch (field) {
      case EligibilityField.educationStage:
        return _FieldValue(profile.stage.code);
      case EligibilityField.currentClass:
        if (profile.currentClass <= 0) return const _MissingField();
        return _FieldValue('${profile.currentClass}', profile.currentClass);
      case EligibilityField.incomeBand:
        return _FieldValue(profile.incomeBand.code, profile.incomeBand.rank);
      case EligibilityField.socialCategory:
        return _FieldValue(profile.category.code);
      case EligibilityField.gender:
        return _FieldValue(profile.gender.code);
      case EligibilityField.state:
        if (profile.state.trim().isEmpty) return const _MissingField();
        return _FieldValue(profile.state.trim().toLowerCase());
      case EligibilityField.district:
        if (profile.district.trim().isEmpty) return const _MissingField();
        return _FieldValue(profile.district.trim().toLowerCase());
      case EligibilityField.firstGenerationLearner:
        return _FieldValue(profile.firstGenerationLearner ? 'yes' : 'no');
    }
  }
}

/// What a rule looked at: either a value, or the fact that it is missing.
sealed class _ProfileField {
  const _ProfileField();
}

/// A profile field that has a value.
final class _FieldValue extends _ProfileField {
  const _FieldValue(this.code, [this.numeric]);

  /// The comparable value.
  final String code;

  /// The numeric value, when the field is numeric.
  final int? numeric;
}

/// A profile field the student has not told us yet.
final class _MissingField extends _ProfileField {
  const _MissingField();
}
