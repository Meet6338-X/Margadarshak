// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Clip _$ClipFromJson(Map<String, dynamic> json) => _Clip(
  id: json['id'] as String,
  title: LocalizedText.fromJson(json['title'] as Map<String, dynamic>),
  summary: LocalizedText.fromJson(json['summary'] as Map<String, dynamic>),
  durationSeconds: (json['durationSeconds'] as num).toInt(),
  language: json['language'] as String,
  slides:
      (json['slides'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  careerIds:
      (json['careerIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  order: (json['order'] as num).toInt(),
);

Map<String, dynamic> _$ClipToJson(_Clip instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'summary': instance.summary,
  'durationSeconds': instance.durationSeconds,
  'language': instance.language,
  'slides': instance.slides,
  'tags': instance.tags,
  'careerIds': instance.careerIds,
  'order': instance.order,
};
