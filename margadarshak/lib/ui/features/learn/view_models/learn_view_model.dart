/// Holds the daily queue, the streak and the points of the student.
library;

import 'package:flutter/foundation.dart';

import '../../../../core/failure.dart';
import '../../../../core/utils/date_x.dart';
import '../../../../domain/models/badge_catalog.dart';
import '../../../../domain/models/clip.dart';
import '../../../../domain/models/progress.dart';
import '../../../../domain/repositories/repositories.dart';
import '../../../../domain/use_cases/build_daily_queue.dart';
import '../../../../domain/use_cases/compute_streak.dart';

/// The number of points a finished clip is worth.
const int kPointsPerClip = 10;

/// The number of points a check-in is worth.
const int kPointsPerCheckin = 5;

/// Holds the state of the Learn screen.
class LearnViewModel extends ChangeNotifier {
  /// Creates the view model.
  LearnViewModel({
    required ClipRepository clipRepository,
    required StudentRepository studentRepository,
    required BuildDailyQueue buildDailyQueue,
    required ComputeStreak computeStreak,
  })  : _clipRepository = clipRepository,
        _studentRepository = studentRepository,
        _buildDailyQueue = buildDailyQueue,
        _computeStreak = computeStreak;

  final ClipRepository _clipRepository;
  final StudentRepository _studentRepository;
  final BuildDailyQueue _buildDailyQueue;
  final ComputeStreak _computeStreak;

  List<Clip> _queue = const [];
  LearningProgress _progress = LearningProgress.empty('');
  Clip? _activeClip;
  bool _isLoading = false;
  bool _hasCheckedIn = false;
  Failure? _failure;

  /// The clips queued for today.
  List<Clip> get queue => _queue;

  /// The clip the student is watching.
  Clip? get activeClip => _activeClip;

  /// The progress of the student.
  LearningProgress get progress => _progress;

  /// The current streak.
  Streak get streak => _progress.streak;

  /// Whether the screen is loading.
  bool get isLoading => _isLoading;

  /// Whether the check-in of the day was already sent.
  bool get hasCheckedIn => _hasCheckedIn;

  /// The error that stopped the screen, if any.
  Failure? get failure => _failure;

  /// Loads the queue and the progress of [studentId].
  Future<void> load(String studentId, String languageCode) async {
    _isLoading = true;
    _failure = null;
    notifyListeners();

    final clipsResult = await _clipRepository.getAll();
    final clips = clipsResult.valueOrNull;
    if (clips == null) {
      _failure = clipsResult.failureOrNull;
      _isLoading = false;
      notifyListeners();
      return;
    }

    final progressResult = await _studentRepository.getProgress(studentId);
    final progress = progressResult.valueOrNull ?? LearningProgress.empty(studentId);

    _progress = progress;
    _queue = _buildDailyQueue(
      clips: clips,
      progress: progress,
      now: DateTime.now(),
      languageCode: languageCode,
    );
    _hasCheckedIn = progress.completedDates.contains(DateTime.now().isoDate);
    _isLoading = false;
    notifyListeners();
  }

  /// Opens [clip] for the student.
  void openClip(Clip clip) {
    _activeClip = clip;
    notifyListeners();
  }

  /// Closes the clip that is open.
  void closeClip() {
    _activeClip = null;
    notifyListeners();
  }

  /// Marks [clip] as finished and saves the progress.
  Future<void> completeClip(Clip clip) async {
    final today = DateTime.now().isoDate;
    final completedClipIds = {..._progress.completedClipIds, clip.id};
    final completedDates = {..._progress.completedDates};
    final points = _progress.points + kPointsPerClip;
    if (completedClipIds.length >= _queue.length && _queue.isNotEmpty) {
      completedDates.add(today);
    }

    final streak = _computeStreak(
      completedDates: completedDates,
      now: DateTime.now(),
      freezesAvailable: _progress.streak.freezesAvailable,
      previousLongestDays: _progress.streak.longestDays,
    );

    final updated = _progress.copyWith(
      completedClipIds: completedClipIds,
      completedDates: completedDates,
      points: points,
      streak: streak,
      badges: _badgesFor(streak, _progress.badges),
    );

    await _studentRepository.saveProgress(updated);
    _progress = updated;
    if (_activeClip?.id == clip.id) {
      _activeClip = null;
    }
    notifyListeners();
  }

  /// Records the daily check-in.
  Future<void> checkIn() async {
    if (_hasCheckedIn) return;
    final today = DateTime.now().isoDate;
    final completedDates = {..._progress.completedDates, today};
    final streak = _computeStreak(
      completedDates: completedDates,
      now: DateTime.now(),
      freezesAvailable: _progress.streak.freezesAvailable,
      previousLongestDays: _progress.streak.longestDays,
    );
    final updated = _progress.copyWith(
      completedDates: completedDates,
      points: _progress.points + kPointsPerCheckin,
      streak: streak,
      badges: _badgesFor(streak, _progress.badges),
    );
    await _studentRepository.saveProgress(updated);
    _progress = updated;
    _hasCheckedIn = true;
    notifyListeners();
  }

  List<Badge> _badgesFor(Streak streak, List<Badge> existing) {
    final badges = [...existing];
    final known = badges.map((badge) => badge.id).toSet();

    void award(BadgeDefinition definition) {
      if (known.contains(definition.id)) return;
      badges.add(
        Badge(
          id: definition.id,
          label: definition.label,
          description: definition.description,
          awardedOn: DateTime.now(),
        ),
      );
    }

    if (streak.currentDays >= 3) award(BadgeCatalog.streakThree);
    if (streak.currentDays >= 7) award(BadgeCatalog.streakSeven);
    if (_progress.points >= 50) award(BadgeCatalog.pointsFifty);
    return badges;
  }
}
