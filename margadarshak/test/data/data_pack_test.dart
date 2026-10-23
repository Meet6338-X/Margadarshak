/// Tests that the shipped data packs stay honest.
///
/// Every record must point at an official source and must carry the date it
/// was last checked. A record without those two things would let the app
/// invent a scheme, which is the one thing this product must never do.
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:margadarshak/data/models/data_pack_dtos.dart';
import 'package:margadarshak/data/services/data_pack_service.dart';
import 'package:margadarshak/domain/models/opportunity.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const service = DataPackService();

  test('the manifest names the version of the data pack', () async {
    final result = await service.loadManifest();

    expect(result.isSuccess, isTrue);
    final manifest = result.valueOrNull!;
    expect(manifest.version, isNotEmpty);
    expect(manifest.supportedLocales, contains('mr'));
    expect(manifest.supportedLocales, contains('hi'));
    expect(manifest.stateScopes, contains('mh'));
  });

  test('every national record points at an official source', () async {
    final result = await service.loadNationalOpportunities();

    expect(result.isSuccess, isTrue);
    final opportunities = result.valueOrNull!;
    expect(opportunities, isNotEmpty);

    final ids = <String>{};
    for (final dto in opportunities) {
      expect(dto.id, isNotEmpty);
      expect(ids.add(dto.id), isTrue, reason: 'duplicate id ${dto.id}');
      expect(dto.officialSourceUrl, startsWith('https://'));
      expect(dto.officialSourceName.trim(), isNotEmpty);
      expect(dto.lastVerifiedAt, isNotEmpty);

      // The model has to survive the mapping into the domain layer.
      final domain = dto.toDomainModel();
      expect(domain.officialUri, isNotNull);
      expect(domain.officialUri!.scheme, 'https');
    }
  });

  test('every state pack loads and points at an official source', () async {
    for (final stateCode in const <String>['mh', 'bi']) {
      final result = await service.loadStateOpportunities(stateCode);

      expect(result.isSuccess, isTrue, reason: 'state $stateCode');
      final opportunities = result.valueOrNull!;
      expect(opportunities, isNotEmpty, reason: 'state $stateCode');

      for (final dto in opportunities) {
        expect(dto.scope, stateCode);
        expect(dto.officialSourceUrl, startsWith('https://'));
        expect(dto.lastVerifiedAt, isNotEmpty);
      }
    }
  });

  test('the career catalogue loads and has no empty entry', () async {
    final result = await service.loadCareers();

    expect(result.isSuccess, isTrue);
    final careers = result.valueOrNull!;
    expect(careers.length, greaterThan(10));

    for (final dto in careers) {
      expect(dto.id, isNotEmpty);
      final career = dto.toDomainModel();
      expect(career.title.en.trim(), isNotEmpty);
      expect((career.title.mr ?? '').trim(), isNotEmpty);
      expect((career.title.hi ?? '').trim(), isNotEmpty);
    }
  });

  test('every clip is short and carries slides', () async {
    final result = await service.loadClips();

    expect(result.isSuccess, isTrue);
    final clips = result.valueOrNull!;
    expect(clips, isNotEmpty);

    for (final dto in clips) {
      final clip = dto.toDomainModel();
      expect(clip.durationSeconds, greaterThanOrEqualTo(30));
      expect(clip.durationSeconds, lessThanOrEqualTo(60));
      expect(clip.slides, isNotEmpty);
      expect(clip.language, anyOf('mr', 'hi'));
    }
  });

  test('every eligibility rule uses a reason the interface can explain', () async {
    final result = await service.loadNationalOpportunities();
    final opportunities = result.valueOrNull!;

    for (final dto in opportunities) {
      for (final rule in dto.eligibilityRules) {
        expect(rule.reasonKey, startsWith('rule_'));
        expect(rule.id, isNotEmpty);
      }
    }
  });

  test('the pack files parse into the expected shapes', () async {
    final fromArray = OpportunityPackDto.fromJson(<Object?>[]);
    final fromObject = OpportunityPackDto.fromJson(<String, Object?>{
      'opportunities': <Object?>[],
    });

    expect(fromArray.opportunities, isEmpty);
    expect(fromObject.opportunities, isEmpty);
  });
}
