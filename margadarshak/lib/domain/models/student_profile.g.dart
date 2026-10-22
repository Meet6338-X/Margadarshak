// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StudentProfile _$StudentProfileFromJson(Map<String, dynamic> json) =>
    _StudentProfile(
      studentId: json['studentId'] as String,
      displayName: json['displayName'] as String,
      stage: $enumDecode(_$EducationStageEnumMap, json['stage']),
      currentClass: (json['currentClass'] as num).toInt(),
      state: json['state'] as String,
      district: json['district'] as String,
      category: $enumDecode(_$SocialCategoryEnumMap, json['category']),
      incomeBand: $enumDecode(_$IncomeBandEnumMap, json['incomeBand']),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      firstGenerationLearner: json['firstGenerationLearner'] as bool,
      interests:
          (json['interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const <String>{},
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$StudentProfileToJson(_StudentProfile instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'displayName': instance.displayName,
      'stage': _$EducationStageEnumMap[instance.stage]!,
      'currentClass': instance.currentClass,
      'state': instance.state,
      'district': instance.district,
      'category': _$SocialCategoryEnumMap[instance.category]!,
      'incomeBand': _$IncomeBandEnumMap[instance.incomeBand]!,
      'gender': _$GenderEnumMap[instance.gender]!,
      'firstGenerationLearner': instance.firstGenerationLearner,
      'interests': instance.interests.toList(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$EducationStageEnumMap = {
  EducationStage.secondary: 'secondary',
  EducationStage.higherSecondary: 'higher_secondary',
  EducationStage.graduation: 'graduation',
};

const _$SocialCategoryEnumMap = {
  SocialCategory.general: 'general',
  SocialCategory.scheduledCaste: 'sc',
  SocialCategory.scheduledTribe: 'st',
  SocialCategory.otherBackwardClasses: 'obc',
  SocialCategory.personWithDisability: 'pwd',
};

const _$IncomeBandEnumMap = {
  IncomeBand.belowOneLakh: 'below_1lakh',
  IncomeBand.oneToTwoAndHalfLakh: '1lakh_2_5lakh',
  IncomeBand.twoAndHalfToFiveLakh: '2_5lakh_5lakh',
  IncomeBand.aboveFiveLakh: 'above_5lakh',
};

const _$GenderEnumMap = {
  Gender.female: 'female',
  Gender.male: 'male',
  Gender.other: 'other',
};
