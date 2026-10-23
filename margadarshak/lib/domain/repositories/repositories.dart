/// The contract every data provider has to satisfy.
///
/// The ViewModels depend on these interfaces only, never on Drift, Firebase or
/// the JSON asset loader. That is what lets the same screen run against the
/// offline pack today and against the REST API later.
library;

import '../../core/result.dart';
import '../models/auth_user.dart';
import '../models/career.dart';
import '../models/clip.dart';
import '../models/enums.dart';
import '../models/explanation.dart';
import '../models/facilitator.dart';
import '../models/opportunity.dart';
import '../models/progress.dart';
import '../models/student_profile.dart';

/// Reads scholarships, schemes, examinations and apprenticeships.
abstract interface class OpportunityRepository {
  /// Returns every opportunity, optionally limited to one scope.
  Future<Result<List<Opportunity>>> getAll({String? scope});

  /// Returns one opportunity by its identifier.
  Future<Result<Opportunity>> getById(String id);

  /// Returns the opportunities that lead towards [careerId].
  Future<Result<List<Opportunity>>> getForCareer(String careerId);

  /// The version of the data pack currently loaded.
  Future<Result<String>> getDataPackVersion();
}

/// Reads the curated career catalogue.
abstract interface class CareerRepository {
  /// Returns every career.
  Future<Result<List<Career>>> getAll();

  /// Returns one career by its identifier.
  Future<Result<Career>> getById(String id);
}

/// Reads the short learning clips.
abstract interface class ClipRepository {
  /// Returns every clip.
  Future<Result<List<Clip>>> getAll();

  /// Returns one clip by its identifier.
  Future<Result<Clip>> getById(String id);
}

/// Reads and writes the student profile and the learning progress.
abstract interface class StudentRepository {
  /// Returns the profile of [studentId].
  Future<Result<StudentProfile>> getProfile(String studentId);

  /// Saves [profile] and returns the saved copy.
  Future<Result<StudentProfile>> saveProfile(StudentProfile profile);

  /// Returns the learning progress of [studentId].
  Future<Result<LearningProgress>> getProgress(String studentId);

  /// Saves [progress] and returns the saved copy.
  Future<Result<LearningProgress>> saveProgress(LearningProgress progress);
}

/// Reads and writes the facilitator's classes, flags and modules.
abstract interface class ClassRepository {
  /// Returns every class the facilitator looks after.
  Future<Result<List<FacilitatorClass>>> getClasses(String facilitatorId);

  /// Saves [classRecord] and returns the saved copy.
  Future<Result<FacilitatorClass>> saveClass(FacilitatorClass classRecord);

  /// Flags or unflags a student as talented.
  Future<Result<FacilitatorClass>> setTalentFlag({
    required String classId,
    required String studentId,
    required bool isFlagged,
  });

  /// Recommends an opportunity to a student.
  Future<Result<FacilitatorClass>> recommendOpportunity({
    required String classId,
    required String studentId,
    required String opportunityId,
  });

  /// Returns the modules the facilitator published.
  Future<Result<List<PublishedModule>>> getModules(String facilitatorId);

  /// Saves a module and returns the saved copy.
  Future<Result<PublishedModule>> saveModule(PublishedModule module);
}

/// Writes the personalised explanation of a set of recommendations.
abstract interface class ExplanationRepository {
  /// Explains [opportunities] for [profile] in [languageCode].
  ///
  /// Implementations must cite the records they used and must refuse when
  /// nothing verified matches.
  Future<Result<Explanation>> explain({
    required StudentProfile profile,
    required List<Opportunity> opportunities,
    required String languageCode,
  });
}

/// Signs the user in and out.
abstract interface class AuthRepository {
  /// The user that is signed in right now, or `null`.
  Future<Result<AuthUser?>> currentUser();

  /// Signs a user in.
  Future<Result<AuthUser>> signIn({
    required String userId,
    required String displayName,
    required UserRole role,
  });

  /// Signs the current user out.
  Future<Result<void>> signOut();

  /// Emits whenever the signed-in user changes.
  Stream<AuthUser?> authStateChanges();
}
