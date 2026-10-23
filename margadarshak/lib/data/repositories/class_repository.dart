/// Reads and writes the facilitator's classes, flags and modules.
library;

import '../../core/failure.dart';
import '../../core/result.dart';
import '../../domain/models/facilitator.dart';
import '../../domain/repositories/repositories.dart';
import '../services/user_data_service.dart';

/// The default source of facilitator data: the local database or Firestore.
class LocalClassRepository implements ClassRepository {
  /// Creates the repository.
  LocalClassRepository({required UserDataService userDataService}) : _userDataService = userDataService;

  final UserDataService _userDataService;

  @override
  Future<Result<List<FacilitatorClass>>> getClasses(String facilitatorId) async {
    final result = await _userDataService.readClasses(facilitatorId);
    return switch (result) {
      Success<List<FacilitatorClass>>(:final value) => Result<List<FacilitatorClass>>.success(value),
      FailureResult<List<FacilitatorClass>>(:final failure) => Result<List<FacilitatorClass>>.failure(failure),
    };
  }

  @override
  Future<Result<FacilitatorClass>> saveClass(FacilitatorClass classRecord) async {
    final result = await _userDataService.writeClass(classRecord);
    return switch (result) {
      Success<void>() => Result<FacilitatorClass>.success(classRecord),
      FailureResult<void>(:final failure) => Result<FacilitatorClass>.failure(failure),
    };
  }

  @override
  Future<Result<FacilitatorClass>> setTalentFlag({
    required String classId,
    required String studentId,
    required bool isFlagged,
  }) async {
    return _mutateClass(
      classId,
      (classRecord) => classRecord.copyWith(
        students: classRecord.students
            .map(
              (student) => student.studentId == studentId
                  ? student.copyWith(isFlagged: isFlagged)
                  : student,
            )
            .toList(growable: false),
      ),
    );
  }

  @override
  Future<Result<FacilitatorClass>> recommendOpportunity({
    required String classId,
    required String studentId,
    required String opportunityId,
  }) async {
    return _mutateClass(
      classId,
      (classRecord) => classRecord.copyWith(
        students: classRecord.students
            .map(
              (student) => student.studentId != studentId
                  ? student
                  : student.copyWith(
                      recommendedOpportunityIds: <String>{
                        ...student.recommendedOpportunityIds,
                        opportunityId,
                      }.toList(growable: false),
                    ),
            )
            .toList(growable: false),
      ),
    );
  }

  @override
  Future<Result<List<PublishedModule>>> getModules(String facilitatorId) async {
    final result = await _userDataService.readModules(facilitatorId);
    return switch (result) {
      Success<List<PublishedModule>>(:final value) => Result<List<PublishedModule>>.success(value),
      FailureResult<List<PublishedModule>>(:final failure) => Result<List<PublishedModule>>.failure(failure),
    };
  }

  @override
  Future<Result<PublishedModule>> saveModule(PublishedModule module) async {
    final result = await _userDataService.writeModule(module);
    return switch (result) {
      Success<void>() => Result<PublishedModule>.success(module),
      FailureResult<void>(:final failure) => Result<PublishedModule>.failure(failure),
    };
  }

  Future<Result<FacilitatorClass>> _mutateClass(
    String classId,
    FacilitatorClass Function(FacilitatorClass classRecord) transform,
  ) async {
    final found = await _userDataService.readClass(classId);
    if (found case FailureResult<FacilitatorClass?>(:final failure)) {
      return Result<FacilitatorClass>.failure(failure);
    }
    final classRecord = found.valueOrNull;
    if (classRecord == null) {
      return Result<FacilitatorClass>.failure(
        Failure.notFound('The class $classId'),
      );
    }

    final updated = transform(classRecord);
    return saveClass(updated);
  }
}
