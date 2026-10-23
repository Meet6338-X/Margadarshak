/// Storage for the small amount of data that belongs to a user.
///
/// The opportunity packs, the rules engine and the career catalogue are not
/// here: they are local by design so that the app can promise it never invents
/// a scheme. What lives here is personal — a profile, a streak, a class
/// roster — and that is the part that benefits from a server.
library;

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart';

import '../../core/failure.dart';
import '../../core/logging/app_logger.dart';
import '../../core/result.dart';
import '../../domain/models/facilitator.dart';
import '../../domain/models/progress.dart';
import '../../domain/models/student_profile.dart';
import '../local/app_database.dart';

/// Reads and writes the data that belongs to one user.
abstract interface class UserDataService {
  /// Reads the profile of a student, or null when there is none yet.
  Future<Result<StudentProfile?>> readProfile(String studentId);

  /// Writes the profile of a student.
  Future<Result<void>> writeProfile(StudentProfile profile);

  /// Reads the learning progress of a student, or null when there is none.
  Future<Result<LearningProgress?>> readProgress(String studentId);

  /// Writes the learning progress of a student.
  Future<Result<void>> writeProgress(LearningProgress progress);

  /// Reads the class rosters owned by a facilitator.
  Future<Result<List<FacilitatorClass>>> readClasses(String facilitatorId);

  /// Reads one class roster by its identifier, or null when there is none.
  Future<Result<FacilitatorClass?>> readClass(String classId);

  /// Writes a class roster.
  Future<Result<void>> writeClass(FacilitatorClass facilitatorClass);

  /// Reads the modules published by a facilitator.
  Future<Result<List<PublishedModule>>> readModules(String ownerId);

  /// Writes a published module.
  Future<Result<void>> writeModule(PublishedModule module);
}

/// Keeps user data in the local Drift database.
///
/// This is the default implementation, so a student who has never been online
/// still gets a profile, a streak and a class roster.
class LocalUserDataService implements UserDataService {
  /// Creates the local user data service.
  const LocalUserDataService(this._database);

  final AppDatabase _database;

  @override
  Future<Result<StudentProfile?>> readProfile(String studentId) async {
    try {
      final row = await (_database.select(_database.userProfileRows)
            ..where((row) => row.studentId.equals(studentId)))
          .getSingleOrNull();
      if (row == null) return const Success<StudentProfile?>(null);
      final json = jsonDecode(row.payload) as Map<String, Object?>;
      return Success<StudentProfile?>(StudentProfile.fromJson(json));
    } on Object catch (error) {
      AppLogger.error('readProfile failed', error);
      return FailureResult<StudentProfile?>(
        Failure.storage('Could not read the profile: $error'),
      );
    }
  }

  @override
  Future<Result<void>> writeProfile(StudentProfile profile) async {
    try {
      await _database.into(_database.userProfileRows).insertOnConflictUpdate(
            UserProfileRowsCompanion.insert(
              studentId: profile.studentId,
              payload: jsonEncode(profile.toJson()),
              updatedAt: DateTime.now(),
            ),
          );
      return const Success<void>(null);
    } on Object catch (error) {
      AppLogger.error('writeProfile failed', error);
      return FailureResult<void>(
        Failure.storage('Could not save the profile: $error'),
      );
    }
  }

  @override
  Future<Result<LearningProgress?>> readProgress(String studentId) async {
    try {
      final row = await (_database.select(_database.progressRows)
            ..where((row) => row.studentId.equals(studentId)))
          .getSingleOrNull();
      if (row == null) return const Success<LearningProgress?>(null);
      final json = jsonDecode(row.payload) as Map<String, Object?>;
      return Success<LearningProgress?>(LearningProgress.fromJson(json));
    } on Object catch (error) {
      AppLogger.error('readProgress failed', error);
      return FailureResult<LearningProgress?>(
        Failure.storage('Could not read the progress: $error'),
      );
    }
  }

  @override
  Future<Result<void>> writeProgress(LearningProgress progress) async {
    try {
      final now = DateTime.now();
      await _database.transaction(() async {
        await _database.into(_database.progressRows).insertOnConflictUpdate(
              ProgressRowsCompanion.insert(
                studentId: progress.studentId,
                payload: jsonEncode(progress.toJson()),
                updatedAt: now,
              ),
            );
        await _database.into(_database.dailyProgressRows).insert(
              DailyProgressRowsCompanion.insert(
                studentId: progress.studentId,
                clipId: progress.completedClipIds.isEmpty
                    ? ''
                    : progress.completedClipIds.last,
                dateIso: progress.completedDates.isEmpty
                    ? ''
                    : progress.completedDates.last,
                points: Value(progress.points),
                completedAt: now,
              ),
            );
      });
      return const Success<void>(null);
    } on Object catch (error) {
      AppLogger.error('writeProgress failed', error);
      return FailureResult<void>(
        Failure.storage('Could not save the progress: $error'),
      );
    }
  }

  @override
  Future<Result<List<FacilitatorClass>>> readClasses(
    String facilitatorId,
  ) async {
    try {
      final rows = await (_database.select(_database.facilitatorClassRows)
            ..where((row) => row.facilitatorId.equals(facilitatorId)))
          .get();
      final classes = rows
          .map(
            (row) => FacilitatorClass.fromJson(
              jsonDecode(row.payload) as Map<String, Object?>,
            ),
          )
          .toList();
      return Success<List<FacilitatorClass>>(classes);
    } on Object catch (error) {
      AppLogger.error('readClasses failed', error);
      return FailureResult<List<FacilitatorClass>>(
        Failure.storage('Could not read the classes: $error'),
      );
    }
  }

  @override
  Future<Result<FacilitatorClass?>> readClass(String classId) async {
    try {
      final row = await (_database.select(_database.facilitatorClassRows)
            ..where((row) => row.classId.equals(classId)))
          .getSingleOrNull();
      if (row == null) return const Success<FacilitatorClass?>(null);
      return Success<FacilitatorClass?>(
        FacilitatorClass.fromJson(
          jsonDecode(row.payload) as Map<String, Object?>,
        ),
      );
    } on Object catch (error) {
      AppLogger.error('readClass failed', error);
      return FailureResult<FacilitatorClass?>(
        Failure.storage('Could not read the class: $error'),
      );
    }
  }

  @override
  Future<Result<void>> writeClass(FacilitatorClass facilitatorClass) async {
    try {
      await _database
          .into(_database.facilitatorClassRows)
          .insertOnConflictUpdate(
        FacilitatorClassRowsCompanion.insert(
          classId: facilitatorClass.classId,
          facilitatorId: facilitatorClass.facilitatorId,
          payload: jsonEncode(facilitatorClass.toJson()),
          updatedAt: DateTime.now(),
        ),
      );
      return const Success<void>(null);
    } on Object catch (error) {
      AppLogger.error('writeClass failed', error);
      return FailureResult<void>(
        Failure.storage('Could not save the class: $error'),
      );
    }
  }

  @override
  Future<Result<List<PublishedModule>>> readModules(String ownerId) async {
    try {
      final rows = await (_database.select(_database.moduleRows)
            ..where((row) => row.ownerId.equals(ownerId)))
          .get();
      final modules = rows
          .map(
            (row) => PublishedModule.fromJson(
              jsonDecode(row.payload) as Map<String, Object?>,
            ),
          )
          .toList();
      return Success<List<PublishedModule>>(modules);
    } on Object catch (error) {
      AppLogger.error('readModules failed', error);
      return FailureResult<List<PublishedModule>>(
        Failure.storage('Could not read the modules: $error'),
      );
    }
  }

  @override
  Future<Result<void>> writeModule(PublishedModule module) async {
    try {
      await _database.into(_database.moduleRows).insertOnConflictUpdate(
            ModuleRowsCompanion.insert(
              moduleId: module.moduleId,
              ownerId: module.ownerFacilitatorId,
              payload: jsonEncode(module.toJson()),
              updatedAt: DateTime.now(),
            ),
          );
      return const Success<void>(null);
    } on Object catch (error) {
      AppLogger.error('writeModule failed', error);
      return FailureResult<void>(
        Failure.storage('Could not save the module: $error'),
      );
    }
  }
}

/// Keeps user data in Firestore.
///
/// The same shape as the local implementation, so switching between them is a
/// configuration change rather than a code change.
class FirebaseUserDataService implements UserDataService {
  /// Creates the Firestore backed user data service.
  const FirebaseUserDataService(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<Result<StudentProfile?>> readProfile(String studentId) async {
    try {
      final snapshot =
          await _firestore.collection('students').doc(studentId).get();
      final data = snapshot.data();
      if (data == null) return const Success<StudentProfile?>(null);
      return Success<StudentProfile?>(
        StudentProfile.fromJson(_normalize(data)),
      );
    } on Object catch (error) {
      AppLogger.error('readProfile failed', error);
      return FailureResult<StudentProfile?>(
        Failure.storage('Could not read the profile: $error'),
      );
    }
  }

  @override
  Future<Result<void>> writeProfile(StudentProfile profile) async {
    try {
      await _firestore
          .collection('students')
          .doc(profile.studentId)
          .set(profile.toJson(), SetOptions(merge: true));
      return const Success<void>(null);
    } on Object catch (error) {
      AppLogger.error('writeProfile failed', error);
      return FailureResult<void>(
        Failure.storage('Could not save the profile: $error'),
      );
    }
  }

  @override
  Future<Result<LearningProgress?>> readProgress(String studentId) async {
    try {
      final snapshot = await _firestore
          .collection('students')
          .doc(studentId)
          .collection('progress')
          .doc('current')
          .get();
      final data = snapshot.data();
      if (data == null) return const Success<LearningProgress?>(null);
      return Success<LearningProgress?>(
        LearningProgress.fromJson(_normalize(data)),
      );
    } on Object catch (error) {
      AppLogger.error('readProgress failed', error);
      return FailureResult<LearningProgress?>(
        Failure.storage('Could not read the progress: $error'),
      );
    }
  }

  @override
  Future<Result<void>> writeProgress(LearningProgress progress) async {
    try {
      await _firestore
          .collection('students')
          .doc(progress.studentId)
          .collection('progress')
          .doc('current')
          .set(progress.toJson(), SetOptions(merge: true));
      return const Success<void>(null);
    } on Object catch (error) {
      AppLogger.error('writeProgress failed', error);
      return FailureResult<void>(
        Failure.storage('Could not save the progress: $error'),
      );
    }
  }

  @override
  Future<Result<List<FacilitatorClass>>> readClasses(
    String facilitatorId,
  ) async {
    try {
      final snapshot = await _firestore
          .collection('classes')
          .where('facilitatorId', isEqualTo: facilitatorId)
          .get();
      final classes = snapshot.docs
          .map(
            (doc) => FacilitatorClass.fromJson(_normalize(doc.data())),
          )
          .toList();
      return Success<List<FacilitatorClass>>(classes);
    } on Object catch (error) {
      AppLogger.error('readClasses failed', error);
      return FailureResult<List<FacilitatorClass>>(
        Failure.storage('Could not read the classes: $error'),
      );
    }
  }

  @override
  Future<Result<FacilitatorClass?>> readClass(String classId) async {
    try {
      final snapshot = await _firestore.collection('classes').doc(classId).get();
      final data = snapshot.data();
      if (data == null) return const Success<FacilitatorClass?>(null);
      return Success<FacilitatorClass?>(
        FacilitatorClass.fromJson(_normalize(data)),
      );
    } on Object catch (error) {
      AppLogger.error('readClass failed', error);
      return FailureResult<FacilitatorClass?>(
        Failure.storage('Could not read the class: $error'),
      );
    }
  }

  @override
  Future<Result<void>> writeClass(FacilitatorClass facilitatorClass) async {
    try {
      await _firestore
          .collection('classes')
          .doc(facilitatorClass.classId)
          .set(
            <String, Object?>{
              ...facilitatorClass.toJson(),
              'facilitatorId': facilitatorClass.facilitatorId,
            },
            SetOptions(merge: true),
          );
      return const Success<void>(null);
    } on Object catch (error) {
      AppLogger.error('writeClass failed', error);
      return FailureResult<void>(
        Failure.storage('Could not save the class: $error'),
      );
    }
  }

  @override
  Future<Result<List<PublishedModule>>> readModules(String ownerId) async {
    try {
      final snapshot = await _firestore
          .collection('modules')
          .where('ownerFacilitatorId', isEqualTo: ownerId)
          .get();
      final modules = snapshot.docs
          .map((doc) => PublishedModule.fromJson(_normalize(doc.data())))
          .toList();
      return Success<List<PublishedModule>>(modules);
    } on Object catch (error) {
      AppLogger.error('readModules failed', error);
      return FailureResult<List<PublishedModule>>(
        Failure.storage('Could not read the modules: $error'),
      );
    }
  }

  @override
  Future<Result<void>> writeModule(PublishedModule module) async {
    try {
      await _firestore
          .collection('modules')
          .doc(module.moduleId)
          .set(module.toJson(), SetOptions(merge: true));
      return const Success<void>(null);
    } on Object catch (error) {
      AppLogger.error('writeModule failed', error);
      return FailureResult<void>(
        Failure.storage('Could not save the module: $error'),
      );
    }
  }

  /// Firestore stores nested maps, so the JSON shape has to be rebuilt.
  Map<String, Object?> _normalize(Map<String, Object?> data) {
    return data.map(
      (key, value) => MapEntry<String, Object?>(
        key,
        value is Map ? _normalize(value.cast<String, Object?>()) : value,
      ),
    );
  }
}
