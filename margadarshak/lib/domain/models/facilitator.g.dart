// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facilitator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FacilitatorClass _$FacilitatorClassFromJson(Map<String, dynamic> json) =>
    _FacilitatorClass(
      classId: json['classId'] as String,
      facilitatorId: json['facilitatorId'] as String,
      name: json['name'] as String,
      schoolName: json['schoolName'] as String,
      state: json['state'] as String,
      district: json['district'] as String,
      students:
          (json['students'] as List<dynamic>?)
              ?.map((e) => RosterStudent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RosterStudent>[],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FacilitatorClassToJson(_FacilitatorClass instance) =>
    <String, dynamic>{
      'classId': instance.classId,
      'facilitatorId': instance.facilitatorId,
      'name': instance.name,
      'schoolName': instance.schoolName,
      'state': instance.state,
      'district': instance.district,
      'students': instance.students,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_RosterStudent _$RosterStudentFromJson(Map<String, dynamic> json) =>
    _RosterStudent(
      studentId: json['studentId'] as String,
      displayName: json['displayName'] as String,
      stage: $enumDecode(_$EducationStageEnumMap, json['stage']),
      currentClass: (json['currentClass'] as num).toInt(),
      category: $enumDecode(_$SocialCategoryEnumMap, json['category']),
      incomeBand: $enumDecode(_$IncomeBandEnumMap, json['incomeBand']),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      firstGenerationLearner: json['firstGenerationLearner'] as bool,
      interestTags:
          (json['interestTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      isFlagged: json['isFlagged'] as bool,
      recommendedOpportunityIds:
          (json['recommendedOpportunityIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      joinedOn: DateTime.parse(json['joinedOn'] as String),
    );

Map<String, dynamic> _$RosterStudentToJson(_RosterStudent instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'displayName': instance.displayName,
      'stage': _$EducationStageEnumMap[instance.stage]!,
      'currentClass': instance.currentClass,
      'category': _$SocialCategoryEnumMap[instance.category]!,
      'incomeBand': _$IncomeBandEnumMap[instance.incomeBand]!,
      'gender': _$GenderEnumMap[instance.gender]!,
      'firstGenerationLearner': instance.firstGenerationLearner,
      'interestTags': instance.interestTags,
      'isFlagged': instance.isFlagged,
      'recommendedOpportunityIds': instance.recommendedOpportunityIds,
      'joinedOn': instance.joinedOn.toIso8601String(),
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

_PublishedModule _$PublishedModuleFromJson(Map<String, dynamic> json) =>
    _PublishedModule(
      moduleId: json['moduleId'] as String,
      title: json['title'] as String,
      description: LocalizedText.fromJson(
        json['description'] as Map<String, dynamic>,
      ),
      pricing: $enumDecode(_$ModulePricingEnumMap, json['pricing']),
      priceInRupees: (json['priceInRupees'] as num).toInt(),
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      clipIds:
          (json['clipIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      ownerFacilitatorId: json['ownerFacilitatorId'] as String,
      publishedOn: DateTime.parse(json['publishedOn'] as String),
    );

Map<String, dynamic> _$PublishedModuleToJson(_PublishedModule instance) =>
    <String, dynamic>{
      'moduleId': instance.moduleId,
      'title': instance.title,
      'description': instance.description,
      'pricing': _$ModulePricingEnumMap[instance.pricing]!,
      'priceInRupees': instance.priceInRupees,
      'durationMinutes': instance.durationMinutes,
      'clipIds': instance.clipIds,
      'ownerFacilitatorId': instance.ownerFacilitatorId,
      'publishedOn': instance.publishedOn.toIso8601String(),
    };

const _$ModulePricingEnumMap = {
  ModulePricing.free: 'free',
  ModulePricing.payPerModule: 'pay_per_module',
  ModulePricing.subscription: 'subscription',
};
