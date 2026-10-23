/// Reads the career catalogue from the shipped data pack.
library;

import '../../core/failure.dart';
import '../../core/result.dart';
import '../../domain/models/career.dart';
import '../../domain/repositories/repositories.dart';
import '../models/data_pack_dtos.dart';
import '../services/data_pack_service.dart';

/// The default source of careers: the catalogue bundled with the app.
class LocalCareerRepository implements CareerRepository {
  /// Creates the repository.
  LocalCareerRepository({required DataPackService dataPackService}) : _dataPackService = dataPackService;

  final DataPackService _dataPackService;

  List<Career>? _cache;

  @override
  Future<Result<List<Career>>> getAll() async {
    final cached = _cache;
    if (cached != null) return Result<List<Career>>.success(cached);

    final result = await _dataPackService.loadCareers();
    return switch (result) {
      Success<List<CareerDto>>(:final value) => _remember(value.map((dto) => dto.toDomainModel()).toList(growable: false)),
      FailureResult<List<CareerDto>>(:final failure) => Result<List<Career>>.failure(failure),
    };
  }

  @override
  Future<Result<Career>> getById(String id) async {
    final all = await getAll();
    return switch (all) {
      Success<List<Career>>(:final value) => switch (value.where((c) => c.id == id).firstOrNull) {
          null => Result<Career>.failure(Failure.notFound('The career $id')),
          final career => Result<Career>.success(career),
        },
      FailureResult<List<Career>>(:final failure) => Result<Career>.failure(failure),
    };
  }

  Result<List<Career>> _remember(List<Career> careers) {
    _cache = careers;
    return Result<List<Career>>.success(careers);
  }
}
