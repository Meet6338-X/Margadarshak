/// Writes the personalised explanation of a set of recommendations.
library;

import '../../core/result.dart';
import '../../domain/models/explanation.dart';
import '../../domain/models/opportunity.dart';
import '../../domain/models/student_profile.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/use_cases/build_explanation.dart';

/// The offline explanation.
///
/// It quotes the records themselves, so the student can open the source and
/// check it. When no record matches the student, the explanation says so
/// instead of inventing something.
class LocalExplanationRepository implements ExplanationRepository {
  /// Creates the repository.
  LocalExplanationRepository({BuildExplanation builder = const BuildExplanation()}) : _builder = builder;

  final BuildExplanation _builder;

  @override
  Future<Result<Explanation>> explain({
    required StudentProfile profile,
    required List<Opportunity> opportunities,
    required String languageCode,
  }) async {
    final explanation = _builder(
      profile: profile,
      opportunities: opportunities,
      languageCode: languageCode,
    );
    return Result<Explanation>.success(explanation);
  }
}
