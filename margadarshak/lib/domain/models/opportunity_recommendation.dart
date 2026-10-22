/// An opportunity together with its eligibility verdict and relevance score.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'eligibility_result.dart';
import 'opportunity.dart';

part 'opportunity_recommendation.freezed.dart';
part 'opportunity_recommendation.g.dart';

/// One row in the "your opportunities" list.
@freezed
abstract class OpportunityRecommendation with _$OpportunityRecommendation {
  /// Creates an opportunity recommendation.
  const factory OpportunityRecommendation({
    /// The opportunity itself.
    required Opportunity opportunity,

    /// The eligibility verdict for this student.
    required EligibilityResult eligibility,

    /// How relevant the opportunity is to this student, higher is better.
    required int relevanceScore,
  }) = _OpportunityRecommendation;

  /// Reads an opportunity recommendation from JSON.
  factory OpportunityRecommendation.fromJson(Map<String, Object?> json) =>
      _$OpportunityRecommendationFromJson(json);
}
