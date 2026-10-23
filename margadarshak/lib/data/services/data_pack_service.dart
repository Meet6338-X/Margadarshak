/// Reads the versioned JSON data packs that ship inside the application.
///
/// The packs are the reason the app can work with no network and the reason
/// it can refuse to invent a scheme: every record a student sees comes from
/// one of these files, together with the link to its official source.
library;

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../../core/failure.dart';
import '../../core/result.dart';
import '../models/data_pack_dtos.dart';

/// The asset root that holds every shipped pack.
const String kDataPackRoot = 'assets/data';

/// Loads and caches the shipped data packs.
class DataPackService {
  /// Creates a data pack service.
  const DataPackService();

  /// The manifest of the shipped packs.
  Future<Result<DataPackManifestDto>> loadManifest() async {
    try {
      final raw = await rootBundle.loadString('$kDataPackRoot/manifest.json');
      final json = jsonDecode(raw) as Map<String, Object?>;
      return Success<DataPackManifestDto>(DataPackManifestDto.fromJson(json));
    } on Object catch (error) {
      return FailureResult<DataPackManifestDto>(
        Failure.storage('Could not read the data pack manifest: $error'),
      );
    }
  }

  /// Loads every opportunity from the national packs.
  ///
  /// The national layer is split into three files so that a new state pack or
  /// a new kind of national record can be added without touching the others.
  Future<Result<List<OpportunityDto>>> loadNationalOpportunities() async {
    final records = <OpportunityDto>[];
    for (final file in const <String>[
      'schemes.json',
      'exams.json',
      'apprenticeships.json',
    ]) {
      final result =
          await _loadOpportunityPack('$kDataPackRoot/national/$file');
      if (result case final FailureResult<List<OpportunityDto>> failure) {
        return FailureResult<List<OpportunityDto>>(failure.failure);
      }
      records.addAll(result.valueOrNull ?? const <OpportunityDto>[]);
    }
    return Success<List<OpportunityDto>>(records);
  }

  /// Loads every opportunity from a state pack.
  ///
  /// [stateCode] is the lower case state code, for example `mh`.
  Future<Result<List<OpportunityDto>>> loadStateOpportunities(
    String stateCode,
  ) async {
    return _loadOpportunityPack(
      '$kDataPackRoot/states/${stateCode.toLowerCase()}/schemes.json',
    );
  }

  /// Loads every career from the career pack.
  Future<Result<List<CareerDto>>> loadCareers() async {
    try {
      final raw =
          await rootBundle.loadString('$kDataPackRoot/national/careers.json');
      final json = jsonDecode(raw) as Object?;
      return Success<List<CareerDto>>(
        CareerPackDto.fromJson(json).careers,
      );
    } on Object catch (error) {
      return FailureResult<List<CareerDto>>(
        Failure.storage('Could not read the career pack: $error'),
      );
    }
  }

  /// Loads every clip from the clip pack.
  Future<Result<List<ClipDto>>> loadClips() async {
    try {
      final raw =
          await rootBundle.loadString('$kDataPackRoot/national/clips.json');
      final json = jsonDecode(raw) as Object?;
      return Success<List<ClipDto>>(ClipPackDto.fromJson(json).clips);
    } on Object catch (error) {
      return FailureResult<List<ClipDto>>(
        Failure.storage('Could not read the clip pack: $error'),
      );
    }
  }

  /// Reads one opportunity pack file.
  Future<Result<List<OpportunityDto>>> _loadOpportunityPack(
    String assetPath,
  ) async {
    try {
      final raw = await rootBundle.loadString(assetPath);
      final json = jsonDecode(raw) as Object?;
      return Success<List<OpportunityDto>>(
        OpportunityPackDto.fromJson(json).opportunities,
      );
    } on Object catch (error) {
      return FailureResult<List<OpportunityDto>>(
        Failure.storage('Could not read $assetPath: $error'),
      );
    }
  }
}
