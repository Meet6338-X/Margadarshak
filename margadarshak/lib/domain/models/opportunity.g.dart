// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Opportunity _$OpportunityFromJson(Map<String, dynamic> json) => _Opportunity(
  id: json['id'] as String,
  kind: $enumDecode(_$OpportunityKindEnumMap, json['kind']),
  title: LocalizedText.fromJson(json['title'] as Map<String, dynamic>),
  summary: LocalizedText.fromJson(json['summary'] as Map<String, dynamic>),
  officialSourceName: json['officialSourceName'] as String,
  officialSourceUrl: json['officialSourceUrl'] as String,
  lastVerifiedAt: DateTime.parse(json['lastVerifiedAt'] as String),
  scope: json['scope'] as String,
  eligibilityRules:
      (json['eligibilityRules'] as List<dynamic>?)
          ?.map((e) => EligibilityRule.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <EligibilityRule>[],
  requiredDocuments:
      (json['requiredDocuments'] as List<dynamic>?)
          ?.map((e) => DocumentRequirement.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <DocumentRequirement>[],
  applicationOpensAt: json['applicationOpensAt'] == null
      ? null
      : DateTime.parse(json['applicationOpensAt'] as String),
  applicationClosesAt: json['applicationClosesAt'] == null
      ? null
      : DateTime.parse(json['applicationClosesAt'] as String),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  careerIds:
      (json['careerIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  minClass: (json['minClass'] as num?)?.toInt(),
  maxClass: (json['maxClass'] as num?)?.toInt(),
  amountDisclosed: json['amountDisclosed'] as bool,
  applyUrl: json['applyUrl'] as String?,
  applySteps:
      (json['applySteps'] as List<dynamic>?)
          ?.map((e) => LocalizedText.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LocalizedText>[],
);

Map<String, dynamic> _$OpportunityToJson(_Opportunity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$OpportunityKindEnumMap[instance.kind]!,
      'title': instance.title,
      'summary': instance.summary,
      'officialSourceName': instance.officialSourceName,
      'officialSourceUrl': instance.officialSourceUrl,
      'lastVerifiedAt': instance.lastVerifiedAt.toIso8601String(),
      'scope': instance.scope,
      'eligibilityRules': instance.eligibilityRules,
      'requiredDocuments': instance.requiredDocuments,
      'applicationOpensAt': instance.applicationOpensAt?.toIso8601String(),
      'applicationClosesAt': instance.applicationClosesAt?.toIso8601String(),
      'categories': instance.categories,
      'careerIds': instance.careerIds,
      'minClass': instance.minClass,
      'maxClass': instance.maxClass,
      'amountDisclosed': instance.amountDisclosed,
      'applyUrl': instance.applyUrl,
      'applySteps': instance.applySteps,
    };

const _$OpportunityKindEnumMap = {
  OpportunityKind.scholarship: 'scholarship',
  OpportunityKind.scheme: 'scheme',
  OpportunityKind.exam: 'exam',
  OpportunityKind.apprenticeship: 'apprenticeship',
};

_EligibilityRule _$EligibilityRuleFromJson(Map<String, dynamic> json) =>
    _EligibilityRule(
      id: json['id'] as String,
      field: $enumDecode(_$EligibilityFieldEnumMap, json['field']),
      operator: $enumDecode(_$EligibilityOperatorEnumMap, json['operator']),
      values:
          (json['values'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      reasonKey: json['reasonKey'] as String,
      isBlocking: json['isBlocking'] as bool? ?? true,
    );

Map<String, dynamic> _$EligibilityRuleToJson(_EligibilityRule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'field': _$EligibilityFieldEnumMap[instance.field]!,
      'operator': _$EligibilityOperatorEnumMap[instance.operator]!,
      'values': instance.values,
      'reasonKey': instance.reasonKey,
      'isBlocking': instance.isBlocking,
    };

const _$EligibilityFieldEnumMap = {
  EligibilityField.educationStage: 'education_stage',
  EligibilityField.currentClass: 'current_class',
  EligibilityField.incomeBand: 'income_band',
  EligibilityField.socialCategory: 'social_category',
  EligibilityField.gender: 'gender',
  EligibilityField.state: 'state',
  EligibilityField.district: 'district',
  EligibilityField.firstGenerationLearner: 'first_generation_learner',
};

const _$EligibilityOperatorEnumMap = {
  EligibilityOperator.equals: 'equals',
  EligibilityOperator.oneOf: 'one_of',
  EligibilityOperator.atMost: 'at_most',
  EligibilityOperator.atLeast: 'at_least',
};

_DocumentRequirement _$DocumentRequirementFromJson(Map<String, dynamic> json) =>
    _DocumentRequirement(
      id: json['id'] as String,
      label: LocalizedText.fromJson(json['label'] as Map<String, dynamic>),
      whereToGet: LocalizedText.fromJson(
        json['whereToGet'] as Map<String, dynamic>,
      ),
      isMandatory: json['isMandatory'] as bool,
      careerIds:
          (json['careerIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$DocumentRequirementToJson(
  _DocumentRequirement instance,
) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'whereToGet': instance.whereToGet,
  'isMandatory': instance.isMandatory,
  'careerIds': instance.careerIds,
};
