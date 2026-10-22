/// Data-transfer objects for the shipped JSON data packs.
///
/// These types are deliberately plain Dart: they mirror the on-disk JSON
/// exactly, keep their own parsing, and know nothing about the UI. The
/// repositories are the only place where a DTO is turned into a domain model.
library;

import '../../domain/models/career.dart';
import '../../domain/models/clip.dart';
import '../../domain/models/enums.dart';
import '../../domain/models/localized_text.dart';
import '../../domain/models/opportunity.dart';

/// Reads a value that may be absent or null into an optional string.
String? _optString(Object? value) {
  if (value == null) return null;
  final text = value.toString();
  return text.isEmpty ? null : text;
}

/// Reads a list of strings, tolerating a missing or malformed entry.
///
/// Accepts both a JSON array and an `Iterable` such as `Map.keys`, because
/// the manifest reads the state codes out of the `states` map keys.
List<String> _stringList(Object? value) {
  if (value is List) return value.map((Object? item) => item.toString()).toList();
  if (value is Iterable) return value.map((Object? item) => item.toString()).toList();
  return const <String>[];
}

/// Reads a list of localized text payloads, tolerating absent entries.
List<LocalizedTextDto> _localTextList(Object? value) {
  if (value is! List) return const <LocalizedTextDto>[];
  return value
      .whereType<Map<String, dynamic>>()
      .map(
        (Map<String, dynamic> item) =>
            LocalizedTextDto.fromJson(item.cast<String, Object?>()),
      )
      .toList();
}

/// A JSON object with a translation for each supported language.
class LocalizedTextDto {
  /// Creates a localized text payload.
  const LocalizedTextDto({
    required this.en,
    this.hi,
    this.mr,
  });

  /// Reads a localized text payload from JSON.
  factory LocalizedTextDto.fromJson(Map<String, Object?> json) {
    return LocalizedTextDto(
      en: json['en']?.toString() ?? '',
      hi: _optString(json['hi']),
      mr: _optString(json['mr']),
    );
  }

  /// The English text, used as the fallback for every language.
  final String en;

  /// The Hindi text, when a translation exists.
  final String? hi;

  /// The Marathi text, when a translation exists.
  final String? mr;

  /// Converts this payload into the domain model.
  LocalizedText toDomain() => LocalizedText(en: en, hi: hi, mr: mr);
}

/// A single eligibility rule as stored in the data pack.
class EligibilityRuleDto {
  /// Creates an eligibility rule payload.
  const EligibilityRuleDto({
    required this.id,
    required this.field,
    required this.operator,
    required this.values,
    required this.reasonKey,
    required this.isBlocking,
  });

  /// Reads an eligibility rule payload from JSON.
  factory EligibilityRuleDto.fromJson(Map<String, Object?> json) {
    return EligibilityRuleDto(
      id: json['id']?.toString() ?? '',
      field: json['field']?.toString() ?? '',
      operator: json['operator']?.toString() ?? '',
      values: _stringList(json['values']),
      reasonKey: json['reasonKey']?.toString() ?? '',
      isBlocking: json['isBlocking'] != false,
    );
  }

  /// The stable identifier of the rule.
  final String id;

  /// The wire value of the profile field this rule inspects.
  final String field;

  /// The wire value of the comparison this rule performs.
  final String operator;

  /// The accepted values for the comparison.
  final List<String> values;

  /// The localization key explaining the rule.
  final String reasonKey;

  /// Whether a failure of this rule disqualifies the student.
  final bool isBlocking;
}

/// A document a student must collect before applying.
class DocumentRequirementDto {
  /// Creates a document requirement payload.
  const DocumentRequirementDto({
    required this.id,
    required this.label,
    required this.whereToGet,
    required this.isMandatory,
    required this.careerIds,
  });

  /// Reads a document requirement payload from JSON.
  factory DocumentRequirementDto.fromJson(Map<String, Object?> json) {
    return DocumentRequirementDto(
      id: json['id']?.toString() ?? '',
      label: LocalizedTextDto.fromJson(
        (json['label'] as Map?)?.cast<String, Object?>() ?? const {},
      ),
      whereToGet: LocalizedTextDto.fromJson(
        (json['whereToGet'] as Map?)?.cast<String, Object?>() ?? const {},
      ),
      isMandatory: json['isMandatory'] == true,
      careerIds: _stringList(json['careerIds']),
    );
  }

  /// The stable identifier of the document.
  final String id;

  /// The human readable name of the document.
  final LocalizedTextDto label;

  /// Where the student can obtain the document.
  final LocalizedTextDto whereToGet;

  /// Whether the application cannot be filed without it.
  final bool isMandatory;

  /// Careers this document is specifically needed for.
  final List<String> careerIds;
}

/// One opportunity record inside a data pack.
class OpportunityDto {
  /// Creates an opportunity payload.
  const OpportunityDto({
    required this.id,
    required this.kind,
    required this.title,
    required this.summary,
    required this.officialSourceName,
    required this.officialSourceUrl,
    required this.lastVerifiedAt,
    required this.scope,
    required this.categories,
    required this.careerIds,
    required this.amountDisclosed,
    required this.eligibilityRules,
    required this.requiredDocuments,
    this.applicationOpensAt,
    this.applicationClosesAt,
    this.minClass,
    this.maxClass,
    this.applyUrl,
    this.applySteps = const <LocalizedTextDto>[],
  });

  /// Reads an opportunity payload from JSON.
  factory OpportunityDto.fromJson(Map<String, Object?> json) {
    final rules = json['eligibilityRules'];
    final documents = json['requiredDocuments'];
    return OpportunityDto(
      id: json['id']?.toString() ?? '',
      kind: json['kind']?.toString() ?? '',
      applyUrl: _optString(json['applyUrl']),
      applySteps: _localTextList(json['applySteps']),
      title: LocalizedTextDto.fromJson(
        (json['title'] as Map?)?.cast<String, Object?>() ?? const {},
      ),
      summary: LocalizedTextDto.fromJson(
        (json['summary'] as Map?)?.cast<String, Object?>() ?? const {},
      ),
      officialSourceName: json['officialSourceName']?.toString() ?? '',
      officialSourceUrl: json['officialSourceUrl']?.toString() ?? '',
      lastVerifiedAt: json['lastVerifiedAt']?.toString() ?? '',
      scope: json['scope']?.toString() ?? 'national',
      categories: _stringList(json['categories']),
      careerIds: _stringList(json['careerIds']),
      amountDisclosed: json['amountDisclosed'] == true,
      eligibilityRules: rules is List
          ? rules
              .whereType<Map<String, dynamic>>()
              .map((Map<String, dynamic> item) =>
                  EligibilityRuleDto.fromJson(item.cast<String, Object?>()))
              .toList()
          : const <EligibilityRuleDto>[],
      requiredDocuments: documents is List
          ? documents
              .whereType<Map<String, dynamic>>()
              .map((Map<String, dynamic> item) =>
                  DocumentRequirementDto.fromJson(item.cast<String, Object?>()))
              .toList()
          : const <DocumentRequirementDto>[],
      applicationOpensAt: _optString(json['applicationOpensAt']),
      applicationClosesAt: _optString(json['applicationClosesAt']),
      minClass: json['minClass'] is int ? json['minClass']! as int : null,
      maxClass: json['maxClass'] is int ? json['maxClass']! as int : null,
    );
  }

  /// The stable identifier of the opportunity.
  final String id;

  /// The wire value of the opportunity kind.
  final String kind;

  /// The dedicated application page, when the portal has one.
  final String? applyUrl;

  /// The steps of the application flow, when the portal publishes them.
  final List<LocalizedTextDto> applySteps;

  /// The title of the opportunity.
  final LocalizedTextDto title;

  /// A short summary of the opportunity.
  final LocalizedTextDto summary;

  /// The name of the body that publishes the record.
  final String officialSourceName;

  /// The link to the official page. Never empty for a published record.
  final String officialSourceUrl;

  /// The date the record was last checked against its official source.
  final String lastVerifiedAt;

  /// `national` or a state code such as `mh`.
  final String scope;

  /// Tags used to match the record against a student's interests.
  final List<String> categories;

  /// Careers this record unlocks.
  final List<String> careerIds;

  /// Whether the official source publishes the amount.
  final bool amountDisclosed;

  /// The deterministic rules applied to a student profile.
  final List<EligibilityRuleDto> eligibilityRules;

  /// The documents a student must collect.
  final List<DocumentRequirementDto> requiredDocuments;

  /// The day the application window opens.
  final String? applicationOpensAt;

  /// The day the application window closes.
  final String? applicationClosesAt;

  /// The lowest class the record applies to.
  final int? minClass;

  /// The highest class the record applies to.
  final int? maxClass;
}

/// One career record inside a data pack.
class CareerDto {
  /// Creates a career payload.
  const CareerDto({
    required this.id,
    required this.title,
    required this.summary,
    required this.category,
    required this.educationPath,
    required this.interestTags,
    required this.relatedCareerIds,
    required this.entrySteps,
    required this.nonStem,
    required this.localTraditionalSkill,
  });

  /// Reads a career payload from JSON.
  factory CareerDto.fromJson(Map<String, Object?> json) {
    final steps = json['entrySteps'];
    return CareerDto(
      id: json['id']?.toString() ?? '',
      title: LocalizedTextDto.fromJson(
        (json['title'] as Map?)?.cast<String, Object?>() ?? const {},
      ),
      summary: LocalizedTextDto.fromJson(
        (json['summary'] as Map?)?.cast<String, Object?>() ?? const {},
      ),
      category: json['category']?.toString() ?? '',
      educationPath: _stringList(json['educationPath']),
      interestTags: _stringList(json['interestTags']),
      relatedCareerIds: _stringList(json['relatedCareerIds']),
      entrySteps: steps is List
          ? steps
              .whereType<Map<String, dynamic>>()
              .map((Map<String, dynamic> item) =>
                  LocalizedTextDto.fromJson(item.cast<String, Object?>()))
              .toList()
          : const <LocalizedTextDto>[],
      nonStem: json['nonStem'] == true,
      localTraditionalSkill: json['localTraditionalSkill'] == true,
    );
  }

  /// The stable identifier of the career.
  final String id;

  /// The name of the career.
  final LocalizedTextDto title;

  /// A short description of the work.
  final LocalizedTextDto summary;

  /// The broad category the career belongs to.
  final String category;

  /// The education steps that lead to it.
  final List<String> educationPath;

  /// Interest tags used for matching.
  final List<String> interestTags;

  /// Careers that often lead into this one.
  final List<String> relatedCareerIds;

  /// The first concrete steps a student can take.
  final List<LocalizedTextDto> entrySteps;

  /// Whether the career belongs to a non-STEM field.
  final bool nonStem;

  /// Whether the career builds on a traditional local skill.
  final bool localTraditionalSkill;
}

/// One short learning clip inside a data pack.
class ClipDto {
  /// Creates a clip payload.
  const ClipDto({
    required this.id,
    required this.title,
    required this.summary,
    required this.durationSeconds,
    required this.language,
    required this.order,
    required this.tags,
    required this.careerIds,
    required this.slides,
  });

  /// Reads a clip payload from JSON.
  factory ClipDto.fromJson(Map<String, Object?> json) {
    return ClipDto(
      id: json['id']?.toString() ?? '',
      title: LocalizedTextDto.fromJson(
        (json['title'] as Map?)?.cast<String, Object?>() ?? const {},
      ),
      summary: LocalizedTextDto.fromJson(
        (json['summary'] as Map?)?.cast<String, Object?>() ?? const {},
      ),
      durationSeconds: json['durationSeconds'] is int
          ? json['durationSeconds']! as int
          : 45,
      language: json['language']?.toString() ?? 'mr',
      order: json['order'] is int ? json['order']! as int : 0,
      tags: _stringList(json['tags']),
      careerIds: _stringList(json['careerIds']),
      slides: _stringList(json['slides']),
    );
  }

  /// The stable identifier of the clip.
  final String id;

  /// The title of the clip.
  final LocalizedTextDto title;

  /// A one line description of the clip.
  final LocalizedTextDto summary;

  /// The length of the clip in seconds.
  final int durationSeconds;

  /// The language the clip is spoken in.
  final String language;

  /// The position of the clip inside the pack.
  final int order;

  /// Tags used for matching.
  final List<String> tags;

  /// Careers the clip talks about.
  final List<String> careerIds;

  /// The text of the slides shown while the clip plays.
  final List<String> slides;
}

/// The manifest describing the shipped data packs.
class DataPackManifestDto {
  /// Creates a manifest payload.
  const DataPackManifestDto({
    required this.version,
    required this.generatedAt,
    required this.supportedLocales,
    required this.nationalScopes,
    required this.stateScopes,
  });

  /// Reads a manifest payload from JSON.
  factory DataPackManifestDto.fromJson(Map<String, Object?> json) {
    final scopes = json['scopes'];
    final states = scopes is Map ? scopes['states'] : null;
    return DataPackManifestDto(
      version: json['version']?.toString() ?? '',
      generatedAt: json['generatedAt']?.toString() ?? '',
      supportedLocales: _stringList(json['supportedLocales']),
      nationalScopes: scopes is Map ? _stringList(scopes['national']) : const [],
      stateScopes: states is Map ? _stringList(states.keys) : const [],
    );
  }

  /// The version of the shipped packs.
  final String version;

  /// The day the packs were generated.
  final String generatedAt;

  /// The languages the packs carry translations for.
  final List<String> supportedLocales;

  /// The national pack files.
  final List<String> nationalScopes;

  /// The state pack files.
  final List<String> stateScopes;
}

/// A file listing the records inside one pack file.
///
/// Pack files are accepted both as a bare JSON array and as an object with a
/// named list, so a new state pack can be added in either shape.
class OpportunityPackDto {
  /// Creates a pack payload.
  const OpportunityPackDto({
    required this.opportunities,
  });

  /// Reads a pack payload from JSON.
  factory OpportunityPackDto.fromJson(Object? json) {
    final list = json is Map ? json['opportunities'] : json;
    return OpportunityPackDto(
      opportunities: list is List
          ? list
              .whereType<Map<String, dynamic>>()
              .map((Map<String, dynamic> item) =>
                  OpportunityDto.fromJson(item.cast<String, Object?>()))
              .toList()
          : const <OpportunityDto>[],
    );
  }

  /// The records inside the pack.
  final List<OpportunityDto> opportunities;
}

/// A file listing the careers inside one pack file.
class CareerPackDto {
  /// Creates a career pack payload.
  const CareerPackDto({required this.careers});

  /// Reads a career pack payload from JSON.
  factory CareerPackDto.fromJson(Object? json) {
    final list = json is Map ? json['careers'] : json;
    return CareerPackDto(
      careers: list is List
          ? list
              .whereType<Map<String, dynamic>>()
              .map((Map<String, dynamic> item) =>
                  CareerDto.fromJson(item.cast<String, Object?>()))
              .toList()
          : const <CareerDto>[],
    );
  }

  /// The careers inside the pack.
  final List<CareerDto> careers;
}

/// A file listing the clips inside one pack file.
class ClipPackDto {
  /// Creates a clip pack payload.
  const ClipPackDto({required this.clips});

  /// Reads a clip pack payload from JSON.
  factory ClipPackDto.fromJson(Object? json) {
    final list = json is Map ? json['clips'] : json;
    return ClipPackDto(
      clips: list is List
          ? list
              .whereType<Map<String, dynamic>>()
              .map((Map<String, dynamic> item) => ClipDto.fromJson(item.cast<String, Object?>()))
              .toList()
          : const <ClipDto>[],
    );
  }

  /// The clips inside the pack.
  final List<ClipDto> clips;
}

/// Converts an opportunity payload into the domain model.
extension OpportunityDtoMapping on OpportunityDto {
  /// Builds the domain model for this payload.
  Opportunity toDomainModel() {
    return Opportunity(
      id: id,
      kind: OpportunityKind.fromCode(kind),
      title: title.toDomain(),
      summary: summary.toDomain(),
      officialSourceName: officialSourceName,
      officialSourceUrl: officialSourceUrl,
      lastVerifiedAt: DateTime.parse(lastVerifiedAt),
      scope: scope,
      categories: categories,
      careerIds: careerIds,
      amountDisclosed: amountDisclosed,
      eligibilityRules: eligibilityRules
          .map(
            (EligibilityRuleDto rule) => EligibilityRule(
              id: rule.id,
              field: EligibilityField.fromCode(rule.field),
              operator: EligibilityOperator.fromCode(rule.operator),
              values: rule.values,
              reasonKey: rule.reasonKey,
              isBlocking: rule.isBlocking,
            ),
          )
          .toList(),
      requiredDocuments: requiredDocuments
          .map(
            (DocumentRequirementDto doc) => DocumentRequirement(
              id: doc.id,
              label: doc.label.toDomain(),
              whereToGet: doc.whereToGet.toDomain(),
              isMandatory: doc.isMandatory,
              careerIds: doc.careerIds,
            ),
          )
          .toList(),
      applicationOpensAt: _parseDate(applicationOpensAt),
      applicationClosesAt: _parseDate(applicationClosesAt),
      minClass: minClass,
      maxClass: maxClass,
      applyUrl: applyUrl,
      applySteps: applySteps
          .map((LocalizedTextDto step) => step.toDomain())
          .toList(),
    );
  }
}

/// Converts a career payload into the domain model.
extension CareerDtoMapping on CareerDto {
  /// Builds the domain model for this payload.
  Career toDomainModel() {
    return Career(
      id: id,
      title: title.toDomain(),
      summary: summary.toDomain(),
      category: category,
      educationPath: educationPath,
      interestTags: interestTags,
      relatedCareerIds: relatedCareerIds,
      entrySteps:
          entrySteps.map((LocalizedTextDto step) => step.toDomain()).toList(),
      nonStem: nonStem,
      localTraditionalSkill: localTraditionalSkill,
    );
  }
}

/// Converts a clip payload into the domain model.
extension ClipDtoMapping on ClipDto {
  /// Builds the domain model for this payload.
  Clip toDomainModel() {
    return Clip(
      id: id,
      title: title.toDomain(),
      summary: summary.toDomain(),
      durationSeconds: durationSeconds,
      language: language,
      order: order,
      tags: tags,
      careerIds: careerIds,
      slides: slides,
    );
  }
}

/// Parses a `yyyy-MM-dd` string, tolerating null and malformed input.
DateTime? _parseDate(String? value) {
  if (value == null || value.isEmpty) return null;
  return DateTime.tryParse(value);
}
