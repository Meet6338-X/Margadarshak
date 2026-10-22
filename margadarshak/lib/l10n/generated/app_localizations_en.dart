// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Margadarshak';

  @override
  String get appTagline => 'Your next step, in your own language';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonBack => 'Back';

  @override
  String get commonNext => 'Next';

  @override
  String get commonDone => 'Done';

  @override
  String get commonSave => 'Save';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonRetry => 'Try again';

  @override
  String get commonClose => 'Close';

  @override
  String get commonSkip => 'Skip';

  @override
  String get commonLoading => 'Loading…';

  @override
  String get commonYes => 'Yes';

  @override
  String get commonNo => 'No';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonViewDetails => 'View details';

  @override
  String get commonVerified => 'Verified record';

  @override
  String get commonOfficialSource => 'Official source';

  @override
  String get commonLastVerified => 'Last checked';

  @override
  String commonDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days left',
      one: '1 day left',
      zero: 'Last day today',
    );
    return '$_temp0';
  }

  @override
  String get commonEmptyTitle => 'Nothing here yet';

  @override
  String get commonErrorTitle => 'Something went wrong';

  @override
  String get commonErrorBody =>
      'The information could not be loaded. Check your connection and try again.';

  @override
  String get commonOpenLink => 'Open the official page';

  @override
  String get applyNow => 'Apply now';

  @override
  String get howToApplyTitle => 'How to apply';

  @override
  String get commonOfflineNotice =>
      'You are offline. Everything you need is stored on this phone.';

  @override
  String get authWelcomeTitle => 'Welcome';

  @override
  String get authWelcomeBody =>
      'Tell us your name so we can build your path. We never ask for your phone number.';

  @override
  String get authYourName => 'Your name';

  @override
  String get authYourNameHint => 'First name is enough';

  @override
  String get authIAmStudent => 'I am a student';

  @override
  String get authIAmFacilitator => 'I am a teacher or mentor';

  @override
  String get authStudentBody =>
      'Find careers, schemes and a daily learning routine.';

  @override
  String get authFacilitatorBody =>
      'Guide a whole class on one shared phone and publish your own modules.';

  @override
  String get authContinue => 'Continue';

  @override
  String get authSignOut => 'Sign out';

  @override
  String authSignedInAs(String name) {
    return 'Signed in as $name';
  }

  @override
  String get onbTitle => 'A few questions';

  @override
  String get onbSubtitle =>
      'Your answers decide which schemes and exams we check for you. Nothing is shared without you.';

  @override
  String onbStepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get onbClassQuestion => 'Which class are you in?';

  @override
  String get onbInterestsQuestion => 'What do you like to work with?';

  @override
  String get onbInterestsHint => 'Pick up to five. You can change this later.';

  @override
  String get onbDistrictQuestion => 'Which district are you in?';

  @override
  String get onbDistrictHint => 'Type the name of your district';

  @override
  String get onbCategoryQuestion => 'Your social category';

  @override
  String get onbIncomeQuestion => 'Your family\'s yearly income';

  @override
  String get onbGenderQuestion => 'Your gender';

  @override
  String get onbFirstGenQuestion =>
      'Has anyone in your family gone to college?';

  @override
  String get onbFinish => 'Finish and see my path';

  @override
  String get onbSaveProfile => 'Save my profile';

  @override
  String get onbStageSecondary => 'Secondary school (class 9-10)';

  @override
  String get onbStageHigher => 'Higher secondary (class 11-12)';

  @override
  String get onbStageGraduation => 'Graduation';

  @override
  String get onbSelectAtLeast => 'Pick at least one';

  @override
  String get onbSelectAtMost => 'Pick at most five';

  @override
  String get navDiscover => 'Discover';

  @override
  String get navOpportunities => 'Schemes';

  @override
  String get navLearn => 'Learn';

  @override
  String get navProfile => 'Profile';

  @override
  String get discoverTitle => 'Your path';

  @override
  String get discoverSubtitle =>
      'Careers worth considering for someone like you.';

  @override
  String get discoverTopMatches => 'Closest matches';

  @override
  String get discoverExploreMore => 'Explore more';

  @override
  String get discoverWhyMatched => 'Why this matches';

  @override
  String get discoverNoMatches => 'We could not rank anything yet';

  @override
  String get discoverNoMatchesBody =>
      'Add a few interests and your path will fill in.';

  @override
  String get discoverTalkTitle => 'Talk it through';

  @override
  String get discoverTalkBody => 'Answer out loud, one question at a time.';

  @override
  String get discoverTalkStart => 'Start speaking';

  @override
  String get discoverTalkStop => 'Stop';

  @override
  String get discoverTranscribed => 'We heard';

  @override
  String get discoverTalkUnavailable =>
      'Voice input is not available on this device right now. Tap your answer instead.';

  @override
  String get discoverEditProfile => 'Edit my answers';

  @override
  String get discoverEducationPath => 'What to study';

  @override
  String get discoverEntrySteps => 'First steps';

  @override
  String get discoverRelatedCareers => 'Nearby paths';

  @override
  String get oppTitle => 'Schemes and exams';

  @override
  String get oppSubtitle =>
      'Every record here is checked against an official source and carries a link to it.';

  @override
  String get oppEligible => 'You can apply';

  @override
  String get oppNotEligible => 'Not for you';

  @override
  String get oppNeedsInfo => 'Needs one more detail';

  @override
  String get oppOnlyEligible => 'Only what I qualify for';

  @override
  String get oppAllScopes => 'All';

  @override
  String get oppStateSchemes => 'My state';

  @override
  String get oppNationalSchemes => 'National';

  @override
  String get oppNoResults => 'No record matches right now';

  @override
  String get oppNoResultsBody =>
      'We only show what we can verify. Try again after your profile is complete.';

  @override
  String get oppDocumentChecklist => 'Documents to collect';

  @override
  String get oppNoDocuments => 'No documents listed for this record.';

  @override
  String get oppOpenOfficial => 'Apply on the official site';

  @override
  String get oppDeadline => 'Last date to apply';

  @override
  String get oppOpeningOn => 'Opens on';

  @override
  String get oppClosedOn => 'Closed on';

  @override
  String get oppOpenNow => 'Open now';

  @override
  String get oppClosed => 'Closed';

  @override
  String oppLastVerifiedOn(String date) {
    return 'Checked on $date';
  }

  @override
  String get oppKindScholarship => 'Scholarship';

  @override
  String get oppKindScheme => 'Scheme';

  @override
  String get oppKindExam => 'Exam';

  @override
  String get oppKindApprenticeship => 'Apprenticeship';

  @override
  String get oppSearchHint => 'Search by name';

  @override
  String get oppShowNotEligible => 'Show everything';

  @override
  String get oppExplainTitle => 'Why this is a match';

  @override
  String get oppExplainButton => 'Explain this';

  @override
  String get oppExplainNoMatch => 'No verified match';

  @override
  String get oppExplainNoMatchBody =>
      'Nothing in our records matches this profile yet. We will not guess.';

  @override
  String get oppExplainNextSteps => 'Next steps';

  @override
  String get oppExplainCited => 'Records used';

  @override
  String get oppExplainOffline =>
      'Written on your phone from the stored records.';

  @override
  String get oppRulesTitle => 'How we checked';

  @override
  String get oppRulePassed => 'You meet this';

  @override
  String get oppRuleFailed => 'You do not meet this yet';

  @override
  String get oppRuleMissing => 'We need this from you';

  @override
  String oppCountResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count records',
      one: '1 record',
      zero: 'No records',
    );
    return '$_temp0';
  }

  @override
  String get oppApplied => 'Marked as applied';

  @override
  String get oppMarkApplied => 'I applied';

  @override
  String oppAppliedOn(String date) {
    return 'Applied on $date';
  }

  @override
  String get learnTitle => 'Learn';

  @override
  String get learnSubtitle =>
      'Five short clips a day. That is the whole routine.';

  @override
  String get learnTodayTitle => 'Today';

  @override
  String get learnQueueEmpty =>
      'You finished today\'s clips. Come back tomorrow.';

  @override
  String get learnQueueDone => 'That is all for today';

  @override
  String get learnStreak => 'Streak';

  @override
  String get learnLongest => 'Best streak';

  @override
  String get learnFreezes => 'Freezes left';

  @override
  String get learnPoints => 'Points';

  @override
  String get learnBadges => 'Badges';

  @override
  String get learnNoBadges =>
      'Badges appear when a facilitator sees a real step you took.';

  @override
  String get learnCompleteClip => 'Mark as done';

  @override
  String get learnCompleted => 'Done';

  @override
  String get learnNextClip => 'Next clip';

  @override
  String get learnClipOfDay => 'Clip of the day';

  @override
  String get learnCheckinQuestion => 'One question for today';

  @override
  String get learnCheckinYes => 'Yes';

  @override
  String get learnCheckinNo => 'Not yet';

  @override
  String get learnCheckinSend => 'Send';

  @override
  String get learnCheckinDone => 'Thank you. Your facilitator can see this.';

  @override
  String get learnFreezeUsed => 'A freeze kept your streak alive.';

  @override
  String learnDuration(int seconds) {
    return '${seconds}s';
  }

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileIdentity => 'Your details';

  @override
  String get profileStage => 'Stage';

  @override
  String get profileClass => 'Class';

  @override
  String get profileState => 'State';

  @override
  String get profileDistrict => 'District';

  @override
  String get profileCategory => 'Category';

  @override
  String get profileIncome => 'Family income';

  @override
  String get profileGender => 'Gender';

  @override
  String get profileFirstGeneration => 'First generation learner';

  @override
  String get profileInterests => 'Interests';

  @override
  String get profileStudentId => 'Student ID';

  @override
  String get profileLanguage => 'Language';

  @override
  String get profileAbout => 'About this app';

  @override
  String get profilePrivacyNote =>
      'We keep only what eligibility needs. Your identifier is not your phone number.';

  @override
  String get profileDataPackVersion => 'Records version';

  @override
  String get profileEdit => 'Edit';

  @override
  String get profileSaveChanges => 'Save changes';

  @override
  String get profileNameLabel => 'Name';

  @override
  String get profileNameHint => 'Your name';

  @override
  String get profileFacilitator => 'Facilitator';

  @override
  String get profileStudent => 'Student';

  @override
  String get facTitle => 'Facilitator';

  @override
  String get facSubtitle => 'Guide a class on one shared phone.';

  @override
  String get facClassesTitle => 'Your classes';

  @override
  String get facNewClass => 'New class';

  @override
  String get facClassNameLabel => 'Class name';

  @override
  String get facClassNameHint => 'For example, Class 9-A';

  @override
  String get facSchoolLabel => 'School or organisation';

  @override
  String get facClassCreated => 'Class created';

  @override
  String get facStudentsTitle => 'Students';

  @override
  String get facAddStudent => 'Add a student';

  @override
  String get facStudentNameLabel => 'Student name';

  @override
  String get facStudentClassLabel => 'Class';

  @override
  String get facStudentAdded => 'Student added';

  @override
  String get facFlagTalent => 'Flag as talent';

  @override
  String get facRecommend => 'Recommend';

  @override
  String facRecommended(int count) {
    return 'Recommended to $count students';
  }

  @override
  String get facNoStudents => 'No students in this class yet.';

  @override
  String get facModulesTitle => 'Your modules';

  @override
  String get facPublishModule => 'Publish a module';

  @override
  String get facModuleTitleLabel => 'Module title';

  @override
  String get facModuleBodyLabel => 'What is it about?';

  @override
  String get facPricingLabel => 'How do students pay?';

  @override
  String get facPricingFree => 'Free';

  @override
  String get facPricingPayPerModule => 'Pay per module';

  @override
  String get facPricingSubscription => 'Subscription';

  @override
  String get facPriceLabel => 'Price in rupees';

  @override
  String get facPublish => 'Publish';

  @override
  String get facPublished => 'Module published';

  @override
  String get facNoModules => 'You have not published a module yet.';

  @override
  String get facVisibilityNote =>
      'Students under 18 can see their facilitator\'s recommendations.';

  @override
  String get facSelectStudent => 'Choose a student';

  @override
  String get facClassEmpty => 'Create a class to start guiding students.';

  @override
  String facStudentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count students',
      one: '1 student',
      zero: 'No students',
    );
    return '$_temp0';
  }

  @override
  String get rule_category_sc_st =>
      'Only for Scheduled Caste or Scheduled Tribe students.';

  @override
  String get rule_category_obc => 'Only for Other Backward Class students.';

  @override
  String get rule_category_sc => 'Only for Scheduled Caste students.';

  @override
  String get rule_income_at_most =>
      'Family income must be within the limit for this scheme.';

  @override
  String get rule_stage_after_class_12 =>
      'Open to students who have passed class 12.';

  @override
  String get rule_stage_secondary => 'Open to students in secondary school.';

  @override
  String get rule_stage_school => 'Open to students in school or college.';

  @override
  String get rule_stage_graduation => 'Open to students in graduation.';

  @override
  String get rule_gender_female => 'Open to girls and women.';

  @override
  String get rule_first_generation => 'Open to first generation learners.';

  @override
  String get rule_class_at_least_9 => 'You need to be in class 9 or above.';

  @override
  String get rule_class_at_least_8 => 'You need to be in class 8 or above.';

  @override
  String get rule_class_range =>
      'Applies to the class range given by the official source.';

  @override
  String get rule_state_only => 'This record applies to your state only.';

  @override
  String get label_education_stage => 'Education stage';

  @override
  String get label_current_class => 'Current class';

  @override
  String get label_income_band => 'Family income';

  @override
  String get label_social_category => 'Social category';

  @override
  String get label_gender => 'Gender';

  @override
  String get label_state => 'State';

  @override
  String get label_district => 'District';

  @override
  String get label_first_generation_learner => 'First generation learner';

  @override
  String get value_general => 'General';

  @override
  String get value_sc => 'Scheduled Caste';

  @override
  String get value_st => 'Scheduled Tribe';

  @override
  String get value_obc => 'Other Backward Class';

  @override
  String get value_pwd => 'Person with disability';

  @override
  String get value_female => 'Female';

  @override
  String get value_male => 'Male';

  @override
  String get value_other => 'Prefer not to say';

  @override
  String get value_secondary => 'Secondary school';

  @override
  String get value_higher_secondary => 'Higher secondary';

  @override
  String get value_graduation => 'Graduation';

  @override
  String get value_income_below_1lakh => 'Up to 1 lakh';

  @override
  String get value_income_1lakh_2_5lakh => '1 to 2.5 lakh';

  @override
  String get value_income_2_5lakh_5lakh => '2.5 to 5 lakh';

  @override
  String get value_income_above_5lakh => 'Above 5 lakh';

  @override
  String get interest_farming => 'Farming';

  @override
  String get interest_health => 'Health and care';

  @override
  String get interest_teaching => 'Teaching';

  @override
  String get interest_machines => 'Machines';

  @override
  String get interest_motors => 'Motors';

  @override
  String get interest_repair => 'Repairing';

  @override
  String get interest_driving => 'Driving';

  @override
  String get interest_computers => 'Computers';

  @override
  String get interest_phones => 'Phones';

  @override
  String get interest_solar => 'Solar and energy';

  @override
  String get interest_cooking => 'Cooking';

  @override
  String get interest_food => 'Food';

  @override
  String get interest_craft => 'Craft and hands';

  @override
  String get interest_design => 'Design';

  @override
  String get interest_drawing => 'Drawing';

  @override
  String get interest_fashion => 'Fashion';

  @override
  String get interest_beauty => 'Beauty and grooming';

  @override
  String get interest_people => 'Helping people';

  @override
  String get interest_books => 'Books and study';

  @override
  String get interest_numbers => 'Numbers and accounts';

  @override
  String get interest_animals => 'Animals';

  @override
  String get category_agriculture => 'Agriculture';

  @override
  String get category_business => 'Business';

  @override
  String get category_digital => 'Digital work';

  @override
  String get category_education => 'Education';

  @override
  String get category_green => 'Green and energy';

  @override
  String get category_health => 'Health';

  @override
  String get category_trades => 'Skilled trades';
}
