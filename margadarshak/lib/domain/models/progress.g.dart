// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Streak _$StreakFromJson(Map<String, dynamic> json) => _Streak(
  currentDays: (json['currentDays'] as num).toInt(),
  longestDays: (json['longestDays'] as num).toInt(),
  lastCompletedOn: json['lastCompletedOn'] == null
      ? null
      : DateTime.parse(json['lastCompletedOn'] as String),
  freezesAvailable: (json['freezesAvailable'] as num?)?.toInt() ?? 2,
  freezesUsed: (json['freezesUsed'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$StreakToJson(_Streak instance) => <String, dynamic>{
  'currentDays': instance.currentDays,
  'longestDays': instance.longestDays,
  'lastCompletedOn': instance.lastCompletedOn?.toIso8601String(),
  'freezesAvailable': instance.freezesAvailable,
  'freezesUsed': instance.freezesUsed,
};

_Badge _$BadgeFromJson(Map<String, dynamic> json) => _Badge(
  id: json['id'] as String,
  label: LocalizedText.fromJson(json['label'] as Map<String, dynamic>),
  description: LocalizedText.fromJson(
    json['description'] as Map<String, dynamic>,
  ),
  awardedOn: DateTime.parse(json['awardedOn'] as String),
);

Map<String, dynamic> _$BadgeToJson(_Badge instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'description': instance.description,
  'awardedOn': instance.awardedOn.toIso8601String(),
};

_LearningProgress _$LearningProgressFromJson(Map<String, dynamic> json) =>
    _LearningProgress(
      studentId: json['studentId'] as String,
      completedClipIds:
          (json['completedClipIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const <String>{},
      completedDates:
          (json['completedDates'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const <String>{},
      points: (json['points'] as num).toInt(),
      badges:
          (json['badges'] as List<dynamic>?)
              ?.map((e) => Badge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Badge>[],
      streak: Streak.fromJson(json['streak'] as Map<String, dynamic>),
      viewedOpportunityIds:
          (json['viewedOpportunityIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const <String>{},
    );

Map<String, dynamic> _$LearningProgressToJson(_LearningProgress instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'completedClipIds': instance.completedClipIds.toList(),
      'completedDates': instance.completedDates.toList(),
      'points': instance.points,
      'badges': instance.badges,
      'streak': instance.streak,
      'viewedOpportunityIds': instance.viewedOpportunityIds.toList(),
    };
