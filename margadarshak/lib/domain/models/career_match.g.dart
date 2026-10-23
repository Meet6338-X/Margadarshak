// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CareerMatch _$CareerMatchFromJson(Map<String, dynamic> json) => _CareerMatch(
  career: Career.fromJson(json['career'] as Map<String, dynamic>),
  score: (json['score'] as num).toInt(),
  matchedTags:
      (json['matchedTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$CareerMatchToJson(_CareerMatch instance) =>
    <String, dynamic>{
      'career': instance.career,
      'score': instance.score,
      'matchedTags': instance.matchedTags,
    };
