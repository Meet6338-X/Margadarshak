/// The personalised explanation of a recommendation.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'explanation.freezed.dart';
part 'explanation.g.dart';

/// A written explanation of why an opportunity was recommended.
///
/// The explanation always cites the records it was written from. When there is
/// no verified match, [hasVerifiedMatch] is `false` and the text says so —
/// the app refuses rather than inventing a scheme.
@freezed
abstract class Explanation with _$Explanation {
  /// Creates an explanation.
  const factory Explanation({
    /// The explanation text, in the requested language.
    required String text,

    /// The identifiers of the records the explanation was written from.
    @Default(<String>[]) List<String> citedOpportunityIds,

    /// The concrete next steps the student should take.
    @Default(<String>[]) List<String> nextSteps,

    /// Whether a verified match exists.
    required bool hasVerifiedMatch,

    /// The language the text is written in.
    required String languageCode,

    /// When the explanation was written.
    required DateTime generatedAt,
  }) = _Explanation;

  /// Reads an explanation from JSON.
  factory Explanation.fromJson(Map<String, Object?> json) =>
      _$ExplanationFromJson(json);
}
