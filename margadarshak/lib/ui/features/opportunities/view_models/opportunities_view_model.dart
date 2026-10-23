/// Filters the opportunity list for the student.
library;

import 'package:flutter/foundation.dart';

import '../../../../core/failure.dart';
import '../../../../domain/models/eligibility_result.dart';
import '../../../../domain/models/opportunity_recommendation.dart';
import '../../../../domain/models/student_profile.dart';
import '../../../../domain/repositories/repositories.dart';
import '../../../../domain/use_cases/collect_deadline_alerts.dart';
import '../../../../domain/use_cases/recommend_opportunities.dart';

/// Which slice of the catalogue the student is looking at.
enum OpportunityScope {
  /// Everything that applies.
  all,

  /// Only the national layer.
  national,

  /// Only the student's own state pack.
  state,
}

/// Holds the state of the Opportunities screen.
class OpportunitiesViewModel extends ChangeNotifier {
  /// Creates the view model.
  OpportunitiesViewModel({
    required OpportunityRepository opportunityRepository,
    required RecommendOpportunities recommendOpportunities,
    CollectDeadlineAlerts collectDeadlineAlerts = const CollectDeadlineAlerts(),
  })  : _opportunityRepository = opportunityRepository,
        _recommendOpportunities = recommendOpportunities,
        _collectDeadlineAlerts = collectDeadlineAlerts;

  final OpportunityRepository _opportunityRepository;
  final RecommendOpportunities _recommendOpportunities;
  final CollectDeadlineAlerts _collectDeadlineAlerts;

  List<OpportunityRecommendation> _all = const [];
  bool _onlyEligible = true;
  OpportunityScope _scope = OpportunityScope.all;
  String _query = '';
  bool _isLoading = false;
  Failure? _failure;

  /// Whether only the opportunities the student qualifies for are shown.
  bool get onlyEligible => _onlyEligible;

  /// The scope the student picked.
  OpportunityScope get scope => _scope;

  /// The search text.
  String get query => _query;

  /// Whether the screen is loading.
  bool get isLoading => _isLoading;

  /// The error that stopped the screen, if any.
  Failure? get failure => _failure;

  /// The opportunities that pass the current filters.
  List<OpportunityRecommendation> get visible {
    final lowered = _query.trim().toLowerCase();
    return _all.where((item) {
      if (_onlyEligible && item.eligibility.isNotEligible) return false;
      if (_scope == OpportunityScope.national && item.opportunity.scope != 'national') {
        return false;
      }
      if (_scope == OpportunityScope.state && item.opportunity.scope == 'national') {
        return false;
      }
      if (lowered.isEmpty) return true;
      return item.opportunity.title.en.toLowerCase().contains(lowered) ||
          (item.opportunity.title.hi ?? '').toLowerCase().contains(lowered) ||
          (item.opportunity.title.mr ?? '').toLowerCase().contains(lowered);
    }).toList(growable: false);
  }

  /// The number of opportunities that pass the current filters.
  int get visibleCount => visible.length;

  /// The application windows that are about to close, soonest first.
  ///
  /// Records the student does not qualify for are left out: an urgent
  /// deadline for something the student cannot claim is noise, not help.
  List<DeadlineAlert> get urgentDeadlines {
    final now = DateTime.now();
    final candidates = _all
        .where((item) => !item.eligibility.isNotEligible)
        .map((item) => item.opportunity)
        .toList(growable: false);
    return _collectDeadlineAlerts(opportunities: candidates, now: now)
        .take(3)
        .toList(growable: false);
  }

  /// Loads the catalogue for [profile].
  Future<void> load(StudentProfile profile) async {
    _isLoading = true;
    _failure = null;
    notifyListeners();

    final result = await _opportunityRepository.getAll();
    final opportunities = result.valueOrNull;
    if (opportunities == null) {
      _failure = result.failureOrNull;
      _isLoading = false;
      notifyListeners();
      return;
    }

    _all = _recommendOpportunities(
      profile: profile,
      opportunities: opportunities,
      includeNotEligible: true,
    );
    _isLoading = false;
    notifyListeners();
  }

  /// Shows or hides the opportunities the student does not qualify for.
  void toggleOnlyEligible(bool value) {
    _onlyEligible = value;
    notifyListeners();
  }

  /// Changes the scope of the catalogue on screen.
  void setScope(OpportunityScope scope) {
    _scope = scope;
    notifyListeners();
  }

  /// Filters the catalogue by the text the student typed.
  void setQuery(String query) {
    _query = query;
    notifyListeners();
  }
}
