/// Holds the facilitator console: classes, rosters, flags and modules.
library;

import 'package:flutter/foundation.dart';

import '../../../../core/failure.dart';
import '../../../../domain/models/facilitator.dart';
import '../../../../domain/models/opportunity.dart';
import '../../../../domain/repositories/repositories.dart';

/// Holds the state of the facilitator console.
class FacilitatorViewModel extends ChangeNotifier {
  /// Creates the view model.
  FacilitatorViewModel({
    required ClassRepository classRepository,
    required OpportunityRepository opportunityRepository,
  })  : _classRepository = classRepository,
        _opportunityRepository = opportunityRepository;

  final ClassRepository _classRepository;
  final OpportunityRepository _opportunityRepository;

  List<FacilitatorClass> _classes = const [];
  List<PublishedModule> _modules = const [];
  List<Opportunity> _opportunities = const [];
  String _facilitatorId = '';
  bool _isLoading = false;
  bool _isSaving = false;
  Failure? _failure;

  /// The classes the facilitator looks after.
  List<FacilitatorClass> get classes => _classes;

  /// The modules the facilitator published.
  List<PublishedModule> get modules => _modules;

  /// The opportunities that can be recommended.
  List<Opportunity> get opportunities => _opportunities;

  /// The identifier of the signed-in facilitator.
  String get facilitatorId => _facilitatorId;

  /// Whether the screen is loading.
  bool get isLoading => _isLoading;

  /// Whether a change is being written.
  bool get isSaving => _isSaving;

  /// The error that stopped the screen, if any.
  Failure? get failure => _failure;

  /// The class with [classId], or `null`.
  FacilitatorClass? classById(String classId) {
    for (final record in _classes) {
      if (record.classId == classId) return record;
    }
    return null;
  }

  /// Loads the classes, the modules and the opportunity list.
  Future<void> load(String facilitatorId) async {
    _facilitatorId = facilitatorId;
    _isLoading = true;
    _failure = null;
    notifyListeners();

    final classesResult = await _classRepository.getClasses(facilitatorId);
    final modulesResult = await _classRepository.getModules(facilitatorId);
    final opportunitiesResult = await _opportunityRepository.getAll();

    _classes = classesResult.valueOrNull ?? const [];
    _modules = modulesResult.valueOrNull ?? const [];
    _opportunities = opportunitiesResult.valueOrNull ?? const [];
    _failure = classesResult.failureOrNull;
    _isLoading = false;
    notifyListeners();
  }

  /// Creates a class and returns whether it worked.
  Future<bool> createClass({
    required String name,
    required String schoolName,
    required String state,
    required String district,
  }) async {
    _isSaving = true;
    notifyListeners();

    final record = FacilitatorClass(
      classId: 'class_${_facilitatorId}_${DateTime.now().millisecondsSinceEpoch}',
      facilitatorId: _facilitatorId,
      name: name.trim(),
      schoolName: schoolName.trim(),
      state: state,
      district: district.trim(),
      createdAt: DateTime.now(),
    );

    final result = await _classRepository.saveClass(record);
    _isSaving = false;
    if (result.isSuccess) {
      _classes = [..._classes, record];
      notifyListeners();
      return true;
    }
    _failure = result.failureOrNull;
    notifyListeners();
    return false;
  }

  /// Adds a student to a class and returns whether it worked.
  Future<bool> addStudent(String classId, RosterStudent student) async {
    final record = classById(classId);
    if (record == null) return false;

    _isSaving = true;
    notifyListeners();

    final updated = record.copyWith(
      students: <RosterStudent>[...record.students, student],
    );
    final result = await _classRepository.saveClass(updated);
    _isSaving = false;
    if (result.isSuccess) {
      _replace(updated);
      return true;
    }
    _failure = result.failureOrNull;
    notifyListeners();
    return false;
  }

  /// Flags or unflags a student as talented.
  Future<bool> toggleFlag(String classId, String studentId, bool isFlagged) async {
    final result = await _classRepository.setTalentFlag(
      classId: classId,
      studentId: studentId,
      isFlagged: isFlagged,
    );
    final updated = result.valueOrNull;
    if (updated != null) _replace(updated);
    notifyListeners();
    return result.isSuccess;
  }

  /// Recommends an opportunity to a student.
  Future<bool> recommend({
    required String classId,
    required String studentId,
    required String opportunityId,
  }) async {
    final result = await _classRepository.recommendOpportunity(
      classId: classId,
      studentId: studentId,
      opportunityId: opportunityId,
    );
    final updated = result.valueOrNull;
    if (updated != null) _replace(updated);
    notifyListeners();
    return result.isSuccess;
  }

  /// Publishes a module.
  Future<bool> publishModule(PublishedModule module) async {
    _isSaving = true;
    notifyListeners();

    final result = await _classRepository.saveModule(module);
    _isSaving = false;
    if (result.isSuccess) {
      _modules = [..._modules, module];
      notifyListeners();
      return true;
    }
    _failure = result.failureOrNull;
    notifyListeners();
    return false;
  }

  void _replace(FacilitatorClass updated) {
    _classes = _classes
        .map((record) => record.classId == updated.classId ? updated : record)
        .toList(growable: false);
  }
}
