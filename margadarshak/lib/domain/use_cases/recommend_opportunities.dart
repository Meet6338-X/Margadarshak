/// Builds the ranked list of opportunities for a student.
library;

import '../models/eligibility_result.dart';
import '../models/enums.dart';
import '../models/interest_taxonomy.dart';
import '../models/opportunity.dart';
import '../models/opportunity_recommendation.dart';
import '../models/student_profile.dart';
import 'evaluate_eligibility.dart';

/// Pairs every opportunity with a verdict and a relevance score.
class RecommendOpportunities {
  /// Creates the use case.
  const RecommendOpportunities({this.evaluator = const EvaluateEligibility()});

  /// The rules engine used to produce the verdict.
  final EvaluateEligibility evaluator;

  /// Returns the opportunities worth showing to [profile].
  ///
  /// Opportunities the student clearly does not qualify for are dropped unless
  /// [includeNotEligible] is set, so the app never shows a scheme the rules
  /// have already ruled out.
  List<OpportunityRecommendation> call({
    required StudentProfile profile,
    required List<Opportunity> opportunities,
    bool includeNotEligible = false,
  }) {
    final recommendations = opportunities
        .map(
          (opportunity) => OpportunityRecommendation(
            opportunity: opportunity,
            eligibility: evaluator(opportunity: opportunity, profile: profile),
            relevanceScore: _relevance(profile, opportunity),
          ),
        )
        .where(
          (recommendation) =>
              includeNotEligible ||
              recommendation.eligibility.isEligible ||
              recommendation.eligibility.needsInfo,
        )
        .toList(growable: false);

    recommendations.sort((a, b) {
      final byStatus = _statusRank(b.eligibility.status).compareTo(
        _statusRank(a.eligibility.status),
      );
      if (byStatus != 0) return byStatus;

      final byRelevance = b.relevanceScore.compareTo(a.relevanceScore);
      if (byRelevance != 0) return byRelevance;

      final byDeadline = _deadlineRank(a).compareTo(_deadlineRank(b));
      if (byDeadline != 0) return byDeadline;

      return a.opportunity.id.compareTo(b.opportunity.id);
    });

    return recommendations;
  }

  int _statusRank(EligibilityStatus status) => switch (status) {
        EligibilityStatus.eligible => 2,
        EligibilityStatus.needsInfo => 1,
        EligibilityStatus.notEligible => 0,
      };

  int _deadlineRank(OpportunityRecommendation recommendation) {
    final closes = recommendation.opportunity.applicationClosesAt;
    if (closes == null) return 1;
    return closes.millisecondsSinceEpoch;
  }

  int _relevance(StudentProfile profile, Opportunity opportunity) {
    var score = 0;

    final impliedTags =
        InterestTaxonomy.tagsForCategories(opportunity.categories);
    final categoryOverlap = impliedTags.where(profile.interests.contains).length;
    score += categoryOverlap * 2;

    if (opportunity.careerIds.isNotEmpty) score += 1;

    final scope = opportunity.scope.toLowerCase();
    if (scope == profile.state.toLowerCase()) {
      score += 2;
    } else if (scope == 'national') {
      score += 1;
    }

    return score;
  }
}
