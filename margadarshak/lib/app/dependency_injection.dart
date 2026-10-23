/// Wires every service, repository and use case together.
///
/// The container is the only place that knows whether the app runs against
/// the bundled data packs and the local database, or against Firebase.
library;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../core/config/app_config.dart';
import '../core/logging/app_logger.dart';
import '../data/local/app_database.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/career_repository.dart';
import '../data/repositories/class_repository.dart';
import '../data/repositories/clip_repository.dart';
import '../data/repositories/explanation_repository.dart';
import '../data/repositories/opportunity_repository.dart';
import '../data/repositories/student_repository.dart';
import '../data/services/auth_service.dart';
import '../data/services/data_pack_service.dart';
import '../data/services/speech_service.dart';
import '../data/services/user_data_service.dart';
import '../domain/repositories/repositories.dart';
import '../domain/use_cases/build_daily_queue.dart';
import '../domain/use_cases/build_document_checklist.dart';
import '../domain/use_cases/build_explanation.dart';
import '../domain/use_cases/compute_streak.dart';
import '../domain/use_cases/discover_careers.dart';
import '../domain/use_cases/evaluate_eligibility.dart';
import '../domain/use_cases/recommend_opportunities.dart';

/// Everything the UI needs, resolved once at start-up.
class AppDependencies {
  /// Creates the container.
  const AppDependencies({
    required this.database,
    required this.authRepository,
    required this.studentRepository,
    required this.opportunityRepository,
    required this.careerRepository,
    required this.clipRepository,
    required this.classRepository,
    required this.explanationRepository,
    required this.speechService,
    required this.evaluateEligibility,
    required this.discoverCareers,
    required this.recommendOpportunities,
    required this.buildDailyQueue,
    required this.computeStreak,
    required this.buildDocumentChecklist,
    required this.buildExplanation,
    required this.usingFirebase,
  });

  /// The local database.
  final AppDatabase database;

  /// Authentication.
  final AuthRepository authRepository;

  /// The student's own profile and progress.
  final StudentRepository studentRepository;

  /// Scholarships, schemes, exams and apprenticeships.
  final OpportunityRepository opportunityRepository;

  /// The career catalogue.
  final CareerRepository careerRepository;

  /// The short learning clips.
  final ClipRepository clipRepository;

  /// The facilitator's classes and modules.
  final ClassRepository classRepository;

  /// The personalised explanation.
  final ExplanationRepository explanationRepository;

  /// Speech input and output.
  final SpeechService speechService;

  /// Decides whether a student qualifies for a record.
  final EvaluateEligibility evaluateEligibility;

  /// Ranks careers against a profile.
  final DiscoverCareers discoverCareers;

  /// Ranks opportunities against a profile.
  final RecommendOpportunities recommendOpportunities;

  /// Builds the five clip queue of the day.
  final BuildDailyQueue buildDailyQueue;

  /// Computes the streak, freezes included.
  final ComputeStreak computeStreak;

  /// Collects the documents a student has to collect.
  final BuildDocumentChecklist buildDocumentChecklist;

  /// Writes the personalised explanation.
  final BuildExplanation buildExplanation;

  /// Whether Firebase is actually in use in this build.
  final bool usingFirebase;

  /// Builds the container and opens the local database.
  static Future<AppDependencies> create() async {
    final database = AppDatabase.open();
    const dataPackService = DataPackService();

    final useFirebase = await _initialiseFirebase();

    final AuthService authService = useFirebase
        ? FirebaseAuthService()
        : OfflineAuthService();

    final UserDataService userDataService = useFirebase
        ? FirebaseUserDataService(FirebaseFirestore.instance)
        : LocalUserDataService(database);

    final OpportunityRepository opportunityRepository = LocalOpportunityRepository(
      dataPackService: dataPackService,
      database: database,
    );

    return AppDependencies(
      database: database,
      authRepository: LocalAuthRepository(authService: authService),
      studentRepository: LocalStudentRepository(userDataService: userDataService),
      opportunityRepository: opportunityRepository,
      careerRepository: LocalCareerRepository(dataPackService: dataPackService),
      clipRepository: LocalClipRepository(dataPackService: dataPackService),
      classRepository: LocalClassRepository(userDataService: userDataService),
      explanationRepository: LocalExplanationRepository(),
      speechService: DeviceSpeechService(),
      evaluateEligibility: const EvaluateEligibility(),
      discoverCareers: const DiscoverCareers(),
      recommendOpportunities: const RecommendOpportunities(),
      buildDailyQueue: const BuildDailyQueue(),
      computeStreak: const ComputeStreak(),
      buildDocumentChecklist: const BuildDocumentChecklist(),
      buildExplanation: const BuildExplanation(),
      usingFirebase: useFirebase,
    );
  }

  static Future<bool> _initialiseFirebase() async {
    if (!AppConfig.useFirebase) return false;
    if (!AppConfig.isFirebaseConfigured) {
      AppLogger.warning(
        'Firebase was requested but is not configured. Falling back to the offline back end.',
      );
      return false;
    }
    try {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: AppConfig.firebaseApiKey,
          appId: AppConfig.firebaseAppId,
          projectId: AppConfig.firebaseProjectId,
          messagingSenderId: AppConfig.firebaseMessagingSenderId,
          authDomain: AppConfig.firebaseAuthDomain,
        ),
      );
      return true;
    } catch (error, stackTrace) {
      AppLogger.error('Firebase could not be started.', error, stackTrace);
      return false;
    }
  }
}
