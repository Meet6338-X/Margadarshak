/// The administrative data access used by the admin console.
///
/// Edits are stored as content overrides in Drift, so a teacher or programme
/// manager can correct a video link, a deadline or a source without touching
/// the shipped data packs. Clearing an override always returns the verified
/// pack record untouched.
library;

import 'dart:convert';

import '../../core/failure.dart';
import '../../core/logging/app_logger.dart';
import '../../core/result.dart';
import '../../domain/models/clip.dart';
import '../../domain/models/opportunity.dart';
import '../../domain/models/student_profile.dart';
import '../../domain/repositories/repositories.dart';
import '../local/app_database.dart';

/// Stores administrator edits and manages the locally stored profiles.
class LocalAdminRepository implements AdminRepository {
  /// Creates the repository.
  LocalAdminRepository({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  static const String _clipPrefix = 'clip:';
  static const String _opportunityPrefix = 'opportunity:';

  @override
  Future<Result<List<StudentProfile>>> listStudents() async {
    try {
      final rows = await _database.select(_database.userProfileRows).get();
      final students = <StudentProfile>[];
      for (final row in rows) {
        final profile = _decodeProfile(row.payload);
        if (profile != null) students.add(profile);
      }
      students.sort(
        (a, b) => a.displayName.toLowerCase().compareTo(b.displayName.toLowerCase()),
      );
      return Result<List<StudentProfile>>.success(
        List<StudentProfile>.unmodifiable(students),
      );
    } catch (error, stackTrace) {
      AppLogger.error('Could not list the stored student profiles.', error, stackTrace);
      return Result<List<StudentProfile>>.failure(Failure.storage(error, stackTrace));
    }
  }

  @override
  Future<Result<void>> deleteStudent(String studentId) async {
    try {
      await _database.deleteStudentData(studentId);
      return const Result<void>.success(null);
    } catch (error, stackTrace) {
      AppLogger.error('Could not delete the student profile.', error, stackTrace);
      return Result<void>.failure(Failure.storage(error, stackTrace));
    }
  }

  @override
  Future<Result<void>> saveClipOverride(Clip clip) {
    return _saveOverride(
      id: '$_clipPrefix${clip.id}',
      payload: jsonEncode(clip.toJson()),
      what: 'clip',
    );
  }

  @override
  Future<Result<void>> clearClipOverride(String clipId) {
    return _clearOverride('$_clipPrefix$clipId', 'clip');
  }

  @override
  Future<Result<void>> saveOpportunityOverride(Opportunity opportunity) {
    return _saveOverride(
      id: '$_opportunityPrefix${opportunity.id}',
      payload: jsonEncode(opportunity.toJson()),
      what: 'opportunity',
    );
  }

  @override
  Future<Result<void>> clearOpportunityOverride(String opportunityId) {
    return _clearOverride('$_opportunityPrefix$opportunityId', 'opportunity');
  }

  @override
  Future<Result<Set<String>>> overriddenContentIds() async {
    try {
      final rows = await _database.allContentOverrides();
      return Result<Set<String>>.success(
        Set<String>.unmodifiable(rows.map((row) => row.id)),
      );
    } catch (error, stackTrace) {
      AppLogger.error('Could not read the saved content edits.', error, stackTrace);
      return Result<Set<String>>.failure(Failure.storage(error, stackTrace));
    }
  }

  @override
  Future<Result<void>> clearAllOverrides() async {
    try {
      await _database.clearContentOverrides();
      return const Result<void>.success(null);
    } catch (error, stackTrace) {
      AppLogger.error('Could not clear the saved content edits.', error, stackTrace);
      return Result<void>.failure(Failure.storage(error, stackTrace));
    }
  }

  Future<Result<void>> _saveOverride({
    required String id,
    required String payload,
    required String what,
  }) async {
    try {
      await _database.upsertContentOverride(
        id: id,
        payload: payload,
        updatedAt: DateTime.now(),
      );
      return const Result<void>.success(null);
    } catch (error, stackTrace) {
      AppLogger.error('Could not save the $what edit.', error, stackTrace);
      return Result<void>.failure(Failure.storage(error, stackTrace));
    }
  }

  Future<Result<void>> _clearOverride(String id, String what) async {
    try {
      await _database.deleteContentOverride(id);
      return const Result<void>.success(null);
    } catch (error, stackTrace) {
      AppLogger.error('Could not clear the $what edit.', error, stackTrace);
      return Result<void>.failure(Failure.storage(error, stackTrace));
    }
  }

  StudentProfile? _decodeProfile(String payload) {
    try {
      return StudentProfile.fromJson((jsonDecode(payload) as Map).cast<String, Object?>());
    } catch (error) {
      AppLogger.warning('A stored student profile could not be read.', data: error);
      return null;
    }
  }
}
