/// Tests for the daily queue of five short clips.
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:margadarshak/domain/models/clip.dart';
import 'package:margadarshak/domain/models/progress.dart';
import 'package:margadarshak/domain/use_cases/build_daily_queue.dart';

import '../support/fixtures.dart';

void main() {
  const build = BuildDailyQueue();

  List<Clip> manyClips() => List<Clip>.generate(
        9,
        (index) => buildClip(
          id: 'clip_$index',
          language: index.isEven ? 'mr' : 'hi',
          order: index,
        ),
      );

  group('BuildDailyQueue', () {
    test('never returns more than five clips', () {
      final queue = build(
        clips: manyClips(),
        progress: LearningProgress.empty('student_1'),
        now: DateTime(2026, 10, 1),
        languageCode: 'mr',
      );

      expect(queue, hasLength(5));
    });

    test('skips the clips the student already finished', () {
      final queue = build(
        clips: manyClips(),
        progress: const LearningProgress(
          studentId: 'student_1',
          completedClipIds: <String>{'clip_0', 'clip_1'},
          points: 0,
          streak: Streak(currentDays: 0, longestDays: 0),
        ),
        now: DateTime(2026, 10, 1),
        languageCode: 'mr',
      );

      expect(
        queue.map((clip) => clip.id),
        isNot(contains('clip_0')),
      );
      expect(
        queue.map((clip) => clip.id),
        isNot(contains('clip_1')),
      );
    });

    test('the same day always produces the same order', () {
      final first = build(
        clips: manyClips(),
        progress: LearningProgress.empty('student_1'),
        now: DateTime(2026, 10, 1),
        languageCode: 'mr',
      );
      final second = build(
        clips: manyClips(),
        progress: LearningProgress.empty('student_1'),
        now: DateTime(2026, 10, 1, 18),
        languageCode: 'mr',
      );

      expect(
        first.map((clip) => clip.id).toList(),
        second.map((clip) => clip.id).toList(),
      );
    });

    test('prefers the clips in the language of the student', () {
      final queue = build(
        clips: manyClips(),
        progress: LearningProgress.empty('student_1'),
        now: DateTime(2026, 10, 1),
        languageCode: 'mr',
      );

      expect(queue.every((clip) => clip.language == 'mr'), isTrue);
    });
  });
}
