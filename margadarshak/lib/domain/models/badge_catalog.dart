/// The badges a student can earn, with the words that describe them.
library;

import 'localized_text.dart';

/// The definition of one badge.
class BadgeDefinition {
  /// Creates a definition.
  const BadgeDefinition({
    required this.id,
    required this.label,
    required this.description,
  });

  /// The stable identifier used in the stored progress.
  final String id;

  /// The name of the badge.
  final LocalizedText label;

  /// What earned the badge.
  final LocalizedText description;
}

/// Every badge the app can award.
abstract final class BadgeCatalog {
  /// Awarded after three days in a row.
  static const BadgeDefinition streakThree = BadgeDefinition(
    id: 'badge_streak_3',
    label: LocalizedText(
      en: 'Three day streak',
      hi: 'तीन दिन की लगातार स्ट्रीक',
      mr: 'तीन दिवसांची सतत मालिका',
    ),
    description: LocalizedText(
      en: 'You came back three days in a row.',
      hi: 'आप तीन दिन लगातार आए।',
      mr: 'तुम्ही तीन दिवस सतत आलात.',
    ),
  );

  /// Awarded after seven days in a row.
  static const BadgeDefinition streakSeven = BadgeDefinition(
    id: 'badge_streak_7',
    label: LocalizedText(
      en: 'Seven day streak',
      hi: 'सात दिन की लगातार स्ट्रीक',
      mr: 'सात दिवसांची सतत मालिका',
    ),
    description: LocalizedText(
      en: 'One full week of learning.',
      hi: 'पूरे सप्ताह का सीखना।',
      mr: 'संपूर्ण आठवड्याचे अध्ययन.',
    ),
  );

  /// Awarded after collecting fifty points.
  static const BadgeDefinition pointsFifty = BadgeDefinition(
    id: 'badge_points_50',
    label: LocalizedText(
      en: 'Fifty points',
      hi: 'पचास अंक',
      mr: 'पन्नास अंक',
    ),
    description: LocalizedText(
      en: 'You put in fifty points of effort.',
      hi: 'आपने पचास अंकों का प्रयास किया।',
      mr: 'तुम्ही पन्नास अंकांचा प्रयास केला.',
    ),
  );

  /// Every definition, in the order they are shown.
  static const List<BadgeDefinition> all = <BadgeDefinition>[
    streakThree,
    streakSeven,
    pointsFifty,
  ];

  /// The definition with [id], or `null`.
  static BadgeDefinition? byId(String id) {
    for (final definition in all) {
      if (definition.id == id) return definition;
    }
    return null;
  }
}
