/// Tests for the personalised explanation.
///
/// The explanation must never say more than the records support, and it must
/// refuse when nothing verified matches.
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:margadarshak/domain/models/enums.dart';
import 'package:margadarshak/domain/models/opportunity.dart';
import 'package:margadarshak/domain/use_cases/build_explanation.dart';

import '../support/fixtures.dart';

void main() {
  const build = BuildExplanation();

  EligibilityRule categoryRule(List<String> values) => EligibilityRule(
        id: 'r_category',
        field: EligibilityField.socialCategory,
        operator: EligibilityOperator.oneOf,
        values: values,
        reasonKey: 'rule_category_obc',
      );

  group('BuildExplanation', () {
    test('cites the records it used', () {
      final opportunity = buildOpportunity(
        id: 'opp_verified',
        eligibilityRules: <EligibilityRule>[categoryRule(<String>['obc'])],
        requiredDocuments: <DocumentRequirement>[buildDocument()],
      );

      final explanation = build(
        profile: buildProfile(),
        opportunities: <Opportunity>[opportunity],
        languageCode: 'mr',
      );

      expect(explanation.hasVerifiedMatch, isTrue);
      expect(explanation.citedOpportunityIds, <String>['opp_verified']);
      expect(explanation.text, contains('Test opportunity'));
      expect(explanation.nextSteps, isNotEmpty);
    });

    test('refuses when nothing verified matches', () {
      final opportunity = buildOpportunity(
        id: 'opp_blocked',
        eligibilityRules: <EligibilityRule>[categoryRule(<String>['sc'])],
      );

      final explanation = build(
        profile: buildProfile(),
        opportunities: <Opportunity>[opportunity],
        languageCode: 'mr',
      );

      expect(explanation.hasVerifiedMatch, isFalse);
      expect(explanation.citedOpportunityIds, isEmpty);
      expect(explanation.text, isEmpty);
      expect(explanation.nextSteps, isEmpty);
    });

    test('never cites a record the student does not qualify for', () {
      final verified = buildOpportunity(
        id: 'opp_verified',
        eligibilityRules: <EligibilityRule>[categoryRule(<String>['obc'])],
      );
      final blocked = buildOpportunity(
        id: 'opp_blocked',
        eligibilityRules: <EligibilityRule>[categoryRule(<String>['sc'])],
      );

      final explanation = build(
        profile: buildProfile(),
        opportunities: <Opportunity>[verified, blocked],
        languageCode: 'mr',
      );

      expect(explanation.citedOpportunityIds, <String>['opp_verified']);
    });

    test('quotes at most three records', () {
      final opportunities = List<Opportunity>.generate(
        6,
        (index) => buildOpportunity(
          id: 'opp_$index',
          eligibilityRules: <EligibilityRule>[categoryRule(<String>['obc'])],
        ),
      );

      final explanation = build(
        profile: buildProfile(),
        opportunities: opportunities,
        languageCode: 'mr',
      );

      expect(explanation.citedOpportunityIds, hasLength(3));
    });
  });
}
