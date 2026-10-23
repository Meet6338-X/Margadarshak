// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eligibility_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EligibilityResult _$EligibilityResultFromJson(Map<String, dynamic> json) =>
    _EligibilityResult(
      opportunityId: json['opportunityId'] as String,
      status: $enumDecode(_$EligibilityStatusEnumMap, json['status']),
      outcomes:
          (json['outcomes'] as List<dynamic>?)
              ?.map((e) => RuleOutcome.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RuleOutcome>[],
      missingFields:
          (json['missingFields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      sourceUrl: json['sourceUrl'] as String,
      lastVerifiedAt: DateTime.parse(json['lastVerifiedAt'] as String),
    );

Map<String, dynamic> _$EligibilityResultToJson(_EligibilityResult instance) =>
    <String, dynamic>{
      'opportunityId': instance.opportunityId,
      'status': _$EligibilityStatusEnumMap[instance.status]!,
      'outcomes': instance.outcomes,
      'missingFields': instance.missingFields,
      'sourceUrl': instance.sourceUrl,
      'lastVerifiedAt': instance.lastVerifiedAt.toIso8601String(),
    };

const _$EligibilityStatusEnumMap = {
  EligibilityStatus.eligible: 'eligible',
  EligibilityStatus.notEligible: 'not_eligible',
  EligibilityStatus.needsInfo: 'needs_info',
};

_RuleOutcome _$RuleOutcomeFromJson(Map<String, dynamic> json) => _RuleOutcome(
  ruleId: json['ruleId'] as String,
  reasonKey: json['reasonKey'] as String,
  passed: json['passed'] as bool,
  isBlocking: json['isBlocking'] as bool,
  actualValue: json['actualValue'] as String?,
  expectedValues:
      (json['expectedValues'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$RuleOutcomeToJson(_RuleOutcome instance) =>
    <String, dynamic>{
      'ruleId': instance.ruleId,
      'reasonKey': instance.reasonKey,
      'passed': instance.passed,
      'isBlocking': instance.isBlocking,
      'actualValue': instance.actualValue,
      'expectedValues': instance.expectedValues,
    };
