/// Ranks the career catalogue against a student profile.
library;

import '../models/career.dart';
import '../models/career_match.dart';
import '../models/student_profile.dart';

/// Suggests careers worth considering for a student.
class DiscoverCareers {
  /// Creates the use case.
  const DiscoverCareers();

  /// Scores every career in [careers] against [profile].
  ///
  /// The result is sorted best first. Careers with a zero score are kept so
  /// that the caller can show them as an "explore more" list instead of
  /// hiding options the catalogue holds.
  List<CareerMatch> call({
    required StudentProfile profile,
    required List<Career> careers,
  }) {
    final matches = careers
        .map(
          (career) => _score(profile, career),
        )
        .toList(growable: false);

    matches.sort((a, b) {
      final byScore = b.score.compareTo(a.score);
      if (byScore != 0) return byScore;
      return a.career.id.compareTo(b.career.id);
    });

    return matches;
  }

  CareerMatch _score(StudentProfile profile, Career career) {
    final matched = career.interestTags
        .where((tag) => profile.interests.contains(tag))
        .toList(growable: false);

    var score = matched.length * 3;

    // A career whose category is itself an interest counts as a match too.
    if (profile.interests.contains(career.category)) score += 2;

    // Non-STEM and locally rooted paths are deliberately never penalised: for
    // the students this app is built for they are often the strongest option.
    if (career.nonStem) score += 1;
    if (career.localTraditionalSkill) score += 1;

    return CareerMatch(
      career: career,
      score: score,
      matchedTags: matched,
    );
  }
}
