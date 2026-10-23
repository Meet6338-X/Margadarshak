/// Tests for the career ranking.
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:margadarshak/domain/models/career.dart';
import 'package:margadarshak/domain/use_cases/discover_careers.dart';

import '../support/fixtures.dart';

void main() {
  const discover = DiscoverCareers();

  group('DiscoverCareers', () {
    test('ranks the careers that match the interests first', () {
      final nurse = buildCareer(
        id: 'career_nurse',
        interestTags: <String>['health'],
      );
      final teacher = buildCareer(
        id: 'career_teacher',
        interestTags: <String>['teaching'],
      );

      final matches = discover(
        profile: buildProfile(interests: <String>{'health'}),
        careers: <Career>[nurse, teacher],
      );

      expect(matches.first.career.id, 'career_nurse');
      expect(matches.first.score, greaterThan(matches.last.score));
      expect(matches.first.matchedTags, contains('health'));
    });

    test('keeps the careers with a zero score so nothing is hidden', () {
      final matches = discover(
        profile: buildProfile(interests: <String>{'health'}),
        careers: <Career>[
          buildCareer(id: 'career_other', category: 'trades', interestTags: <String>['driving']),
        ],
      );

      expect(matches, hasLength(1));
      expect(matches.first.score, 0);
    });

    test('never penalises a non stem or a local path', () {
      final matches = discover(
        profile: buildProfile(interests: const <String>{}),
        careers: <Career>[
          buildCareer(id: 'career_trades', nonStem: true),
          buildCareer(id: 'career_craft', localTraditionalSkill: true),
          buildCareer(id: 'career_plain'),
        ],
      );

      final trades = matches.firstWhere((m) => m.career.id == 'career_trades');
      final craft = matches.firstWhere((m) => m.career.id == 'career_craft');
      final plain = matches.firstWhere((m) => m.career.id == 'career_plain');

      expect(trades.score, greaterThan(plain.score));
      expect(craft.score, greaterThan(plain.score));
    });
  });
}
