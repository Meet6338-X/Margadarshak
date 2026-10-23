// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explanation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Explanation _$ExplanationFromJson(Map<String, dynamic> json) => _Explanation(
  text: json['text'] as String,
  citedOpportunityIds:
      (json['citedOpportunityIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  nextSteps:
      (json['nextSteps'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  hasVerifiedMatch: json['hasVerifiedMatch'] as bool,
  languageCode: json['languageCode'] as String,
  generatedAt: DateTime.parse(json['generatedAt'] as String),
);

Map<String, dynamic> _$ExplanationToJson(_Explanation instance) =>
    <String, dynamic>{
      'text': instance.text,
      'citedOpportunityIds': instance.citedOpportunityIds,
      'nextSteps': instance.nextSteps,
      'hasVerifiedMatch': instance.hasVerifiedMatch,
      'languageCode': instance.languageCode,
      'generatedAt': instance.generatedAt.toIso8601String(),
    };
