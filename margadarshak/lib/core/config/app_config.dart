/// Build-time configuration.
///
/// Everything that differs between a developer machine, a pilot build and a
/// production build is read from `--dart-define` so that no secret ever has to
/// be committed to the repository.
library;

/// Central, immutable build configuration.
abstract final class AppConfig {
  /// Master switch for the Firebase back end.
  ///
  /// When `false` (the default) the app uses the local, offline
  /// implementations of every service, which is what the pilot build and the
  /// automated tests rely on.
  static const bool useFirebase = bool.fromEnvironment('USE_FIREBASE', defaultValue: false);

  /// Firebase Web API key.
  static const String firebaseApiKey = String.fromEnvironment('FIREBASE_API_KEY');

  /// Firebase application id.
  static const String firebaseAppId = String.fromEnvironment('FIREBASE_APP_ID');

  /// Firebase project id.
  static const String firebaseProjectId = String.fromEnvironment('FIREBASE_PROJECT_ID');

  /// Firebase messaging sender id.
  static const String firebaseMessagingSenderId = String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID');

  /// Firebase auth domain.
  static const String firebaseAuthDomain = String.fromEnvironment('FIREBASE_AUTH_DOMAIN');

  /// Base URL of the optional REST API that mirrors the data packs.
  ///
  /// Empty means "offline only"; the repository then serves the bundled,
  /// versioned JSON data packs.
  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL');

  /// Base URL of the Bhashini ASR/TTS service.
  static const String bhashiniBaseUrl = String.fromEnvironment('BHASHINI_BASE_URL');

  /// Base URL of the optional retrieval/LLM service.
  static const String llmBaseUrl = String.fromEnvironment('LLM_BASE_URL');

  /// The version of the bundled data pack.
  ///
  /// Bump this whenever the JSON assets change so that cached records can be
  /// invalidated and re-seeded.
  static const String dataPackVersion = String.fromEnvironment('DATA_PACK_VERSION', defaultValue: '2026.10');

  /// The languages the app ships content in.
  static const List<String> supportedLocales = <String>['en', 'hi', 'mr'];

  /// Whether the Firebase back end is both switched on and fully configured.
  static bool get isFirebaseConfigured =>
      useFirebase &&
      firebaseApiKey.isNotEmpty &&
      firebaseAppId.isNotEmpty &&
      firebaseProjectId.isNotEmpty;
}
