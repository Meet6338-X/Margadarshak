/// The habit loop: streaks, freezes, points and badges.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'localized_text.dart';

part 'progress.freezed.dart';
part 'progress.g.dart';

/// The streak counter, with a freeze so that a missed day costs nothing.
@freezed
abstract class Streak with _$Streak {
  /// Creates a streak.
  const factory Streak({
    /// Consecutive days completed, counting the current day.
    required int currentDays,

    /// The longest run ever achieved.
    required int longestDays,

    /// The last day the student completed the queue.
    DateTime? lastCompletedOn,

    /// How many freezes are still available.
    @Default(2) int freezesAvailable,

    /// How many freezes have been used so far.
    @Default(0) int freezesUsed,
  }) = _Streak;

  /// Reads a streak from JSON.
  factory Streak.fromJson(Map<String, Object?> json) => _$StreakFromJson(json);
}

/// A badge a facilitator or the app awarded.
@freezed
abstract class Badge with _$Badge {
  /// Creates a badge.
  const factory Badge({
    /// The stable identifier.
    required String id,

    /// The badge name.
    required LocalizedText label,

    /// A short description of what earned it.
    required LocalizedText description,

    /// When it was awarded.
    required DateTime awardedOn,
  }) = _Badge;

  /// Reads a badge from JSON.
  factory Badge.fromJson(Map<String, Object?> json) => _$BadgeFromJson(json);
}

/// Everything the app tracks about a student's learning.
@freezed
abstract class LearningProgress with _$LearningProgress {
  /// Creates a learning progress record.
  const factory LearningProgress({
    /// The student this progress belongs to.
    required String studentId,

    /// The clips the student has finished.
    @Default(<String>{}) Set<String> completedClipIds,

    /// The days on which the student finished the daily queue, as ISO dates.
    @Default(<String>{}) Set<String> completedDates,

    /// Points, awarded for effort rather than for scores.
    required int points,

    /// Badges earned so far.
    @Default(<Badge>[]) List<Badge> badges,

    /// The current streak.
    required Streak streak,

    /// The opportunities the student has opened.
    @Default(<String>{}) Set<String> viewedOpportunityIds,
  }) = _LearningProgress;

  /// Reads a learning progress record from JSON.
  factory LearningProgress.fromJson(Map<String, Object?> json) =>
      _$LearningProgressFromJson(json);

  /// An empty progress record for [studentId].
  factory LearningProgress.empty(String studentId) => LearningProgress(
        studentId: studentId,
        points: 0,
        streak: const Streak(currentDays: 0, longestDays: 0),
      );
}
