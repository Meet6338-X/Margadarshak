/// Turns a student profile into a ranked set of career suggestions.
library;

import 'package:flutter/foundation.dart';

import '../../../../core/failure.dart';
import '../../../../domain/models/career_match.dart';
import '../../../../domain/models/opportunity_recommendation.dart';
import '../../../../domain/models/student_profile.dart';
import '../../../../domain/repositories/repositories.dart';
import '../../../../domain/use_cases/discover_careers.dart';
import '../../../../domain/use_cases/recommend_opportunities.dart';

/// Holds the state of the Discover screen.
class DiscoverViewModel extends ChangeNotifier {
  /// Creates the view model.
  DiscoverViewModel({
    required DiscoverCareers discoverCareers,
    required CareerRepository careerRepository,
    required OpportunityRepository opportunityRepository,
    required RecommendOpportunities recommendOpportunities,
  })  : _discoverCareers = discoverCareers,
        _careerRepository = careerRepository,
        _opportunityRepository = opportunityRepository,
        _recommendOpportunities = recommendOpportunities;

  final DiscoverCareers _discoverCareers;
  final CareerRepository _careerRepository;
  final OpportunityRepository _opportunityRepository;
  final RecommendOpportunities _recommendOpportunities;

  List<CareerMatch> _matches = const [];
  List<OpportunityRecommendation> _recommendations = const [];
  bool _isLoading = false;
  Failure? _failure;

  /// Every career with its match score.
  List<CareerMatch> get matches => _matches;

  /// The careers that matched the student's interests.
  List<CareerMatch> get topMatches =>
      _matches.where((match) => match.score > 0).toList(growable: false);

  /// The careers the student did not match yet, shown as "explore more".
  List<CareerMatch> get exploreMore =>
      _matches.where((match) => match.score == 0).toList(growable: false);

  /// The opportunities that fit the student's profile.
  List<OpportunityRecommendation> get recommendations => _recommendations;

  /// Whether the screen is loading.
  bool get isLoading => _isLoading;

  /// The error that stopped the screen, if any.
  Failure? get failure => _failure;

  /// Loads the careers and opportunities for [profile].
  Future<void> load(StudentProfile profile) async {
    _isLoading = true;
    _failure = null;
    notifyListeners();

    final careersResult = await _careerRepository.getAll();
    final careers = careersResult.valueOrNull;
    if (careers == null) {
      _failure = careersResult.failureOrNull;
      _isLoading = false;
      notifyListeners();
      return;
    }

    final opportunitiesResult = await _opportunityRepository.getAll();
    final opportunities = opportunitiesResult.valueOrNull;
    if (opportunities == null) {
      _failure = opportunitiesResult.failureOrNull;
      _isLoading = false;
      notifyListeners();
      return;
    }

    _matches = _discoverCareers(profile: profile, careers: careers);
    _recommendations = _recommendOpportunities(
      profile: profile,
      opportunities: opportunities,
    );
    _isLoading = false;
    notifyListeners();
  }
}
