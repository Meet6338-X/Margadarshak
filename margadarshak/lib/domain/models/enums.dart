/// Enumerations shared by the domain models.
///
/// Every enum carries a stable `code` that is used in the JSON data packs and
/// in the rules engine, so that renaming a Dart constant never breaks a stored
/// record.
library;

import 'package:json_annotation/json_annotation.dart';

/// How far along the student is in their education.
enum EducationStage {
  /// Secondary school, classes 9 and 10.
  @JsonValue('secondary')
  secondary('secondary'),

  /// Higher secondary school, classes 11 and 12.
  @JsonValue('higher_secondary')
  higherSecondary('higher_secondary'),

  /// Undergraduate studies.
  @JsonValue('graduation')
  graduation('graduation');

  /// Creates a stage with its wire value.
  const EducationStage(this.code);

  /// The stable wire value.
  final String code;

  /// Reads a stage from its wire value.
  static EducationStage fromCode(String code) => values.firstWhere(
        (value) => value.code == code,
        orElse: () => EducationStage.secondary,
      );
}

/// Social category, used by most government scholarship schemes.
enum SocialCategory {
  /// General / open category.
  @JsonValue('general')
  general('general'),

  /// Scheduled Caste.
  @JsonValue('sc')
  scheduledCaste('sc'),

  /// Scheduled Tribe.
  @JsonValue('st')
  scheduledTribe('st'),

  /// Other Backward Classes.
  @JsonValue('obc')
  otherBackwardClasses('obc'),

  /// Person with disability.
  @JsonValue('pwd')
  personWithDisability('pwd');

  /// Creates a category with its wire value.
  const SocialCategory(this.code);

  /// The stable wire value.
  final String code;

  /// Reads a category from its wire value.
  static SocialCategory fromCode(String code) => values.firstWhere(
        (value) => value.code == code,
        orElse: () => SocialCategory.general,
      );
}

/// Family income band, ordered from the lowest band upwards.
enum IncomeBand {
  /// Up to one lakh rupees per year.
  @JsonValue('below_1lakh')
  belowOneLakh('below_1lakh'),

  /// Between one and two and a half lakh rupees per year.
  @JsonValue('1lakh_2_5lakh')
  oneToTwoAndHalfLakh('1lakh_2_5lakh'),

  /// Between two and a half and five lakh rupees per year.
  @JsonValue('2_5lakh_5lakh')
  twoAndHalfToFiveLakh('2_5lakh_5lakh'),

  /// Above five lakh rupees per year.
  @JsonValue('above_5lakh')
  aboveFiveLakh('above_5lakh');

  /// Creates a band with its wire value.
  const IncomeBand(this.code);

  /// The stable wire value.
  final String code;

  /// Reads a band from its wire value.
  static IncomeBand fromCode(String code) => values.firstWhere(
        (value) => value.code == code,
        orElse: () => IncomeBand.belowOneLakh,
      );

  /// The ordinal position of this band, used for numeric comparisons.
  int get rank => index;
}

/// Gender, recorded because some schemes are gender specific.
enum Gender {
  /// Female.
  @JsonValue('female')
  female('female'),

  /// Male.
  @JsonValue('male')
  male('male'),

  /// Prefer not to say.
  @JsonValue('other')
  other('other');

  /// Creates a gender with its wire value.
  const Gender(this.code);

  /// The stable wire value.
  final String code;

  /// Reads a gender from its wire value.
  static Gender fromCode(String code) => values.firstWhere(
        (value) => value.code == code,
        orElse: () => Gender.other,
      );
}

/// The kind of opportunity a record describes.
enum OpportunityKind {
  /// A scholarship.
  @JsonValue('scholarship')
  scholarship('scholarship'),

  /// A government scheme or benefit.
  @JsonValue('scheme')
  scheme('scheme'),

  /// An examination or entrance test.
  @JsonValue('exam')
  exam('exam'),

  /// An apprenticeship or internship.
  @JsonValue('apprenticeship')
  apprenticeship('apprenticeship');

  /// Creates a kind with its wire value.
  const OpportunityKind(this.code);

  /// The stable wire value.
  final String code;

  /// Reads a kind from its wire value.
  static OpportunityKind fromCode(String code) => values.firstWhere(
        (value) => value.code == code,
        orElse: () => OpportunityKind.scheme,
      );
}

/// The outcome of checking a student against an opportunity's rules.
enum EligibilityStatus {
  /// Every blocking rule passed.
  @JsonValue('eligible')
  eligible('eligible'),

  /// At least one blocking rule failed.
  @JsonValue('not_eligible')
  notEligible('not_eligible'),

  /// Some rule could not be checked because the profile is missing a field.
  @JsonValue('needs_info')
  needsInfo('needs_info');

  /// Creates a status with its wire value.
  const EligibilityStatus(this.code);

  /// The stable wire value.
  final String code;

  /// Reads a status from its wire value.
  static EligibilityStatus fromCode(String code) => values.firstWhere(
        (value) => value.code == code,
        orElse: () => EligibilityStatus.needsInfo,
      );
}

/// The profile field a rule inspects.
enum EligibilityField {
  /// Education stage.
  @JsonValue('education_stage')
  educationStage('education_stage'),

  /// Current class number.
  @JsonValue('current_class')
  currentClass('current_class'),

  /// Family income band.
  @JsonValue('income_band')
  incomeBand('income_band'),

  /// Social category.
  @JsonValue('social_category')
  socialCategory('social_category'),

  /// Gender.
  @JsonValue('gender')
  gender('gender'),

  /// State code.
  @JsonValue('state')
  state('state'),

  /// District name.
  @JsonValue('district')
  district('district'),

  /// Whether nobody in the family has gone to college.
  @JsonValue('first_generation_learner')
  firstGenerationLearner('first_generation_learner'),

  /// The family situation special schemes ask about: orphan, a lost parent,
  /// a martyr's ward, or a parent with a critical disease or disability.
  @JsonValue('life_situation')
  lifeSituation('life_situation');

  /// Creates a field with its wire value.
  const EligibilityField(this.code);

  /// The stable wire value.
  final String code;

  /// Reads a field from its wire value.
  static EligibilityField fromCode(String code) => values.firstWhere(
        (value) => value.code == code,
        orElse: () => EligibilityField.educationStage,
      );
}

/// The comparison a rule performs.
enum EligibilityOperator {
  /// The profile value must equal one of the rule values.
  @JsonValue('equals')
  equals('equals'),

  /// The profile value must be one of the rule values.
  @JsonValue('one_of')
  oneOf('one_of'),

  /// The numeric profile value must be less than or equal to the rule value.
  @JsonValue('at_most')
  atMost('at_most'),

  /// The numeric profile value must be greater than or equal to the rule value.
  @JsonValue('at_least')
  atLeast('at_least');

  /// Creates an operator with its wire value.
  const EligibilityOperator(this.code);

  /// The stable wire value.
  final String code;

  /// Reads an operator from its wire value.
  static EligibilityOperator fromCode(String code) => values.firstWhere(
        (value) => value.code == code,
        orElse: () => EligibilityOperator.equals,
      );
}

/// The role a signed-in user has.
enum UserRole {
  /// A student using the app on their own or on a shared family phone.
  @JsonValue('student')
  student('student'),

  /// A teacher, NGO worker or ITI instructor who guides a class.
  @JsonValue('facilitator')
  facilitator('facilitator');

  /// Creates a role with its wire value.
  const UserRole(this.code);

  /// The stable wire value.
  final String code;

  /// Reads a role from its wire value.
  static UserRole fromCode(String code) => values.firstWhere(
        (value) => value.code == code,
        orElse: () => UserRole.student,
      );
}

/// How a facilitator sells a module.
enum ModulePricing {
  /// Everybody may read it.
  @JsonValue('free')
  free('free'),

  /// The student pays once per module.
  @JsonValue('pay_per_module')
  payPerModule('pay_per_module'),

  /// The student subscribes to the facilitator.
  @JsonValue('subscription')
  subscription('subscription');

  /// Creates a pricing model with its wire value.
  const ModulePricing(this.code);

  /// The stable wire value.
  final String code;

  /// Reads pricing from its wire value.
  static ModulePricing fromCode(String code) => values.firstWhere(
        (value) => value.code == code,
        orElse: () => ModulePricing.free,
      );
}
