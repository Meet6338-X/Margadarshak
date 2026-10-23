/// Surfacing the deadlines a student is about to miss.
///
/// Missed application windows are the most expensive mistake a first-time
/// applicant can make, so the list is computed from the verified records
/// alone: no record appears here without a closing date in the pack.
library;

import '../models/opportunity.dart';

/// One opportunity closing soon, with the number of days left.
///
/// The [opportunity] is the record itself so the view can show the official
/// source and the apply link straight from the pack.
class DeadlineAlert {
  /// Creates a deadline alert.
  const DeadlineAlert({required this.opportunity, required this.daysLeft});

  /// The opportunity whose window is closing.
  final Opportunity opportunity;

  /// Whole days left before the window closes; `0` means it closes today.
  final int daysLeft;
}

/// Picks the opportunities whose application window closes soonest.
///
/// Records with no closing date are skipped: the honest answer to "when do I
/// have to apply?" for such a record is "check the official page", not a
/// guessed date.
class CollectDeadlineAlerts {
  /// Creates the use case.
  const CollectDeadlineAlerts({this.withinDays = 14});

  /// How far ahead the window must be for the record to count as urgent.
  final int withinDays;

  /// The records that close within [withinDays], soonest first.
  ///
  /// Records that have already closed are dropped, and a record that has not
  /// opened yet is also dropped: it is not urgent until the student can act.
  List<DeadlineAlert> call({
    required List<Opportunity> opportunities,
    required DateTime now,
  }) {
    final alerts = <DeadlineAlert>[];
    for (final opportunity in opportunities) {
      final daysLeft = opportunity.daysLeftToClose(now);
      if (daysLeft == null || daysLeft > withinDays) continue;
      if (!opportunity.isOpenOn(now)) continue;
      alerts.add(DeadlineAlert(opportunity: opportunity, daysLeft: daysLeft));
    }
    alerts.sort((a, b) {
      final byDays = a.daysLeft.compareTo(b.daysLeft);
      if (byDays != 0) return byDays;
      return a.opportunity.id.compareTo(b.opportunity.id);
    });
    return alerts;
  }
}
