/// Reads the opportunity records from the shipped data packs.
library;

import 'dart:convert';

import '../../core/failure.dart';
import '../../core/logging/app_logger.dart';
import '../../core/result.dart';
import '../../domain/models/opportunity.dart';
import '../../domain/repositories/repositories.dart';
import '../local/app_database.dart';
import '../models/data_pack_dtos.dart';
import '../services/data_pack_service.dart';

/// The default source of opportunities: the versioned JSON packs in the app.
///
/// The records are mirrored into Drift so that a future REST source can
/// replace the packs without the rest of the app noticing.
class LocalOpportunityRepository implements OpportunityRepository {
  /// Creates the repository.
  LocalOpportunityRepository({
    required DataPackService dataPackService,
    AppDatabase? database,
  })  : _dataPackService = dataPackService,
        _database = database;

  final DataPackService _dataPackService;
  final AppDatabase? _database;

  List<Opportunity>? _cache;

  @override
  Future<Result<String>> getDataPackVersion() async {
    final manifest = await _manifest();
    return switch (manifest) {
      Success<DataPackManifestDto>(:final value) => Result<String>.success(value.version),
      FailureResult<DataPackManifestDto>(:final failure) => Result<String>.failure(failure),
    };
  }

  @override
  Future<Result<List<Opportunity>>> getAll({String? scope}) async {
    final all = await _loadAll();
    return switch (all) {
      Success<List<Opportunity>>(:final value) => Result<List<Opportunity>>.success(
          scope == null ? value : value.where((o) => o.scope == scope).toList(growable: false),
        ),
      FailureResult<List<Opportunity>>(:final failure) => Result<List<Opportunity>>.failure(failure),
    };
  }

  @override
  Future<Result<Opportunity>> getById(String id) async {
    final all = await _loadAll();
    return switch (all) {
      Success<List<Opportunity>>(:final value) => switch (value.where((o) => o.id == id).firstOrNull) {
          null => Result<Opportunity>.failure(Failure.notFound('The opportunity $id')),
          final opportunity => Result<Opportunity>.success(opportunity),
        },
      FailureResult<List<Opportunity>>(:final failure) => Result<Opportunity>.failure(failure),
    };
  }

  @override
  Future<Result<List<Opportunity>>> getForCareer(String careerId) async {
    final all = await _loadAll();
    return switch (all) {
      Success<List<Opportunity>>(:final value) => Result<List<Opportunity>>.success(
          value.where((o) => o.careerIds.contains(careerId)).toList(growable: false),
        ),
      FailureResult<List<Opportunity>>(:final failure) => Result<List<Opportunity>>.failure(failure),
    };
  }

  Future<Result<DataPackManifestDto>> _manifest() {
    return _dataPackService.loadManifest();
  }

  Future<Result<List<Opportunity>>> _loadAll() async {
    final cached = _cache;
    if (cached != null) return Result<List<Opportunity>>.success(cached);

    final manifestResult = await _manifest();
    if (manifestResult case FailureResult<DataPackManifestDto>(:final failure)) {
      return Result<List<Opportunity>>.failure(failure);
    }
    final manifest = manifestResult.valueOrNull!;

    final nationalResult = await _dataPackService.loadNationalOpportunities();
    if (nationalResult case FailureResult<List<OpportunityDto>>(:final failure)) {
      return Result<List<Opportunity>>.failure(failure);
    }
    final national = nationalResult.valueOrNull!;

    final all = <Opportunity>[
      ...national.map((dto) => dto.toDomainModel()),
    ];

    for (final stateCode in manifest.stateScopes) {
      final stateResult = await _dataPackService.loadStateOpportunities(stateCode);
      if (stateResult case FailureResult<List<OpportunityDto>>(:final failure)) {
        // A missing state pack must never break the national layer.
        AppLogger.warning('The state pack "$stateCode" was skipped.', data: failure);
        continue;
      }
      final statePack = stateResult.valueOrNull!;
      all.addAll(statePack.map((dto) => dto.toDomainModel()));
    }

    final merged = await _applyOverrides(all);
    _cache = merged;
    await _mirror(merged);
    return Result<List<Opportunity>>.success(merged);
  }

  @override
  void invalidateCache() {
    _cache = null;
  }

  /// Replaces pack records with the edited versions saved by the admin console.
  Future<List<Opportunity>> _applyOverrides(List<Opportunity> opportunities) async {
    final database = _database;
    if (database == null) return opportunities;
    try {
      final allRows = await database.select(database.contentOverrideRows).get();
      final rows =
          allRows.where((row) => row.id.startsWith('opportunity:')).toList();
      if (rows.isEmpty) return opportunities;

      final overrides = <String, Opportunity>{};
      for (final row in rows) {
        final opportunity = _decodeOpportunity(row.payload);
        if (opportunity != null) overrides[opportunity.id] = opportunity;
      }
      if (overrides.isEmpty) return opportunities;

      return [
        for (final opportunity in opportunities) overrides[opportunity.id] ?? opportunity,
      ];
    } catch (error) {
      // A broken edit must never hide the verified pack content.
      AppLogger.warning('The saved opportunity edits could not be applied.', data: error);
      return opportunities;
    }
  }

  Opportunity? _decodeOpportunity(String payload) {
    try {
      return Opportunity.fromJson((jsonDecode(payload) as Map).cast<String, Object?>());
    } catch (error) {
      AppLogger.warning('A saved opportunity edit could not be read.', data: error);
      return null;
    }
  }

  Future<void> _mirror(List<Opportunity> opportunities) async {
    final database = _database;
    if (database == null) return;
    try {
      final now = DateTime.now();
      await database.replaceOpportunities(
        opportunities
            .map(
              (opportunity) => CachedOpportunityRowsCompanion.insert(
                id: opportunity.id,
                scope: opportunity.scope,
                payload: jsonEncode(opportunity.toJson()),
                lastVerifiedAt: opportunity.lastVerifiedAt,
                cachedAt: now,
              ),
            )
            .toList(growable: false),
      );
    } catch (error, stackTrace) {
      AppLogger.error('Could not mirror the opportunity cache.', error, stackTrace);
    }
  }
}
