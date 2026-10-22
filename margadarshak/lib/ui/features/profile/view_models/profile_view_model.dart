/// Holds the profile the student sees and edits.
library;

import 'package:flutter/foundation.dart';

import '../../../../core/failure.dart';
import '../../../../domain/models/progress.dart';
import '../../../../domain/models/student_profile.dart';
import '../../../../domain/repositories/repositories.dart';

/// Holds the state of the Profile screen.
class ProfileViewModel extends ChangeNotifier {
  /// Creates the view model.
  ProfileViewModel({
    required StudentRepository studentRepository,
    required OpportunityRepository opportunityRepository,
  })  : _studentRepository = studentRepository,
        _opportunityRepository = opportunityRepository;

  final StudentRepository _studentRepository;
  final OpportunityRepository _opportunityRepository;

  StudentProfile? _profile;
  LearningProgress? _progress;
  String _dataPackVersion = '';
  bool _isLoading = false;
  bool _isSaving = false;
  Failure? _failure;

  /// The profile of the student.
  StudentProfile? get profile => _profile;

  /// The learning progress of the student.
  LearningProgress? get progress => _progress;

  /// The version of the opportunity data pack.
  String get dataPackVersion => _dataPackVersion;

  /// Whether the screen is loading.
  bool get isLoading => _isLoading;

  /// Whether a change is being written.
  bool get isSaving => _isSaving;

  /// The error that stopped the screen, if any.
  Failure? get failure => _failure;

  /// Loads the profile, the progress and the data pack version.
  Future<void> load(String studentId) async {
    _isLoading = true;
    _failure = null;
    notifyListeners();

    final profileResult = await _studentRepository.getProfile(studentId);
    final progressResult = await _studentRepository.getProgress(studentId);
    final versionResult = await _opportunityRepository.getDataPackVersion();

    _profile = profileResult.valueOrNull;
    _progress = progressResult.valueOrNull;
    _dataPackVersion = versionResult.valueOrNull ?? '';
    _failure = profileResult.failureOrNull;
    _isLoading = false;
    notifyListeners();
  }

  /// Saves the profile under a new display name.
  Future<bool> rename(String displayName) async {
    final profile = _profile;
    if (profile == null) return false;

    _isSaving = true;
    notifyListeners();
    final result = await _studentRepository.saveProfile(
      profile.copyWith(displayName: displayName.trim()),
    );
    _profile = result.valueOrNull ?? profile;
    _isSaving = false;
    notifyListeners();
    return result.isSuccess;
  }
}
