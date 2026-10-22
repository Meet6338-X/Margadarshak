/// Tests for the rules engine that decides eligibility.
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:margadarshak/domain/models/eligibility_result.dart';
import 'package:margadarshak/domain/models/enums.dart';
import 'package:margadarshak/domain/models/opportunity.dart';
import 'package:margadarshak/domain/use_cases/evaluate_eligibility.dart';

import '../support/fixtures.dart';

void main() {
  const evaluator = EvaluateEligibility();

  EligibilityRule categoryRule(List<String> values) => EligibilityRule(
        id: 'r_category',
        field: EligibilityField.socialCategory,
        operator: EligibilityOperator.oneOf,
        values: values,
        reasonKey: 'rule_category_obc',
      );

  group('EvaluateEligibility', () {
    test('is eligible when every blocking rule passes', () {
      final opportunity = buildOpportunity(
        eligibilityRules: <EligibilityRule>[categoryRule(<String>['obc', 'sc'])],
      );

      final result = evaluator.call(
        opportunity: opportunity,
        profile: buildProfile(),
      );

      expect(result.status, EligibilityStatus.eligible);
      expect(result.isEligible, isTrue);
      expect(result.outcomes, hasLength(1));
      expect(result.outcomes.first.passed, isTrue);
      expect(result.outcomes.first.reasonKey, 'rule_category_obc');
      expect(result.missingFields, isEmpty);
    });

    test('is not eligible when a blocking rule fails', () {
      final opportunity = buildOpportunity(
        eligibilityRules: <EligibilityRule>[categoryRule(<String>['sc'])],
      );

      final result = evaluator.call(
        opportunity: opportunity,
        profile: buildProfile(),
      );

      expect(result.status, EligibilityStatus.notEligible);
      expect(result.isNotEligible, isTrue);
      expect(result.outcomes.first.passed, isFalse);
      expect(result.blockingFailures, hasLength(1));
    });

    test('needs more information when a blocking field was never filled in', () {
      final opportunity = buildOpportunity(
        eligibilityRules: <EligibilityRule>[
          const EligibilityRule(
            id: 'r_district',
            field: EligibilityField.district,
            operator: EligibilityOperator.equals,
            values: <String>['pune'],
            reasonKey: 'rule_state_only',
          ),
        ],
      );

      final result = evaluator.call(
        opportunity: opportunity,
        profile: buildProfile(district: ''),
      );

      expect(result.status, EligibilityStatus.needsInfo);
      expect(result.needsInfo, isTrue);
      expect(result.missingFields, contains('district'));
    });

    test('a non blocking failure never changes the verdict', () {
      final opportunity = buildOpportunity(
        eligibilityRules: <EligibilityRule>[
          const EligibilityRule(
            id: 'r_soft',
            field: EligibilityField.socialCategory,
            operator: EligibilityOperator.equals,
            values: <String>['sc'],
            reasonKey: 'rule_category_sc',
            isBlocking: false,
          ),
        ],
      );

      final result = evaluator.call(
        opportunity: opportunity,
        profile: buildProfile(),
      );

      expect(result.status, EligibilityStatus.eligible);
      expect(result.outcomes.first.passed, isFalse);
    });

    test('checks the class range of the opportunity', () {
      final opportunity = buildOpportunity(minClass: 11, maxClass: 12);

      final passing = evaluator.call(
        opportunity: opportunity,
        profile: buildProfile(currentClass: 11),
      );
      final failing = evaluator.call(
        opportunity: opportunity,
        profile: buildProfile(currentClass: 9),
      );

      expect(passing.status, EligibilityStatus.eligible);
      expect(
        passing.outcomes.any((o) => o.ruleId == 'class_range'),
        isTrue,
      );
      expect(failing.status, EligibilityStatus.notEligible);
    });

    test('compares income bands by rank, not by name', () {
      final opportunity = buildOpportunity(
        eligibilityRules: <EligibilityRule>[
          const EligibilityRule(
            id: 'r_income',
            field: EligibilityField.incomeBand,
            operator: EligibilityOperator.atMost,
            values: <String>['1lakh_2_5lakh'],
            reasonKey: 'rule_income_at_most',
          ),
        ],
      );

      final low = evaluator.call(
        opportunity: opportunity,
        profile: buildProfile(incomeBand: IncomeBand.belowOneLakh),
      );
      final high = evaluator.call(
        opportunity: opportunity,
        profile: buildProfile(incomeBand: IncomeBand.aboveFiveLakh),
      );

      expect(low.status, EligibilityStatus.eligible);
      expect(high.status, EligibilityStatus.notEligible);
    });

    test('handles the first generation learner flag', () {
      final opportunity = buildOpportunity(
        eligibilityRules: <EligibilityRule>[
          const EligibilityRule(
            id: 'r_first_gen',
            field: EligibilityField.firstGenerationLearner,
            operator: EligibilityOperator.equals,
            values: <String>['yes'],
            reasonKey: 'rule_first_generation',
          ),
        ],
      );

      final yes = evaluator.call(
        opportunity: opportunity,
        profile: buildProfile(firstGenerationLearner: true),
      );
      final no = evaluator.call(
        opportunity: opportunity,
        profile: buildProfile(firstGenerationLearner: false),
      );

      expect(yes.status, EligibilityStatus.eligible);
      expect(no.status, EligibilityStatus.notEligible);
    });

    test('always points back at the official source', () {
      final opportunity = buildOpportunity();
      final result = evaluator.call(
        opportunity: opportunity,
        profile: buildProfile(),
      );

      expect(result.sourceUrl, 'https://example.gov.in/test');
      expect(result.lastVerifiedAt, DateTime(2026, 9, 1));
    });
  });
}
