// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpportunityRecommendation _$OpportunityRecommendationFromJson(
  Map<String, dynamic> json,
) => _OpportunityRecommendation(
  opportunity: Opportunity.fromJson(
    json['opportunity'] as Map<String, dynamic>,
  ),
  eligibility: EligibilityResult.fromJson(
    json['eligibility'] as Map<String, dynamic>,
  ),
  relevanceScore: (json['relevanceScore'] as num).toInt(),
);

Map<String, dynamic> _$OpportunityRecommendationToJson(
  _OpportunityRecommendation instance,
) => <String, dynamic>{
  'opportunity': instance.opportunity,
  'eligibility': instance.eligibility,
  'relevanceScore': instance.relevanceScore,
};
