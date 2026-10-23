/// Holds the state of one opportunity detail page.
library;

import 'package:flutter/foundation.dart';

import '../../../../core/failure.dart';
import '../../../../domain/models/eligibility_result.dart';
import '../../../../domain/models/explanation.dart';
import '../../../../domain/models/opportunity.dart';
import '../../../../domain/models/student_profile.dart';
import '../../../../domain/repositories/repositories.dart';
import '../../../../domain/use_cases/build_document_checklist.dart';
import '../../../../domain/use_cases/evaluate_eligibility.dart';

/// The rules, the document checklist and the explanation of one record.
class OpportunityDetailViewModel extends ChangeNotifier {
  /// Creates the view model.
  OpportunityDetailViewModel({
    required OpportunityRepository opportunityRepository,
    required ExplanationRepository explanationRepository,
    required EvaluateEligibility evaluateEligibility,
    required BuildDocumentChecklist buildDocumentChecklist,
  })  : _opportunityRepository = opportunityRepository,
        _explanationRepository = explanationRepository,
        _evaluateEligibility = evaluateEligibility,
        _buildDocumentChecklist = buildDocumentChecklist;

  final OpportunityRepository _opportunityRepository;
  final ExplanationRepository _explanationRepository;
  final EvaluateEligibility _evaluateEligibility;
  final BuildDocumentChecklist _buildDocumentChecklist;

  Opportunity? _opportunity;
  EligibilityResult? _eligibility;
  List<DocumentRequirement> _documents = const [];
  Explanation? _explanation;
  bool _isLoading = false;
  bool _isExplaining = false;
  Failure? _failure;

  /// The record on screen.
  Opportunity? get opportunity => _opportunity;

  /// The rule outcome for the signed-in student.
  EligibilityResult? get eligibility => _eligibility;

  /// The documents the student has to collect.
  List<DocumentRequirement> get documents => _documents;

  /// The personalised explanation, once it was asked for.
  Explanation? get explanation => _explanation;

  /// Whether the screen is loading.
  bool get isLoading => _isLoading;

  /// Whether the explanation is being written.
  bool get isExplaining => _isExplaining;

  /// The error that stopped the screen, if any.
  Failure? get failure => _failure;

  /// Loads the record and checks it against [profile].
  Future<void> load(String opportunityId, StudentProfile profile) async {
    _isLoading = true;
    _failure = null;
    notifyListeners();

    final result = await _opportunityRepository.getById(opportunityId);
    final opportunity = result.valueOrNull;
    if (opportunity == null) {
      _failure = result.failureOrNull;
      _isLoading = false;
      notifyListeners();
      return;
    }

    _opportunity = opportunity;
    _eligibility = _evaluateEligibility(opportunity: opportunity, profile: profile);
    _documents = _buildDocumentChecklist(opportunities: [opportunity]);
    _isLoading = false;
    notifyListeners();
  }

  /// Writes the personalised explanation for [profile].
  Future<void> explain(StudentProfile profile, String languageCode) async {
    final opportunity = _opportunity;
    if (opportunity == null) return;

    _isExplaining = true;
    notifyListeners();

    final result = await _explanationRepository.explain(
      profile: profile,
      opportunities: [opportunity],
      languageCode: languageCode,
    );
    _explanation = result.valueOrNull;
    _isExplaining = false;
    notifyListeners();
  }
}
