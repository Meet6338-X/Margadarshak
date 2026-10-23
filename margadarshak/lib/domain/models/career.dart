/// A career the student can consider.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'localized_text.dart';

part 'career.freezed.dart';
part 'career.g.dart';

/// A career option, drawn from the curated career catalogue.
///
/// The catalogue is deliberately small and readable rather than exhaustive, and
/// it deliberately includes non-STEM and vocational paths.
@freezed
abstract class Career with _$Career {
  /// Creates a career record.
  const factory Career({
    /// The stable identifier.
    required String id,

    /// The career name.
    required LocalizedText title,

    /// A one or two line description.
    required LocalizedText summary,

    /// A broad grouping such as `agriculture`, `health`, `trades`, `digital`.
    required String category,

    /// The education path that leads here, from the student's current stage.
    @Default(<String>[]) List<String> educationPath,

    /// Interest tags that make this career a good match.
    @Default(<String>[]) List<String> interestTags,

    /// Career ids that sit next to this one in a similar family of work.
    @Default(<String>[]) List<String> relatedCareerIds,

    /// The first concrete steps a student can take.
    @Default(<LocalizedText>[]) List<LocalizedText> entrySteps,

    /// Whether this is a non-STEM path.
    required bool nonStem,

    /// Whether this career builds on a local or traditional skill.
    required bool localTraditionalSkill,
  }) = _Career;

  /// Reads a career from JSON.
  factory Career.fromJson(Map<String, Object?> json) => _$CareerFromJson(json);
}
