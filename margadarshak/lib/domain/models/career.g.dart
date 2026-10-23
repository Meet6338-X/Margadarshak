// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Career _$CareerFromJson(Map<String, dynamic> json) => _Career(
  id: json['id'] as String,
  title: LocalizedText.fromJson(json['title'] as Map<String, dynamic>),
  summary: LocalizedText.fromJson(json['summary'] as Map<String, dynamic>),
  category: json['category'] as String,
  educationPath:
      (json['educationPath'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  interestTags:
      (json['interestTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  relatedCareerIds:
      (json['relatedCareerIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  entrySteps:
      (json['entrySteps'] as List<dynamic>?)
          ?.map((e) => LocalizedText.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LocalizedText>[],
  nonStem: json['nonStem'] as bool,
  localTraditionalSkill: json['localTraditionalSkill'] as bool,
);

Map<String, dynamic> _$CareerToJson(_Career instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'summary': instance.summary,
  'category': instance.category,
  'educationPath': instance.educationPath,
  'interestTags': instance.interestTags,
  'relatedCareerIds': instance.relatedCareerIds,
  'entrySteps': instance.entrySteps,
  'nonStem': instance.nonStem,
  'localTraditionalSkill': instance.localTraditionalSkill,
};
