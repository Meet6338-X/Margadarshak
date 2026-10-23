/// Tests for the ranked list of opportunities.
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:margadarshak/domain/models/eligibility_result.dart';
import 'package:margadarshak/domain/models/enums.dart';
import 'package:margadarshak/domain/models/opportunity.dart';
import 'package:margadarshak/domain/use_cases/recommend_opportunities.dart';

import '../support/fixtures.dart';

void main() {
  const recommend = RecommendOpportunities();

  EligibilityRule categoryRule(List<String> values) => EligibilityRule(
        id: 'r_category',
        field: EligibilityField.socialCategory,
        operator: EligibilityOperator.oneOf,
        values: values,
        reasonKey: 'rule_category_obc',
      );

  group('RecommendOpportunities', () {
    test('drops the opportunities the student clearly cannot use', () {
      final eligible = buildOpportunity(
        id: 'opp_ok',
        eligibilityRules: <EligibilityRule>[categoryRule(<String>['obc'])],
      );
      final blocked = buildOpportunity(
        id: 'opp_no',
        eligibilityRules: <EligibilityRule>[categoryRule(<String>['sc'])],
      );

      final result = recommend(
        profile: buildProfile(),
        opportunities: <Opportunity>[eligible, blocked],
      );

      expect(result, hasLength(1));
      expect(result.first.opportunity.id, 'opp_ok');
    });

    test('keeps the opportunities that still need information', () {
      final needsInfo = buildOpportunity(
        id: 'opp_unknown',
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

      final result = recommend(
        profile: buildProfile(district: ''),
        opportunities: <Opportunity>[needsInfo],
      );

      expect(result, hasLength(1));
      expect(result.first.eligibility.needsInfo, isTrue);
    });

    test('puts the verified match before the one that needs information', () {
      final needsInfo = buildOpportunity(
        id: 'opp_unknown',
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
      final eligible = buildOpportunity(
        id: 'opp_ok',
        eligibilityRules: <EligibilityRule>[categoryRule(<String>['obc'])],
      );

      final result = recommend(
        profile: buildProfile(district: ''),
        opportunities: <Opportunity>[needsInfo, eligible],
      );

      expect(result.first.opportunity.id, 'opp_ok');
    });

    test('a scheme from the students own state outranks a national one', () {
      final national = buildOpportunity(
        id: 'opp_national',
        scope: 'national',
        eligibilityRules: <EligibilityRule>[categoryRule(<String>['obc'])],
      );
      final state = buildOpportunity(
        id: 'opp_state',
        scope: 'mh',
        eligibilityRules: <EligibilityRule>[categoryRule(<String>['obc'])],
      );

      final result = recommend(
        profile: buildProfile(state: 'mh'),
        opportunities: <Opportunity>[national, state],
      );

      expect(result.first.opportunity.id, 'opp_state');
      expect(
        result.first.relevanceScore,
        greaterThan(result.last.relevanceScore),
      );
    });
  });
}
