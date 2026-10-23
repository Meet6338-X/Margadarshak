/// Fixtures shared by the tests.
library;

import 'package:margadarshak/domain/models/career.dart';
import 'package:margadarshak/domain/models/clip.dart';
import 'package:margadarshak/domain/models/enums.dart';
import 'package:margadarshak/domain/models/localized_text.dart';
import 'package:margadarshak/domain/models/opportunity.dart';
import 'package:margadarshak/domain/models/student_profile.dart';

/// A localisable string that carries the same words in every language.
LocalizedText text(String value) =>
    LocalizedText(en: value, hi: value, mr: value);

/// Builds a student profile for the tests.
StudentProfile buildProfile({
  String studentId = 'student_1',
  String displayName = 'Asha',
  EducationStage stage = EducationStage.higherSecondary,
  int currentClass = 11,
  String state = 'mh',
  String district = 'pune',
  SocialCategory category = SocialCategory.otherBackwardClasses,
  IncomeBand incomeBand = IncomeBand.belowOneLakh,
  Gender gender = Gender.female,
  bool firstGenerationLearner = true,
  String? lifeSituation,
  Set<String> interests = const <String>{'health', 'books'},
}) {
  return StudentProfile(
    studentId: studentId,
    displayName: displayName,
    stage: stage,
    currentClass: currentClass,
    state: state,
    district: district,
    category: category,
    incomeBand: incomeBand,
    gender: gender,
    firstGenerationLearner: firstGenerationLearner,
    lifeSituation: lifeSituation,
    interests: interests,
    createdAt: DateTime(2026, 1, 1),
  );
}

/// Builds an opportunity for the tests.
Opportunity buildOpportunity({
  String id = 'opp_1',
  OpportunityKind kind = OpportunityKind.scholarship,
  String scope = 'national',
  List<EligibilityRule> eligibilityRules = const <EligibilityRule>[],
  List<DocumentRequirement> requiredDocuments = const <DocumentRequirement>[],
  List<String> categories = const <String>[],
  List<String> careerIds = const <String>[],
  int? minClass,
  int? maxClass,
  DateTime? applicationOpensAt,
  DateTime? applicationClosesAt,
}) {
  return Opportunity(
    id: id,
    kind: kind,
    title: text('Test opportunity'),
    summary: text('A test opportunity'),
    officialSourceName: 'Official portal',
    officialSourceUrl: 'https://example.gov.in/test',
    lastVerifiedAt: DateTime(2026, 9, 1),
    scope: scope,
    eligibilityRules: eligibilityRules,
    requiredDocuments: requiredDocuments,
    categories: categories,
    careerIds: careerIds,
    minClass: minClass,
    maxClass: maxClass,
    applicationOpensAt: applicationOpensAt,
    applicationClosesAt: applicationClosesAt,
    amountDisclosed: true,
  );
}

/// Builds a document requirement for the tests.
DocumentRequirement buildDocument({
  String id = 'income_certificate',
  bool isMandatory = true,
  List<String> careerIds = const <String>[],
}) {
  return DocumentRequirement(
    id: id,
    label: text('Income certificate'),
    whereToGet: text('Tahsildar office'),
    isMandatory: isMandatory,
    careerIds: careerIds,
  );
}

/// Builds a career for the tests.
Career buildCareer({
  String id = 'career_1',
  String category = 'health',
  List<String> interestTags = const <String>[],
  bool nonStem = false,
  bool localTraditionalSkill = false,
}) {
  return Career(
    id: id,
    title: text('Test career'),
    summary: text('A test career'),
    category: category,
    interestTags: interestTags,
    nonStem: nonStem,
    localTraditionalSkill: localTraditionalSkill,
  );
}

/// Builds a clip for the tests.
Clip buildClip({
  String id = 'clip_1',
  String language = 'mr',
  int durationSeconds = 40,
  int order = 0,
}) {
  return Clip(
    id: id,
    title: text('Test clip'),
    summary: text('A test clip'),
    durationSeconds: durationSeconds,
    language: language,
    order: order,
  );
}
