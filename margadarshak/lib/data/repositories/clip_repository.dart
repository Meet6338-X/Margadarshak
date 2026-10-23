/// Reads the short learning clips from the shipped data pack, with any
/// administrator edits layered on top.
library;

import 'dart:convert';

import '../../core/failure.dart';
import '../../core/logging/app_logger.dart';
import '../../core/result.dart';
import '../../domain/models/clip.dart';
import '../../domain/repositories/repositories.dart';
import '../local/app_database.dart';
import '../models/data_pack_dtos.dart';
import '../services/data_pack_service.dart';

/// The default source of clips: the pack bundled with the app, plus the edits
/// an administrator saved on this device.
class LocalClipRepository implements ClipRepository {
  /// Creates the repository.
  LocalClipRepository({
    required DataPackService dataPackService,
    AppDatabase? database,
  })  : _dataPackService = dataPackService,
        _database = database;

  final DataPackService _dataPackService;
  final AppDatabase? _database;

  List<Clip>? _cache;

  @override
  Future<Result<List<Clip>>> getAll() async {
    final cached = _cache;
    if (cached != null) return Result<List<Clip>>.success(cached);

    final result = await _dataPackService.loadClips();
    return switch (result) {
      Success<List<ClipDto>>(:final value) => _remember(
          await _applyOverrides(
            value.map((dto) => dto.toDomainModel()).toList(growable: false),
          ),
        ),
      FailureResult<List<ClipDto>>(:final failure) => Result<List<Clip>>.failure(failure),
    };
  }

  @override
  Future<Result<Clip>> getById(String id) async {
    final all = await getAll();
    return switch (all) {
      Success<List<Clip>>(:final value) => switch (value.where((c) => c.id == id).firstOrNull) {
          null => Result<Clip>.failure(Failure.notFound('The clip $id')),
          final clip => Result<Clip>.success(clip),
        },
      FailureResult<List<Clip>>(:final failure) => Result<Clip>.failure(failure),
    };
  }

  @override
  void invalidateCache() {
    _cache = null;
  }

  /// Replaces pack clips with the edited versions saved by the admin console.
  Future<List<Clip>> _applyOverrides(List<Clip> clips) async {
    final database = _database;
    if (database == null) return clips;
    try {
      final allRows = await database.select(database.contentOverrideRows).get();
      final rows = allRows.where((row) => row.id.startsWith('clip:')).toList();
      if (rows.isEmpty) return clips;

      final overrides = <String, Clip>{};
      for (final row in rows) {
        final clip = _decodeClip(row.payload);
        if (clip != null) overrides[clip.id] = clip;
      }
      if (overrides.isEmpty) return clips;

      return [
        for (final clip in clips) overrides[clip.id] ?? clip,
      ];
    } catch (error) {
      // A broken edit must never hide the verified pack content.
      AppLogger.warning('The saved clip edits could not be applied.', data: error);
      return clips;
    }
  }

  Clip? _decodeClip(String payload) {
    try {
      return Clip.fromJson((jsonDecode(payload) as Map).cast<String, Object?>());
    } catch (error) {
      AppLogger.warning('A saved clip edit could not be read.', data: error);
      return null;
    }
  }

  Result<List<Clip>> _remember(List<Clip> clips) {
    _cache = clips;
    return Result<List<Clip>>.success(clips);
  }
}
