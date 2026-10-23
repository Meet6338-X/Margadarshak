/// Builds the fixed daily queue of five short clips.
library;

import '../../core/utils/date_x.dart';
import '../models/clip.dart';
import '../models/progress.dart';

/// Picks the five clips a student sees today.
///
/// The queue is deterministic: the same day always produces the same order,
/// and the order only changes when the calendar day changes. There is no
/// infinite scroll and nothing random in the reward loop.
class BuildDailyQueue {
  /// Creates the use case.
  const BuildDailyQueue({this.queueSize = 5});

  /// How many clips make up one day's queue.
  final int queueSize;

  /// Returns the clips for [now], skipping the ones already finished.
  List<Clip> call({
    required List<Clip> clips,
    required LearningProgress progress,
    required DateTime now,
    required String languageCode,
  }) {
    final pending = clips
        .where((clip) => !progress.completedClipIds.contains(clip.id))
        .toList(growable: false);

    if (pending.length <= queueSize) return pending;

    final preferred = pending
        .where((clip) => clip.language == languageCode)
        .toList(growable: false);
    final fallback = pending
        .where((clip) => clip.language != languageCode)
        .toList(growable: false);

    final shuffledPreferred = _seededShuffle(preferred, now.dateOnly);
    final shuffledFallback = _seededShuffle(fallback, now.dateOnly);

    return <Clip>[...shuffledPreferred, ...shuffledFallback]
        .take(queueSize)
        .toList(growable: false);
  }

  List<Clip> _seededShuffle(List<Clip> clips, DateTime seed) {
    final list = <Clip>[...clips];
    var state = (seed.difference(DateTime(2024)).inDays * 2654435761) & 0x7FFFFFFF;
    if (state <= 0) state += 1;

    for (var i = list.length - 1; i > 0; i--) {
      state = (state * 1103515245 + 12345) & 0x7FFFFFFF;
      final j = state % (i + 1);
      final tmp = list[i];
      list[i] = list[j];
      list[j] = tmp;
    }

    return list;
  }
}
