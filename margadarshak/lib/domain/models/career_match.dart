/// A career together with the reason it was suggested.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'career.dart';

part 'career_match.freezed.dart';
part 'career_match.g.dart';

/// A career from the catalogue, scored against a student profile.
@freezed
abstract class CareerMatch with _$CareerMatch {
  /// Creates a career match.
  const factory CareerMatch({
    /// The career itself.
    required Career career,

    /// How strongly it matches, higher is better.
    required int score,

    /// The interest tags that matched.
    @Default(<String>[]) List<String> matchedTags,
  }) = _CareerMatch;

  /// Reads a career match from JSON.
  factory CareerMatch.fromJson(Map<String, Object?> json) =>
      _$CareerMatchFromJson(json);
}
