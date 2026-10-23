/// A piece of text that exists in every language the app ships.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'localized_text.freezed.dart';
part 'localized_text.g.dart';

/// Multi-language text used by every data pack record.
///
/// The English text is the source of truth; the other languages are optional so
/// that a partially translated pack still renders.
@freezed
abstract class LocalizedText with _$LocalizedText {
  /// Creates a localized text bundle.
  const factory LocalizedText({
    /// The English text, always present.
    required String en,

    /// The Hindi text.
    String? hi,

    /// The Marathi text.
    String? mr,
  }) = _LocalizedText;

  /// Reads a localized text bundle from JSON.
  factory LocalizedText.fromJson(Map<String, Object?> json) =>
      _$LocalizedTextFromJson(json);

}

/// Convenience readers for a [LocalizedText].
extension LocalizedTextX on LocalizedText {
  /// Returns the text for [languageCode], falling back to English.
  String resolve(String languageCode) => switch (languageCode) {
        'hi' => hi ?? en,
        'mr' => mr ?? en,
        _ => en,
      };

  /// Whether this bundle has a translation for [languageCode].
  bool hasTranslation(String languageCode) => switch (languageCode) {
        'hi' => hi != null && hi!.isNotEmpty,
        'mr' => mr != null && mr!.isNotEmpty,
        _ => true,
      };
}
