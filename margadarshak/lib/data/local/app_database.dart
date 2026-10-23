/// The local Drift database that backs every offline-first feature.
///
/// Nothing in the app reads from the network for data it already has: the
/// shipped data packs are cached here, the student's own profile and progress
/// live here, and any write that could not reach the server is parked in the
/// pending-sync queue.
library;

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

/// Cached copies of the opportunity records from the shipped data packs.
class CachedOpportunityRows extends Table {
  /// The stable identifier of the opportunity.
  TextColumn get id => text()();

  /// `national` or a state code such as `mh`.
  TextColumn get scope => text()();

  /// The serialized domain model.
  TextColumn get payload => text()();

  /// The day the record was last checked against its official source.
  DateTimeColumn get lastVerifiedAt => dateTime()();

  /// The moment this copy was written.
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// The student's own profile, stored locally so the app opens offline.
class UserProfileRows extends Table {
  /// The student's identifier. Never a phone number.
  TextColumn get studentId => text()();

  /// The serialized domain model.
  TextColumn get payload => text()();

  /// The moment this copy was written.
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {studentId};
}

/// The student's learning progress: completed clips, points, badges and the
/// streak. It is stored locally because the streak has to keep working when
/// the phone has no network.
class ProgressRows extends Table {
  /// The student the progress belongs to.
  TextColumn get studentId => text()();

  /// The serialized domain model.
  TextColumn get payload => text()();

  /// The moment this copy was written.
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {studentId};
}

/// One completed learning clip. The rows are the source of truth for points
/// and for the streak, because the streak must survive going offline.
class DailyProgressRows extends Table {
  /// The auto incrementing row identifier.
  IntColumn get id => integer().autoIncrement()();

  /// The student the completion belongs to.
  TextColumn get studentId => text()();

  /// The clip that was completed.
  TextColumn get clipId => text()();

  /// The ISO day, `yyyy-MM-dd`, the clip was completed on.
  TextColumn get dateIso => text()();

  /// The points awarded for the completion.
  IntColumn get points => integer().withDefault(const Constant(0))();

  /// The moment the completion was recorded.
  DateTimeColumn get completedAt => dateTime()();
}

/// A write that has not reached the server yet.
class PendingSyncRows extends Table {
  /// The auto incrementing row identifier.
  IntColumn get id => integer().autoIncrement()();

  /// The collection the write targets, for example `progress`.
  TextColumn get target => text()();

  /// The serialized payload of the write.
  TextColumn get payload => text()();

  /// The moment the write was queued.
  DateTimeColumn get createdAt => dateTime()();
}

/// A class roster owned by a facilitator.
class FacilitatorClassRows extends Table {
  /// The stable identifier of the class.
  TextColumn get classId => text()();

  /// The facilitator who owns the class.
  TextColumn get facilitatorId => text()();

  /// The serialized domain model.
  TextColumn get payload => text()();

  /// The moment this copy was written.
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {classId};
}

/// A learning module published by a facilitator.
class ModuleRows extends Table {
  /// The stable identifier of the module.
  TextColumn get moduleId => text()();

  /// The facilitator who published the module.
  TextColumn get ownerId => text()();

  /// The serialized domain model.
  TextColumn get payload => text()();

  /// The moment this copy was written.
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {moduleId};
}

/// Local edits made from the admin console.
///
/// The shipped packs stay untouched; an edited record is stored here under an
/// identifier such as `clip:<id>` or `opportunity:<id>` and is merged over the
/// pack when the repository loads it. Clearing a row restores the original.
class ContentOverrideRows extends Table {
  /// The record the edit applies to, for example `clip:clip-health-01`.
  TextColumn get id => text()();

  /// The serialized domain model of the edited record.
  TextColumn get payload => text()();

  /// The moment the edit was saved.
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// The Drift database for the app.
@DriftDatabase(
  tables: [
    CachedOpportunityRows,
    UserProfileRows,
    ProgressRows,
    DailyProgressRows,
    PendingSyncRows,
    FacilitatorClassRows,
    ModuleRows,
    ContentOverrideRows,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Creates the database on the given executor.
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  /// Creates the database used on device.
  AppDatabase.open()
      : super(driftDatabase(name: 'margadarshak', native: const DriftNativeOptions()));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator migrator) async {
          await migrator.createAll();
        },
        onUpgrade: (Migrator migrator, int from, int to) async {
          if (from < 2) {
            await migrator.createTable(contentOverrideRows);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  /// Replaces the cached opportunity rows with the given records.
  Future<void> replaceOpportunities(
    List<CachedOpportunityRowsCompanion> rows,
  ) async {
    await transaction(() async {
      await delete(cachedOpportunityRows).go();
      await batch((Batch batch) {
        batch.insertAll(cachedOpportunityRows, rows);
      });
    });
  }

  /// Inserts a pending write into the sync queue.
  Future<int> enqueueSync({
    required String target,
    required String payload,
    required DateTime createdAt,
  }) {
    return into(pendingSyncRows).insert(
      PendingSyncRowsCompanion.insert(
        target: target,
        payload: payload,
        createdAt: createdAt,
      ),
    );
  }

  /// Removes a queued write once it has reached the server.
  Future<void> removeSync(int id) async {
    await (delete(pendingSyncRows)..where((row) => row.id.equals(id))).go();
  }

  /// Saves an edit of a shipped record, replacing any earlier edit.
  Future<void> upsertContentOverride({
    required String id,
    required String payload,
    required DateTime updatedAt,
  }) {
    return into(contentOverrideRows).insertOnConflictUpdate(
      ContentOverrideRowsCompanion.insert(
        id: id,
        payload: payload,
        updatedAt: updatedAt,
      ),
    );
  }

  /// Returns every saved edit.
  Future<List<ContentOverrideRow>> allContentOverrides() {
    return select(contentOverrideRows).get();
  }

  /// Removes one saved edit so the shipped record shows again.
  Future<void> deleteContentOverride(String id) async {
    await (delete(contentOverrideRows)..where((row) => row.id.equals(id))).go();
  }

  /// Removes every saved edit.
  Future<void> clearContentOverrides() async {
    await delete(contentOverrideRows).go();
  }

  /// Removes a student and everything stored for them on this device.
  Future<void> deleteStudentData(String studentId) async {
    await transaction(() async {
      await (delete(userProfileRows)..where((row) => row.studentId.equals(studentId))).go();
      await (delete(progressRows)..where((row) => row.studentId.equals(studentId))).go();
      await (delete(dailyProgressRows)..where((row) => row.studentId.equals(studentId))).go();
    });
  }
}

/// Opens the database file in the application support directory.
QueryExecutor _openConnection() {
  return driftDatabase(name: 'margadarshak', native: const DriftNativeOptions());
}
