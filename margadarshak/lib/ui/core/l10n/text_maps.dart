/// Maps domain values to the words a student reads.
///
/// The mapping lives in the UI layer on purpose: the domain layer only knows
/// codes, the words belong to the interface.
library;

import 'package:intl/intl.dart';

import '../../../domain/models/enums.dart';
import '../../../domain/models/interest_taxonomy.dart';
import '../../../l10n/generated/app_localizations.dart';

/// The words used to explain why a rule passed or failed.
String reasonText(AppLocalizations l10n, String reasonKey) => switch (reasonKey) {
      'rule_category_sc_st' => l10n.rule_category_sc_st,
      'rule_category_obc' => l10n.rule_category_obc,
      'rule_category_sc' => l10n.rule_category_sc,
      'rule_income_at_most' => l10n.rule_income_at_most,
      'rule_stage_after_class_12' => l10n.rule_stage_after_class_12,
      'rule_stage_secondary' => l10n.rule_stage_secondary,
      'rule_stage_school' => l10n.rule_stage_school,
      'rule_stage_graduation' => l10n.rule_stage_graduation,
      'rule_gender_female' => l10n.rule_gender_female,
      'rule_first_generation' => l10n.rule_first_generation,
      'rule_life_situation_special' => l10n.rule_life_situation_special,
      'rule_category_pwd' => l10n.rule_category_pwd,
      'rule_class_at_least_9' => l10n.rule_class_at_least_9,
      'rule_class_at_least_8' => l10n.rule_class_at_least_8,
      'rule_class_range' => l10n.rule_class_range,
      'rule_state_only' => l10n.rule_state_only,
      _ => reasonKey,
    };

/// The name of the field a rule looks at.
String eligibilityFieldText(AppLocalizations l10n, EligibilityField field) => switch (field) {
      EligibilityField.educationStage => l10n.label_education_stage,
      EligibilityField.currentClass => l10n.label_current_class,
      EligibilityField.incomeBand => l10n.label_income_band,
      EligibilityField.socialCategory => l10n.label_social_category,
      EligibilityField.gender => l10n.label_gender,
      EligibilityField.state => l10n.label_state,
      EligibilityField.district => l10n.label_district,
      EligibilityField.firstGenerationLearner => l10n.label_first_generation_learner,
      EligibilityField.lifeSituation => l10n.label_life_situation,
    };

/// The name of an education stage.
String stageText(AppLocalizations l10n, EducationStage stage) => switch (stage) {
      EducationStage.secondary => l10n.value_secondary,
      EducationStage.higherSecondary => l10n.value_higher_secondary,
      EducationStage.graduation => l10n.value_graduation,
    };

/// The name of a social category.
String socialCategoryText(AppLocalizations l10n, SocialCategory category) => switch (category) {
      SocialCategory.general => l10n.value_general,
      SocialCategory.scheduledCaste => l10n.value_sc,
      SocialCategory.scheduledTribe => l10n.value_st,
      SocialCategory.otherBackwardClasses => l10n.value_obc,
      SocialCategory.personWithDisability => l10n.value_pwd,
    };

/// The name of an income band.
String incomeBandText(AppLocalizations l10n, IncomeBand band) => switch (band) {
      IncomeBand.belowOneLakh => l10n.value_income_below_1lakh,
      IncomeBand.oneToTwoAndHalfLakh => l10n.value_income_1lakh_2_5lakh,
      IncomeBand.twoAndHalfToFiveLakh => l10n.value_income_2_5lakh_5lakh,
      IncomeBand.aboveFiveLakh => l10n.value_income_above_5lakh,
    };

/// The name of a gender.
String genderText(AppLocalizations l10n, Gender gender) => switch (gender) {
      Gender.female => l10n.value_female,
      Gender.male => l10n.value_male,
      Gender.other => l10n.value_other,
    };

/// The name of an interest tag.
String interestText(AppLocalizations l10n, String tag) {
  final key = InterestTaxonomy.labelKeyForTag(tag);
  return switch (key) {
    'interest_farming' => l10n.interest_farming,
    'interest_health' => l10n.interest_health,
    'interest_teaching' => l10n.interest_teaching,
    'interest_machines' => l10n.interest_machines,
    'interest_motors' => l10n.interest_motors,
    'interest_repair' => l10n.interest_repair,
    'interest_driving' => l10n.interest_driving,
    'interest_computers' => l10n.interest_computers,
    'interest_phones' => l10n.interest_phones,
    'interest_solar' => l10n.interest_solar,
    'interest_cooking' => l10n.interest_cooking,
    'interest_food' => l10n.interest_food,
    'interest_craft' => l10n.interest_craft,
    'interest_design' => l10n.interest_design,
    'interest_drawing' => l10n.interest_drawing,
    'interest_fashion' => l10n.interest_fashion,
    'interest_beauty' => l10n.interest_beauty,
    'interest_people' => l10n.interest_people,
    'interest_books' => l10n.interest_books,
    'interest_numbers' => l10n.interest_numbers,
    'interest_animals' => l10n.interest_animals,
    _ => tag,
  };
}

/// The name of a career category.
String careerCategoryText(AppLocalizations l10n, String category) {
  final key = InterestTaxonomy.labelKeyForCategory(category);
  return switch (key) {
    'category_agriculture' => l10n.category_agriculture,
    'category_business' => l10n.category_business,
    'category_digital' => l10n.category_digital,
    'category_education' => l10n.category_education,
    'category_green' => l10n.category_green,
    'category_health' => l10n.category_health,
    'category_trades' => l10n.category_trades,
    _ => category,
  };
}

/// The name of an opportunity kind.
String opportunityKindText(AppLocalizations l10n, OpportunityKind kind) => switch (kind) {
      OpportunityKind.scholarship => l10n.oppKindScholarship,
      OpportunityKind.scheme => l10n.oppKindScheme,
      OpportunityKind.exam => l10n.oppKindExam,
      OpportunityKind.apprenticeship => l10n.oppKindApprenticeship,
    };

/// The name of an eligibility outcome.
String eligibilityStatusText(AppLocalizations l10n, EligibilityStatus status) => switch (status) {
      EligibilityStatus.eligible => l10n.oppEligible,
      EligibilityStatus.notEligible => l10n.oppNotEligible,
      EligibilityStatus.needsInfo => l10n.oppNeedsInfo,
    };

/// The name of the role a user signed in with.
String roleText(AppLocalizations l10n, UserRole role) => switch (role) {
      UserRole.student => l10n.profileStudent,
      UserRole.facilitator => l10n.profileFacilitator,
    };

/// The name of a pricing model for a published module.
String modulePricingText(AppLocalizations l10n, ModulePricing pricing) => switch (pricing) {
      ModulePricing.free => l10n.facPricingFree,
      ModulePricing.payPerModule => l10n.facPricingPayPerModule,
      ModulePricing.subscription => l10n.facPricingSubscription,
    };

/// Formats a date for the current locale.
String formatDate(DateTime date, String languageCode) {
  final locale = switch (languageCode) {
    'mr' => 'mr_IN',
    'hi' => 'hi_IN',
    _ => 'en_IN',
  };
  return DateFormat.yMMMd(locale).format(date);
}
