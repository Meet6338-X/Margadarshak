/// Tests for the deadline alerts.
library;

import 'package:flutter_test/flutter_test.dart';

import 'package:margadarshak/domain/use_cases/collect_deadline_alerts.dart';

import '../support/fixtures.dart';

void main() {
  const collector = CollectDeadlineAlerts();
  final now = DateTime(2026, 10, 22);

  test('keeps a record that closes today', () {
    final alerts = collector(
      opportunities: [
        buildOpportunity(id: 'closing_today', applicationClosesAt: DateTime(2026, 10, 22)),
      ],
      now: now,
    );

    expect(alerts, hasLength(1));
    expect(alerts.first.daysLeft, 0);
  });

  test('drops records with no closing date and records already closed', () {
    final alerts = collector(
      opportunities: [
        buildOpportunity(id: 'no_window'),
        buildOpportunity(
          id: 'closed_yesterday',
          applicationClosesAt: DateTime(2026, 10, 21),
        ),
      ],
      now: now,
    );

    expect(alerts, isEmpty);
  });

  test('drops records that have not opened yet', () {
    final alerts = collector(
      opportunities: [
        buildOpportunity(
          id: 'opens_next_week',
          applicationOpensAt: DateTime(2026, 11, 1),
          applicationClosesAt: DateTime(2026, 11, 20),
        ),
      ],
      now: now,
    );

    expect(alerts, isEmpty);
  });

  test('sorts soonest first and honours the horizon', () {
    final alerts = const CollectDeadlineAlerts(withinDays: 14)(
      opportunities: [
        buildOpportunity(id: 'far', applicationClosesAt: DateTime(2026, 12, 31)),
        buildOpportunity(id: 'soon', applicationClosesAt: DateTime(2026, 10, 30)),
        buildOpportunity(id: 'urgent', applicationClosesAt: DateTime(2026, 10, 25)),
        buildOpportunity(id: 'horizon_edge', applicationClosesAt: DateTime(2026, 11, 5)),
      ],
      now: now,
    );

    expect(alerts.map((a) => a.opportunity.id).toList(), <String>[
      'urgent',
      'soon',
      'horizon_edge',
    ]);
    expect(alerts.map((a) => a.daysLeft).toList(), <int>[3, 8, 14]);
  });

  test('ties break by identifier so the order is stable', () {
    final alerts = collector(
      opportunities: [
        buildOpportunity(id: 'scheme_b', applicationClosesAt: DateTime(2026, 10, 25)),
        buildOpportunity(id: 'scheme_a', applicationClosesAt: DateTime(2026, 10, 25)),
      ],
      now: now,
    );

    expect(alerts.map((a) => a.opportunity.id).toList(), <String>['scheme_a', 'scheme_b']);
  });
}
