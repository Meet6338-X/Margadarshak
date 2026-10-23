/// A short learning clip: the unit of the daily habit loop.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'localized_text.dart';

part 'clip.freezed.dart';
part 'clip.g.dart';

/// One clip in the daily queue.
///
/// Clips are short by design (30–60 seconds), mostly voice with slides, and
/// they are made by facilitators and partners.
@freezed
abstract class Clip with _$Clip {
  /// Creates a clip.
  const factory Clip({
    /// The stable identifier.
    required String id,

    /// The clip title.
    required LocalizedText title,

    /// A one line summary of what the clip covers.
    required LocalizedText summary,

    /// How long the clip runs, in seconds.
    required int durationSeconds,

    /// The language code the clip is spoken in, `mr` or `hi`.
    required String language,

    /// An optional link to a video version of the clip.
    ///
    /// When it is present the Learn screen offers a "watch video" action next
    /// to the voice playback. Only links to real, official videos belong here.
    String? videoUrl,

    /// The text of each slide, shown next to the voice.
    @Default(<String>[]) List<String> slides,

    /// Tags used to pick clips that match the student's interests.
    @Default(<String>[]) List<String> tags,

    /// Career ids this clip is about.
    @Default(<String>[]) List<String> careerIds,

    /// The stable position of this clip inside the whole catalogue.
    required int order,
  }) = _Clip;

  /// Reads a clip from JSON.
  factory Clip.fromJson(Map<String, Object?> json) => _$ClipFromJson(json);
}

/// Convenience readers for a [Clip].
extension ClipX on Clip {
  /// The duration formatted as `m:ss`.
  String get formattedDuration {
    final minutes = durationSeconds ~/ 60;
    final seconds = durationSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
