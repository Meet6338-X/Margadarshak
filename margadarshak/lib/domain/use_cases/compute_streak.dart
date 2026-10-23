/// Computes the streak, with a freeze so a missed day costs nothing.
library;

import '../../core/utils/date_x.dart';
import '../models/progress.dart';

/// Turns the set of completed days into a [Streak].
class ComputeStreak {
  /// Creates the use case.
  const ComputeStreak();

  /// Computes the streak for the days in [completedDates].
  ///
  /// A gap of exactly one missed day is covered by a freeze, as long as the
  /// student still has one. When the freezes run out the streak resets, which
  /// is the only way progress can be lost.
  Streak call({
    required Set<String> completedDates,
    required DateTime now,
    int freezesAvailable = 2,
    int previousLongestDays = 0,
  }) {
    if (completedDates.isEmpty) {
      return Streak(
        currentDays: 0,
        longestDays: previousLongestDays,
        freezesAvailable: freezesAvailable,
        freezesUsed: 0,
      );
    }

    final days = completedDates
        .map(DateTime.tryParse)
        .whereType<DateTime>()
        .map((day) => day.dateOnly)
        .toSet()
        .toList(growable: false)
      ..sort((a, b) => b.compareTo(a));

    var consumed = 0;
    var streak = 0;
    DateTime? previous;

    for (final day in days) {
      if (previous == null) {
        streak = 1;
        previous = day;
        continue;
      }
      final gap = previous.difference(day).inDays;
      if (gap == 1) {
        streak += 1;
        previous = day;
        continue;
      }
      if (gap == 2 && consumed < freezesAvailable) {
        consumed += 1;
        streak += 1;
        previous = day;
        continue;
      }
      break;
    }

    final today = now.dateOnly;
    final gapToToday = today.difference(days.first).inDays;
    if (gapToToday > 1) {
      final missed = gapToToday - 1;
      if (missed <= freezesAvailable - consumed) {
        consumed += missed;
      } else {
        streak = 0;
      }
    }

    final longest = previousLongestDays > streak ? previousLongestDays : streak;

    return Streak(
      currentDays: streak,
      longestDays: longest,
      lastCompletedOn: days.first,
      freezesAvailable: freezesAvailable - consumed,
      freezesUsed: consumed,
    );
  }
}
