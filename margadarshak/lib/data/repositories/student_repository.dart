/// Reads and writes the student profile and the learning progress.
library;

import '../../core/failure.dart';
import '../../core/result.dart';
import '../../domain/models/progress.dart';
import '../../domain/models/student_profile.dart';
import '../../domain/repositories/repositories.dart';
import '../services/user_data_service.dart';

/// The default source of student data: the local database or Firestore,
/// depending on how the build was configured.
class LocalStudentRepository implements StudentRepository {
  /// Creates the repository.
  LocalStudentRepository({required UserDataService userDataService}) : _userDataService = userDataService;

  final UserDataService _userDataService;

  @override
  Future<Result<StudentProfile>> getProfile(String studentId) async {
    final result = await _userDataService.readProfile(studentId);
    return switch (result) {
      Success<StudentProfile?>(:final value) => value == null
          ? Result<StudentProfile>.failure(Failure.notFound('The profile $studentId'))
          : Result<StudentProfile>.success(value),
      FailureResult<StudentProfile?>(:final failure) => Result<StudentProfile>.failure(failure),
    };
  }

  @override
  Future<Result<StudentProfile>> saveProfile(StudentProfile profile) async {
    final result = await _userDataService.writeProfile(profile);
    return switch (result) {
      Success<void>() => Result<StudentProfile>.success(profile),
      FailureResult<void>(:final failure) => Result<StudentProfile>.failure(failure),
    };
  }

  @override
  Future<Result<LearningProgress>> getProgress(String studentId) async {
    final result = await _userDataService.readProgress(studentId);
    return switch (result) {
      Success<LearningProgress?>(:final value) => Result<LearningProgress>.success(
          value ?? LearningProgress.empty(studentId),
        ),
      FailureResult<LearningProgress?>(:final failure) => Result<LearningProgress>.failure(failure),
    };
  }

  @override
  Future<Result<LearningProgress>> saveProgress(LearningProgress progress) async {
    final result = await _userDataService.writeProgress(progress);
    return switch (result) {
      Success<void>() => Result<LearningProgress>.success(progress),
      FailureResult<void>(:final failure) => Result<LearningProgress>.failure(failure),
    };
  }
}
