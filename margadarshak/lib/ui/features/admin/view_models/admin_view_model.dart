/// The state behind the admin console.
library;

import 'package:flutter/foundation.dart';

import '../../../../core/failure.dart';
import '../../../../core/result.dart';
import '../../../../domain/models/clip.dart';
import '../../../../domain/models/opportunity.dart';
import '../../../../domain/models/student_profile.dart';
import '../../../../domain/repositories/repositories.dart';

/// Loads the editable catalogue and applies the console actions.
///
/// The view model never touches a database or a pack directly: every read and
/// write goes through a repository, which keeps the layer rule intact.
class AdminViewModel extends ChangeNotifier {
  /// Creates the view model.
  AdminViewModel({
    required this.adminRepository,
    required this.clipRepository,
    required this.opportunityRepository,
    required this.studentRepository,
  });

  /// The admin data access.
  final AdminRepository adminRepository;

  /// The clip catalogue.
  final ClipRepository clipRepository;

  /// The opportunity catalogue.
  final OpportunityRepository opportunityRepository;

  /// The student profiles stored on this device.
  final StudentRepository studentRepository;

  List<StudentProfile> _students = const [];
  List<Clip> _clips = const [];
  List<Opportunity> _opportunities = const [];
  Set<String> _overriddenIds = const {};
  String _dataPackVersion = '';
  bool _isLoading = false;
  bool _isSaving = false;
  Failure? _failure;

  /// The profiles stored on this device.
  List<StudentProfile> get students => _students;

  /// Every clip in the catalogue, with the saved edits applied.
  List<Clip> get clips => _clips;

  /// Every opportunity in the catalogue, with the saved edits applied.
  List<Opportunity> get opportunities => _opportunities;

  /// The version of the shipped data pack.
  String get dataPackVersion => _dataPackVersion;

  /// Whether the first load is still running.
  bool get isLoading => _isLoading;

  /// Whether a save or delete is in flight.
  bool get isSaving => _isSaving;

  /// The last failure, when something went wrong.
  Failure? get failure => _failure;

  /// How many records carry a saved edit.
  int get editedCount => _overriddenIds.length;

  /// Whether the clip was edited on this device.
  bool isClipEdited(String clipId) => _overriddenIds.contains('clip:$clipId');

  /// Whether the opportunity was edited on this device.
  bool isOpportunityEdited(String opportunityId) =>
      _overriddenIds.contains('opportunity:$opportunityId');

  /// Loads the students, the catalogue and the saved edits.
  Future<void> load() async {
    _isLoading = true;
    _failure = null;
    notifyListeners();

    final studentsResult = await adminRepository.listStudents();
    final clipsResult = await clipRepository.getAll();
    final opportunitiesResult = await opportunityRepository.getAll();
    final overridesResult = await adminRepository.overriddenContentIds();
    final versionResult = await opportunityRepository.getDataPackVersion();

    _students = studentsResult.valueOrNull ?? _students;
    _clips = clipsResult.valueOrNull ?? _clips;
    _opportunities = opportunitiesResult.valueOrNull ?? _opportunities;
    _overriddenIds = overridesResult.valueOrNull ?? _overriddenIds;
    _dataPackVersion = versionResult.valueOrNull ?? _dataPackVersion;
    _failure = studentsResult.failureOrNull ??
        clipsResult.failureOrNull ??
        opportunitiesResult.failureOrNull;
    _isLoading = false;
    notifyListeners();
  }

  /// Saves an edited student profile.
  Future<bool> saveStudent(StudentProfile profile) async {
    final saved = await _perform(() => studentRepository.saveProfile(profile));
    if (!saved) return false;

    final updated = [..._students];
    final index = updated.indexWhere((student) => student.studentId == profile.studentId);
    if (index >= 0) {
      updated[index] = profile;
    } else {
      updated.add(profile);
    }
    updated.sort(
      (a, b) => a.displayName.toLowerCase().compareTo(b.displayName.toLowerCase()),
    );
    _students = List.unmodifiable(updated);
    notifyListeners();
    return true;
  }

  /// Removes a student profile and the progress stored beside it.
  Future<bool> deleteStudent(String studentId) async {
    final deleted = await _perform(() => adminRepository.deleteStudent(studentId));
    if (!deleted) return false;

    _students = List.unmodifiable(
      _students.where((student) => student.studentId != studentId),
    );
    notifyListeners();
    return true;
  }

  /// Saves an edited clip and refreshes the catalogue.
  Future<bool> saveClip(Clip clip) async {
    final saved = await _perform(() async {
      final result = await adminRepository.saveClipOverride(clip);
      clipRepository.invalidateCache();
      return result;
    });
    if (!saved) return false;

    await _reloadContent();
    return true;
  }

  /// Drops the saved edit of a clip so the pack version returns.
  Future<bool> resetClip(String clipId) async {
    final cleared = await _perform(() async {
      final result = await adminRepository.clearClipOverride(clipId);
      clipRepository.invalidateCache();
      return result;
    });
    if (!cleared) return false;

    await _reloadContent();
    return true;
  }

  /// Saves an edited opportunity and refreshes the catalogue.
  Future<bool> saveOpportunity(Opportunity opportunity) async {
    final saved = await _perform(() async {
      final result = await adminRepository.saveOpportunityOverride(opportunity);
      opportunityRepository.invalidateCache();
      return result;
    });
    if (!saved) return false;

    await _reloadContent();
    return true;
  }

  /// Drops the saved edit of an opportunity so the pack version returns.
  Future<bool> resetOpportunity(String opportunityId) async {
    final cleared = await _perform(() async {
      final result = await adminRepository.clearOpportunityOverride(opportunityId);
      opportunityRepository.invalidateCache();
      return result;
    });
    if (!cleared) return false;

    await _reloadContent();
    return true;
  }

  /// Drops every saved edit and returns to the shipped catalogue.
  Future<bool> resetAllOverrides() async {
    final cleared = await _perform(() async {
      final result = await adminRepository.clearAllOverrides();
      clipRepository.invalidateCache();
      opportunityRepository.invalidateCache();
      return result;
    });
    if (!cleared) return false;

    await _reloadContent();
    return true;
  }

  Future<void> _reloadContent() async {
    final clips = await clipRepository.getAll();
    final opportunities = await opportunityRepository.getAll();
    final overrides = await adminRepository.overriddenContentIds();

    _clips = clips.valueOrNull ?? _clips;
    _opportunities = opportunities.valueOrNull ?? _opportunities;
    _overriddenIds = overrides.valueOrNull ?? _overriddenIds;
    notifyListeners();
  }

  Future<bool> _perform<T>(Future<Result<T>> Function() action) async {
    _isSaving = true;
    _failure = null;
    notifyListeners();

    final result = await action();
    _isSaving = false;
    final failure = result.failureOrNull;
    if (failure != null) {
      _failure = failure;
      notifyListeners();
      return false;
    }

    notifyListeners();
    return true;
  }
}
