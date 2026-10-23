/// The names of the states the app ships data packs for.
library;

/// A state the app knows about, with its name in every supported language.
class AppState {
  /// Creates the entry.
  const AppState({required this.code, required this.names});

  /// The two letter code used in the data packs.
  final String code;

  /// The name of the state per language code.
  final Map<String, String> names;

  /// The name of the state in [languageCode].
  String name(String languageCode) => names[languageCode] ?? names['en'] ?? code;
}

/// The states a new student can pick from.
const List<AppState> appStates = <AppState>[
  AppState(
    code: 'mh',
    names: <String, String>{'en': 'Maharashtra', 'hi': 'महाराष्ट्र', 'mr': 'महाराष्ट्र'},
  ),
  AppState(
    code: 'bi',
    names: <String, String>{'en': 'Bihar', 'hi': 'बिहार', 'mr': 'बिहार'},
  ),
];
