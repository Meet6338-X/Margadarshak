/// Writes the personalised explanation of a set of verified matches.
library;

import '../models/eligibility_result.dart';
import '../models/explanation.dart';
import '../models/localized_text.dart';
import '../models/opportunity.dart';
import '../models/student_profile.dart';
import 'build_document_checklist.dart';
import 'evaluate_eligibility.dart';

/// Turns verified opportunities into an explanation a student can act on.
///
/// The explanation is assembled from the records themselves, which is what
/// keeps it honest: every sentence points back to a record the student can
/// open. When nothing matches, the use case refuses instead of padding the
/// answer with something that only sounds helpful.
class BuildExplanation {
  /// Creates the use case.
  const BuildExplanation({
    this.evaluator = const EvaluateEligibility(),
    this.checklist = const BuildDocumentChecklist(),
  });

  /// Decides whether the student satisfies the rules of a record.
  final EvaluateEligibility evaluator;

  /// Collects the documents the student has to collect.
  final BuildDocumentChecklist checklist;

  /// How many records are quoted in the explanation.
  static const int maxCitedRecords = 3;

  /// How many document steps are listed.
  static const int maxNextSteps = 3;

  /// Builds the explanation of [opportunities] for [profile].
  Explanation call({
    required StudentProfile profile,
    required List<Opportunity> opportunities,
    required String languageCode,
  }) {
    final verified = <Opportunity>[];
    for (final opportunity in opportunities) {
      final result = evaluator(opportunity: opportunity, profile: profile);
      if (result.isEligible) verified.add(opportunity);
    }

    if (verified.isEmpty) {
      return Explanation(
        text: '',
        citedOpportunityIds: const <String>[],
        nextSteps: const <String>[],
        hasVerifiedMatch: false,
        languageCode: languageCode,
        generatedAt: DateTime.now(),
      );
    }

    final quoted = verified.take(maxCitedRecords).toList(growable: false);

    final buffer = StringBuffer();
    for (final opportunity in quoted) {
      buffer.writeln('• ${opportunity.title.resolve(languageCode)}');
      final summary = opportunity.summary.resolve(languageCode).trim();
      if (summary.isNotEmpty) {
        buffer.writeln('  $summary');
      }
    }

    final documents = checklist(opportunities: quoted);
    final steps = <String>[];
    for (final document in documents.where((d) => d.isMandatory)) {
      steps.add(
        '${document.label.resolve(languageCode)} — ${document.whereToGet.resolve(languageCode)}',
      );
      if (steps.length >= maxNextSteps) break;
    }

    return Explanation(
      text: buffer.toString().trimRight(),
      citedOpportunityIds: quoted.map((opportunity) => opportunity.id).toList(growable: false),
      nextSteps: steps,
      hasVerifiedMatch: true,
      languageCode: languageCode,
      generatedAt: DateTime.now(),
    );
  }
}
