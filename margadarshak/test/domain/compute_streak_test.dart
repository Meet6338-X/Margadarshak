/// Tests for the streak counter and its freezes.
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:margadarshak/domain/use_cases/compute_streak.dart';

void main() {
  const compute = ComputeStreak();

  group('ComputeStreak', () {
    test('counts consecutive days', () {
      final streak = compute(
        completedDates: <String>{
          '2026-10-01',
          '2026-10-02',
          '2026-10-03',
        },
        now: DateTime(2026, 10, 3),
      );

      expect(streak.currentDays, 3);
      expect(streak.longestDays, 3);
      expect(streak.freezesUsed, 0);
    });

    test('a single missed day is covered by a freeze', () {
      final streak = compute(
        completedDates: <String>{'2026-10-01', '2026-10-02', '2026-10-04'},
        now: DateTime(2026, 10, 4),
      );

      expect(streak.currentDays, 3);
      expect(streak.freezesUsed, 1);
      expect(streak.freezesAvailable, 1);
    });

    test('a missed day at the end is covered by a freeze', () {
      final streak = compute(
        completedDates: <String>{'2026-10-01'},
        now: DateTime(2026, 10, 4),
        freezesAvailable: 2,
      );

      expect(streak.currentDays, 1);
      expect(streak.freezesUsed, 2);
      expect(streak.freezesAvailable, 0);
    });

    test('the streak resets once the freezes run out', () {
      final streak = compute(
        completedDates: <String>{'2026-10-01'},
        now: DateTime(2026, 10, 6),
        freezesAvailable: 2,
      );

      expect(streak.currentDays, 0);
    });

    test('an empty history means no streak at all', () {
      final streak = compute(
        completedDates: const <String>{},
        now: DateTime(2026, 10, 6),
      );

      expect(streak.currentDays, 0);
      expect(streak.freezesUsed, 0);
      expect(streak.freezesAvailable, 2);
    });

    test('never forgets the longest run', () {
      final streak = compute(
        completedDates: <String>{'2026-10-10'},
        now: DateTime(2026, 10, 10),
        previousLongestDays: 12,
      );

      expect(streak.currentDays, 1);
      expect(streak.longestDays, 12);
    });
  });
}
