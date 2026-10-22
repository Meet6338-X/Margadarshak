/// Reads the short learning clips from the shipped data pack.
library;

import '../../core/failure.dart';
import '../../core/result.dart';
import '../../domain/models/clip.dart';
import '../../domain/repositories/repositories.dart';
import '../models/data_pack_dtos.dart';
import '../services/data_pack_service.dart';

/// The default source of clips: the pack bundled with the app.
class LocalClipRepository implements ClipRepository {
  /// Creates the repository.
  LocalClipRepository({required DataPackService dataPackService}) : _dataPackService = dataPackService;

  final DataPackService _dataPackService;

  List<Clip>? _cache;

  @override
  Future<Result<List<Clip>>> getAll() async {
    final cached = _cache;
    if (cached != null) return Result<List<Clip>>.success(cached);

    final result = await _dataPackService.loadClips();
    return switch (result) {
      Success<List<ClipDto>>(:final value) => _remember(value.map((dto) => dto.toDomainModel()).toList(growable: false)),
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

  Result<List<Clip>> _remember(List<Clip> clips) {
    _cache = clips;
    return Result<List<Clip>>.success(clips);
  }
}
