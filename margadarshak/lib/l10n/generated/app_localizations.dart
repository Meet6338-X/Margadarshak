import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('mr'),
  ];

  /// The name of the application.
  ///
  /// In en, this message translates to:
  /// **'Margadarshak'**
  String get appTitle;

  /// One line description shown on the welcome screen.
  ///
  /// In en, this message translates to:
  /// **'Your next step, in your own language'**
  String get appTagline;

  /// No description provided for @commonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get commonContinue;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// No description provided for @commonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get commonNext;

  /// No description provided for @commonDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get commonDone;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonRetry;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get commonSkip;

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get commonLoading;

  /// No description provided for @commonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get commonNo;

  /// No description provided for @commonSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get commonSearch;

  /// No description provided for @commonSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get commonSeeAll;

  /// No description provided for @commonViewDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get commonViewDetails;

  /// No description provided for @commonVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified record'**
  String get commonVerified;

  /// No description provided for @commonOfficialSource.
  ///
  /// In en, this message translates to:
  /// **'Official source'**
  String get commonOfficialSource;

  /// No description provided for @commonLastVerified.
  ///
  /// In en, this message translates to:
  /// **'Last checked'**
  String get commonLastVerified;

  /// No description provided for @commonDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Last day today} =1{1 day left} other{{count} days left}}'**
  String commonDaysLeft(int count);

  /// No description provided for @commonEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get commonEmptyTitle;

  /// No description provided for @commonErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get commonErrorTitle;

  /// No description provided for @commonErrorBody.
  ///
  /// In en, this message translates to:
  /// **'The information could not be loaded. Check your connection and try again.'**
  String get commonErrorBody;

  /// No description provided for @commonOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Open the official page'**
  String get commonOpenLink;

  /// No description provided for @applyNow.
  ///
  /// In en, this message translates to:
  /// **'Apply now'**
  String get applyNow;

  /// No description provided for @howToApplyTitle.
  ///
  /// In en, this message translates to:
  /// **'How to apply'**
  String get howToApplyTitle;

  /// No description provided for @commonOfflineNotice.
  ///
  /// In en, this message translates to:
  /// **'You are offline. Everything you need is stored on this phone.'**
  String get commonOfflineNotice;

  /// No description provided for @authWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get authWelcomeTitle;

  /// No description provided for @authWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Tell us your name so we can build your path. We never ask for your phone number.'**
  String get authWelcomeBody;

  /// No description provided for @authYourName.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get authYourName;

  /// No description provided for @authYourNameHint.
  ///
  /// In en, this message translates to:
  /// **'First name is enough'**
  String get authYourNameHint;

  /// No description provided for @authIAmStudent.
  ///
  /// In en, this message translates to:
  /// **'I am a student'**
  String get authIAmStudent;

  /// No description provided for @authIAmFacilitator.
  ///
  /// In en, this message translates to:
  /// **'I am a teacher or mentor'**
  String get authIAmFacilitator;

  /// No description provided for @authStudentBody.
  ///
  /// In en, this message translates to:
  /// **'Find careers, schemes and a daily learning routine.'**
  String get authStudentBody;

  /// No description provided for @authFacilitatorBody.
  ///
  /// In en, this message translates to:
  /// **'Guide a whole class on one shared phone and publish your own modules.'**
  String get authFacilitatorBody;

  /// No description provided for @authContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get authContinue;

  /// No description provided for @authSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get authSignOut;

  /// No description provided for @authSignedInAs.
  ///
  /// In en, this message translates to:
  /// **'Signed in as {name}'**
  String authSignedInAs(String name);

  /// No description provided for @onbTitle.
  ///
  /// In en, this message translates to:
  /// **'A few questions'**
  String get onbTitle;

  /// No description provided for @onbSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your answers decide which schemes and exams we check for you. Nothing is shared without you.'**
  String get onbSubtitle;

  /// No description provided for @onbStepOf.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String onbStepOf(int current, int total);

  /// No description provided for @onbClassQuestion.
  ///
  /// In en, this message translates to:
  /// **'Which class are you in?'**
  String get onbClassQuestion;

  /// No description provided for @onbInterestsQuestion.
  ///
  /// In en, this message translates to:
  /// **'What do you like to work with?'**
  String get onbInterestsQuestion;

  /// No description provided for @onbInterestsHint.
  ///
  /// In en, this message translates to:
  /// **'Pick up to five. You can change this later.'**
  String get onbInterestsHint;

  /// No description provided for @onbDistrictQuestion.
  ///
  /// In en, this message translates to:
  /// **'Which district are you in?'**
  String get onbDistrictQuestion;

  /// No description provided for @onbDistrictHint.
  ///
  /// In en, this message translates to:
  /// **'Type the name of your district'**
  String get onbDistrictHint;

  /// No description provided for @onbCategoryQuestion.
  ///
  /// In en, this message translates to:
  /// **'Your social category'**
  String get onbCategoryQuestion;

  /// No description provided for @onbIncomeQuestion.
  ///
  /// In en, this message translates to:
  /// **'Your family\'s yearly income'**
  String get onbIncomeQuestion;

  /// No description provided for @onbGenderQuestion.
  ///
  /// In en, this message translates to:
  /// **'Your gender'**
  String get onbGenderQuestion;

  /// No description provided for @onbFirstGenQuestion.
  ///
  /// In en, this message translates to:
  /// **'Has anyone in your family gone to college?'**
  String get onbFirstGenQuestion;

  /// No description provided for @onbFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish and see my path'**
  String get onbFinish;

  /// No description provided for @onbSaveProfile.
  ///
  /// In en, this message translates to:
  /// **'Save my profile'**
  String get onbSaveProfile;

  /// No description provided for @onbStageSecondary.
  ///
  /// In en, this message translates to:
  /// **'Secondary school (class 9-10)'**
  String get onbStageSecondary;

  /// No description provided for @onbStageHigher.
  ///
  /// In en, this message translates to:
  /// **'Higher secondary (class 11-12)'**
  String get onbStageHigher;

  /// No description provided for @onbStageGraduation.
  ///
  /// In en, this message translates to:
  /// **'Graduation'**
  String get onbStageGraduation;

  /// No description provided for @onbSelectAtLeast.
  ///
  /// In en, this message translates to:
  /// **'Pick at least one'**
  String get onbSelectAtLeast;

  /// No description provided for @onbSelectAtMost.
  ///
  /// In en, this message translates to:
  /// **'Pick at most five'**
  String get onbSelectAtMost;

  /// No description provided for @navDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get navDiscover;

  /// No description provided for @navOpportunities.
  ///
  /// In en, this message translates to:
  /// **'Schemes'**
  String get navOpportunities;

  /// No description provided for @navLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get navLearn;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @discoverTitle.
  ///
  /// In en, this message translates to:
  /// **'Your path'**
  String get discoverTitle;

  /// No description provided for @discoverSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Careers worth considering for someone like you.'**
  String get discoverSubtitle;

  /// No description provided for @discoverTopMatches.
  ///
  /// In en, this message translates to:
  /// **'Closest matches'**
  String get discoverTopMatches;

  /// No description provided for @discoverExploreMore.
  ///
  /// In en, this message translates to:
  /// **'Explore more'**
  String get discoverExploreMore;

  /// No description provided for @discoverWhyMatched.
  ///
  /// In en, this message translates to:
  /// **'Why this matches'**
  String get discoverWhyMatched;

  /// No description provided for @discoverNoMatches.
  ///
  /// In en, this message translates to:
  /// **'We could not rank anything yet'**
  String get discoverNoMatches;

  /// No description provided for @discoverNoMatchesBody.
  ///
  /// In en, this message translates to:
  /// **'Add a few interests and your path will fill in.'**
  String get discoverNoMatchesBody;

  /// No description provided for @discoverTalkTitle.
  ///
  /// In en, this message translates to:
  /// **'Talk it through'**
  String get discoverTalkTitle;

  /// No description provided for @discoverTalkBody.
  ///
  /// In en, this message translates to:
  /// **'Answer out loud, one question at a time.'**
  String get discoverTalkBody;

  /// No description provided for @discoverTalkStart.
  ///
  /// In en, this message translates to:
  /// **'Start speaking'**
  String get discoverTalkStart;

  /// No description provided for @discoverTalkStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get discoverTalkStop;

  /// No description provided for @discoverTranscribed.
  ///
  /// In en, this message translates to:
  /// **'We heard'**
  String get discoverTranscribed;

  /// No description provided for @discoverTalkUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Voice input is not available on this device right now. Tap your answer instead.'**
  String get discoverTalkUnavailable;

  /// No description provided for @discoverEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit my answers'**
  String get discoverEditProfile;

  /// No description provided for @discoverEducationPath.
  ///
  /// In en, this message translates to:
  /// **'What to study'**
  String get discoverEducationPath;

  /// No description provided for @discoverEntrySteps.
  ///
  /// In en, this message translates to:
  /// **'First steps'**
  String get discoverEntrySteps;

  /// No description provided for @discoverRelatedCareers.
  ///
  /// In en, this message translates to:
  /// **'Nearby paths'**
  String get discoverRelatedCareers;

  /// No description provided for @oppTitle.
  ///
  /// In en, this message translates to:
  /// **'Schemes and exams'**
  String get oppTitle;

  /// No description provided for @oppSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Every record here is checked against an official source and carries a link to it.'**
  String get oppSubtitle;

  /// No description provided for @oppEligible.
  ///
  /// In en, this message translates to:
  /// **'You can apply'**
  String get oppEligible;

  /// No description provided for @oppNotEligible.
  ///
  /// In en, this message translates to:
  /// **'Not for you'**
  String get oppNotEligible;

  /// No description provided for @oppNeedsInfo.
  ///
  /// In en, this message translates to:
  /// **'Needs one more detail'**
  String get oppNeedsInfo;

  /// No description provided for @oppOnlyEligible.
  ///
  /// In en, this message translates to:
  /// **'Only what I qualify for'**
  String get oppOnlyEligible;

  /// No description provided for @oppAllScopes.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get oppAllScopes;

  /// No description provided for @oppStateSchemes.
  ///
  /// In en, this message translates to:
  /// **'My state'**
  String get oppStateSchemes;

  /// No description provided for @oppNationalSchemes.
  ///
  /// In en, this message translates to:
  /// **'National'**
  String get oppNationalSchemes;

  /// No description provided for @oppNoResults.
  ///
  /// In en, this message translates to:
  /// **'No record matches right now'**
  String get oppNoResults;

  /// No description provided for @oppNoResultsBody.
  ///
  /// In en, this message translates to:
  /// **'We only show what we can verify. Try again after your profile is complete.'**
  String get oppNoResultsBody;

  /// No description provided for @oppDocumentChecklist.
  ///
  /// In en, this message translates to:
  /// **'Documents to collect'**
  String get oppDocumentChecklist;

  /// No description provided for @oppNoDocuments.
  ///
  /// In en, this message translates to:
  /// **'No documents listed for this record.'**
  String get oppNoDocuments;

  /// No description provided for @oppOpenOfficial.
  ///
  /// In en, this message translates to:
  /// **'Apply on the official site'**
  String get oppOpenOfficial;

  /// No description provided for @oppDeadline.
  ///
  /// In en, this message translates to:
  /// **'Last date to apply'**
  String get oppDeadline;

  /// No description provided for @oppOpeningOn.
  ///
  /// In en, this message translates to:
  /// **'Opens on'**
  String get oppOpeningOn;

  /// No description provided for @oppClosedOn.
  ///
  /// In en, this message translates to:
  /// **'Closed on'**
  String get oppClosedOn;

  /// No description provided for @oppOpenNow.
  ///
  /// In en, this message translates to:
  /// **'Open now'**
  String get oppOpenNow;

  /// No description provided for @oppClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get oppClosed;

  /// No description provided for @oppLastVerifiedOn.
  ///
  /// In en, this message translates to:
  /// **'Checked on {date}'**
  String oppLastVerifiedOn(String date);

  /// No description provided for @oppKindScholarship.
  ///
  /// In en, this message translates to:
  /// **'Scholarship'**
  String get oppKindScholarship;

  /// No description provided for @oppKindScheme.
  ///
  /// In en, this message translates to:
  /// **'Scheme'**
  String get oppKindScheme;

  /// No description provided for @oppKindExam.
  ///
  /// In en, this message translates to:
  /// **'Exam'**
  String get oppKindExam;

  /// No description provided for @oppKindApprenticeship.
  ///
  /// In en, this message translates to:
  /// **'Apprenticeship'**
  String get oppKindApprenticeship;

  /// No description provided for @oppSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name'**
  String get oppSearchHint;

  /// No description provided for @oppShowNotEligible.
  ///
  /// In en, this message translates to:
  /// **'Show everything'**
  String get oppShowNotEligible;

  /// No description provided for @oppExplainTitle.
  ///
  /// In en, this message translates to:
  /// **'Why this is a match'**
  String get oppExplainTitle;

  /// No description provided for @oppExplainButton.
  ///
  /// In en, this message translates to:
  /// **'Explain this'**
  String get oppExplainButton;

  /// No description provided for @oppExplainNoMatch.
  ///
  /// In en, this message translates to:
  /// **'No verified match'**
  String get oppExplainNoMatch;

  /// No description provided for @oppExplainNoMatchBody.
  ///
  /// In en, this message translates to:
  /// **'Nothing in our records matches this profile yet. We will not guess.'**
  String get oppExplainNoMatchBody;

  /// No description provided for @oppExplainNextSteps.
  ///
  /// In en, this message translates to:
  /// **'Next steps'**
  String get oppExplainNextSteps;

  /// No description provided for @oppExplainCited.
  ///
  /// In en, this message translates to:
  /// **'Records used'**
  String get oppExplainCited;

  /// No description provided for @oppExplainOffline.
  ///
  /// In en, this message translates to:
  /// **'Written on your phone from the stored records.'**
  String get oppExplainOffline;

  /// No description provided for @oppRulesTitle.
  ///
  /// In en, this message translates to:
  /// **'How we checked'**
  String get oppRulesTitle;

  /// No description provided for @oppRulePassed.
  ///
  /// In en, this message translates to:
  /// **'You meet this'**
  String get oppRulePassed;

  /// No description provided for @oppRuleFailed.
  ///
  /// In en, this message translates to:
  /// **'You do not meet this yet'**
  String get oppRuleFailed;

  /// No description provided for @oppRuleMissing.
  ///
  /// In en, this message translates to:
  /// **'We need this from you'**
  String get oppRuleMissing;

  /// No description provided for @oppCountResults.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No records} =1{1 record} other{{count} records}}'**
  String oppCountResults(int count);

  /// No description provided for @oppApplied.
  ///
  /// In en, this message translates to:
  /// **'Marked as applied'**
  String get oppApplied;

  /// No description provided for @oppMarkApplied.
  ///
  /// In en, this message translates to:
  /// **'I applied'**
  String get oppMarkApplied;

  /// No description provided for @oppAppliedOn.
  ///
  /// In en, this message translates to:
  /// **'Applied on {date}'**
  String oppAppliedOn(String date);

  /// No description provided for @learnTitle.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get learnTitle;

  /// No description provided for @learnSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Five short clips a day. That is the whole routine.'**
  String get learnSubtitle;

  /// No description provided for @learnTodayTitle.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get learnTodayTitle;

  /// No description provided for @learnQueueEmpty.
  ///
  /// In en, this message translates to:
  /// **'You finished today\'s clips. Come back tomorrow.'**
  String get learnQueueEmpty;

  /// No description provided for @learnQueueDone.
  ///
  /// In en, this message translates to:
  /// **'That is all for today'**
  String get learnQueueDone;

  /// No description provided for @learnStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get learnStreak;

  /// No description provided for @learnLongest.
  ///
  /// In en, this message translates to:
  /// **'Best streak'**
  String get learnLongest;

  /// No description provided for @learnFreezes.
  ///
  /// In en, this message translates to:
  /// **'Freezes left'**
  String get learnFreezes;

  /// No description provided for @learnPoints.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get learnPoints;

  /// No description provided for @learnBadges.
  ///
  /// In en, this message translates to:
  /// **'Badges'**
  String get learnBadges;

  /// No description provided for @learnNoBadges.
  ///
  /// In en, this message translates to:
  /// **'Badges appear when a facilitator sees a real step you took.'**
  String get learnNoBadges;

  /// No description provided for @learnCompleteClip.
  ///
  /// In en, this message translates to:
  /// **'Mark as done'**
  String get learnCompleteClip;

  /// No description provided for @learnCompleted.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get learnCompleted;

  /// No description provided for @learnNextClip.
  ///
  /// In en, this message translates to:
  /// **'Next clip'**
  String get learnNextClip;

  /// No description provided for @learnClipOfDay.
  ///
  /// In en, this message translates to:
  /// **'Clip of the day'**
  String get learnClipOfDay;

  /// No description provided for @learnCheckinQuestion.
  ///
  /// In en, this message translates to:
  /// **'One question for today'**
  String get learnCheckinQuestion;

  /// No description provided for @learnCheckinYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get learnCheckinYes;

  /// No description provided for @learnCheckinNo.
  ///
  /// In en, this message translates to:
  /// **'Not yet'**
  String get learnCheckinNo;

  /// No description provided for @learnCheckinSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get learnCheckinSend;

  /// No description provided for @learnCheckinDone.
  ///
  /// In en, this message translates to:
  /// **'Thank you. Your facilitator can see this.'**
  String get learnCheckinDone;

  /// No description provided for @learnFreezeUsed.
  ///
  /// In en, this message translates to:
  /// **'A freeze kept your streak alive.'**
  String get learnFreezeUsed;

  /// No description provided for @learnDuration.
  ///
  /// In en, this message translates to:
  /// **'{seconds}s'**
  String learnDuration(int seconds);

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileIdentity.
  ///
  /// In en, this message translates to:
  /// **'Your details'**
  String get profileIdentity;

  /// No description provided for @profileStage.
  ///
  /// In en, this message translates to:
  /// **'Stage'**
  String get profileStage;

  /// No description provided for @profileClass.
  ///
  /// In en, this message translates to:
  /// **'Class'**
  String get profileClass;

  /// No description provided for @profileState.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get profileState;

  /// No description provided for @profileDistrict.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get profileDistrict;

  /// No description provided for @profileCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get profileCategory;

  /// No description provided for @profileIncome.
  ///
  /// In en, this message translates to:
  /// **'Family income'**
  String get profileIncome;

  /// No description provided for @profileGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get profileGender;

  /// No description provided for @profileFirstGeneration.
  ///
  /// In en, this message translates to:
  /// **'First generation learner'**
  String get profileFirstGeneration;

  /// No description provided for @profileInterests.
  ///
  /// In en, this message translates to:
  /// **'Interests'**
  String get profileInterests;

  /// No description provided for @profileStudentId.
  ///
  /// In en, this message translates to:
  /// **'Student ID'**
  String get profileStudentId;

  /// No description provided for @profileLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profileLanguage;

  /// No description provided for @profileAbout.
  ///
  /// In en, this message translates to:
  /// **'About this app'**
  String get profileAbout;

  /// No description provided for @profilePrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'We keep only what eligibility needs. Your identifier is not your phone number.'**
  String get profilePrivacyNote;

  /// No description provided for @profileDataPackVersion.
  ///
  /// In en, this message translates to:
  /// **'Records version'**
  String get profileDataPackVersion;

  /// No description provided for @profileEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get profileEdit;

  /// No description provided for @profileSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get profileSaveChanges;

  /// No description provided for @profileNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get profileNameLabel;

  /// No description provided for @profileNameHint.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get profileNameHint;

  /// No description provided for @profileFacilitator.
  ///
  /// In en, this message translates to:
  /// **'Facilitator'**
  String get profileFacilitator;

  /// No description provided for @profileStudent.
  ///
  /// In en, this message translates to:
  /// **'Student'**
  String get profileStudent;

  /// No description provided for @facTitle.
  ///
  /// In en, this message translates to:
  /// **'Facilitator'**
  String get facTitle;

  /// No description provided for @facSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Guide a class on one shared phone.'**
  String get facSubtitle;

  /// No description provided for @facClassesTitle.
  ///
  /// In en, this message translates to:
  /// **'Your classes'**
  String get facClassesTitle;

  /// No description provided for @facNewClass.
  ///
  /// In en, this message translates to:
  /// **'New class'**
  String get facNewClass;

  /// No description provided for @facClassNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Class name'**
  String get facClassNameLabel;

  /// No description provided for @facClassNameHint.
  ///
  /// In en, this message translates to:
  /// **'For example, Class 9-A'**
  String get facClassNameHint;

  /// No description provided for @facSchoolLabel.
  ///
  /// In en, this message translates to:
  /// **'School or organisation'**
  String get facSchoolLabel;

  /// No description provided for @facClassCreated.
  ///
  /// In en, this message translates to:
  /// **'Class created'**
  String get facClassCreated;

  /// No description provided for @facStudentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get facStudentsTitle;

  /// No description provided for @facAddStudent.
  ///
  /// In en, this message translates to:
  /// **'Add a student'**
  String get facAddStudent;

  /// No description provided for @facStudentNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Student name'**
  String get facStudentNameLabel;

  /// No description provided for @facStudentClassLabel.
  ///
  /// In en, this message translates to:
  /// **'Class'**
  String get facStudentClassLabel;

  /// No description provided for @facStudentAdded.
  ///
  /// In en, this message translates to:
  /// **'Student added'**
  String get facStudentAdded;

  /// No description provided for @facFlagTalent.
  ///
  /// In en, this message translates to:
  /// **'Flag as talent'**
  String get facFlagTalent;

  /// No description provided for @facRecommend.
  ///
  /// In en, this message translates to:
  /// **'Recommend'**
  String get facRecommend;

  /// No description provided for @facRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended to {count} students'**
  String facRecommended(int count);

  /// No description provided for @facNoStudents.
  ///
  /// In en, this message translates to:
  /// **'No students in this class yet.'**
  String get facNoStudents;

  /// No description provided for @facModulesTitle.
  ///
  /// In en, this message translates to:
  /// **'Your modules'**
  String get facModulesTitle;

  /// No description provided for @facPublishModule.
  ///
  /// In en, this message translates to:
  /// **'Publish a module'**
  String get facPublishModule;

  /// No description provided for @facModuleTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Module title'**
  String get facModuleTitleLabel;

  /// No description provided for @facModuleBodyLabel.
  ///
  /// In en, this message translates to:
  /// **'What is it about?'**
  String get facModuleBodyLabel;

  /// No description provided for @facPricingLabel.
  ///
  /// In en, this message translates to:
  /// **'How do students pay?'**
  String get facPricingLabel;

  /// No description provided for @facPricingFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get facPricingFree;

  /// No description provided for @facPricingPayPerModule.
  ///
  /// In en, this message translates to:
  /// **'Pay per module'**
  String get facPricingPayPerModule;

  /// No description provided for @facPricingSubscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get facPricingSubscription;

  /// No description provided for @facPriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price in rupees'**
  String get facPriceLabel;

  /// No description provided for @facPublish.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get facPublish;

  /// No description provided for @facPublished.
  ///
  /// In en, this message translates to:
  /// **'Module published'**
  String get facPublished;

  /// No description provided for @facNoModules.
  ///
  /// In en, this message translates to:
  /// **'You have not published a module yet.'**
  String get facNoModules;

  /// No description provided for @facVisibilityNote.
  ///
  /// In en, this message translates to:
  /// **'Students under 18 can see their facilitator\'s recommendations.'**
  String get facVisibilityNote;

  /// No description provided for @facSelectStudent.
  ///
  /// In en, this message translates to:
  /// **'Choose a student'**
  String get facSelectStudent;

  /// No description provided for @facClassEmpty.
  ///
  /// In en, this message translates to:
  /// **'Create a class to start guiding students.'**
  String get facClassEmpty;

  /// No description provided for @facStudentCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No students} =1{1 student} other{{count} students}}'**
  String facStudentCount(int count);

  /// No description provided for @rule_category_sc_st.
  ///
  /// In en, this message translates to:
  /// **'Only for Scheduled Caste or Scheduled Tribe students.'**
  String get rule_category_sc_st;

  /// No description provided for @rule_category_obc.
  ///
  /// In en, this message translates to:
  /// **'Only for Other Backward Class students.'**
  String get rule_category_obc;

  /// No description provided for @rule_category_sc.
  ///
  /// In en, this message translates to:
  /// **'Only for Scheduled Caste students.'**
  String get rule_category_sc;

  /// No description provided for @rule_income_at_most.
  ///
  /// In en, this message translates to:
  /// **'Family income must be within the limit for this scheme.'**
  String get rule_income_at_most;

  /// No description provided for @rule_stage_after_class_12.
  ///
  /// In en, this message translates to:
  /// **'Open to students who have passed class 12.'**
  String get rule_stage_after_class_12;

  /// No description provided for @rule_stage_secondary.
  ///
  /// In en, this message translates to:
  /// **'Open to students in secondary school.'**
  String get rule_stage_secondary;

  /// No description provided for @rule_stage_school.
  ///
  /// In en, this message translates to:
  /// **'Open to students in school or college.'**
  String get rule_stage_school;

  /// No description provided for @rule_stage_graduation.
  ///
  /// In en, this message translates to:
  /// **'Open to students in graduation.'**
  String get rule_stage_graduation;

  /// No description provided for @rule_gender_female.
  ///
  /// In en, this message translates to:
  /// **'Open to girls and women.'**
  String get rule_gender_female;

  /// No description provided for @rule_first_generation.
  ///
  /// In en, this message translates to:
  /// **'Open to first generation learners.'**
  String get rule_first_generation;

  /// No description provided for @rule_life_situation_special.
  ///
  /// In en, this message translates to:
  /// **'For students who lost a parent, a martyr\'s child, or whose parent has a critical disease or a disability above 80%.'**
  String get rule_life_situation_special;

  /// No description provided for @rule_category_pwd.
  ///
  /// In en, this message translates to:
  /// **'For students with a disability certificate.'**
  String get rule_category_pwd;

  /// No description provided for @rule_class_at_least_9.
  ///
  /// In en, this message translates to:
  /// **'You need to be in class 9 or above.'**
  String get rule_class_at_least_9;

  /// No description provided for @rule_class_at_least_8.
  ///
  /// In en, this message translates to:
  /// **'You need to be in class 8 or above.'**
  String get rule_class_at_least_8;

  /// No description provided for @rule_class_range.
  ///
  /// In en, this message translates to:
  /// **'Applies to the class range given by the official source.'**
  String get rule_class_range;

  /// No description provided for @rule_state_only.
  ///
  /// In en, this message translates to:
  /// **'This record applies to your state only.'**
  String get rule_state_only;

  /// No description provided for @label_education_stage.
  ///
  /// In en, this message translates to:
  /// **'Education stage'**
  String get label_education_stage;

  /// No description provided for @label_current_class.
  ///
  /// In en, this message translates to:
  /// **'Current class'**
  String get label_current_class;

  /// No description provided for @label_income_band.
  ///
  /// In en, this message translates to:
  /// **'Family income'**
  String get label_income_band;

  /// No description provided for @label_social_category.
  ///
  /// In en, this message translates to:
  /// **'Social category'**
  String get label_social_category;

  /// No description provided for @label_gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get label_gender;

  /// No description provided for @label_state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get label_state;

  /// No description provided for @label_district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get label_district;

  /// No description provided for @label_first_generation_learner.
  ///
  /// In en, this message translates to:
  /// **'First generation learner'**
  String get label_first_generation_learner;

  /// No description provided for @label_life_situation.
  ///
  /// In en, this message translates to:
  /// **'Family situation'**
  String get label_life_situation;

  /// No description provided for @value_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get value_general;

  /// No description provided for @value_sc.
  ///
  /// In en, this message translates to:
  /// **'Scheduled Caste'**
  String get value_sc;

  /// No description provided for @value_st.
  ///
  /// In en, this message translates to:
  /// **'Scheduled Tribe'**
  String get value_st;

  /// No description provided for @value_obc.
  ///
  /// In en, this message translates to:
  /// **'Other Backward Class'**
  String get value_obc;

  /// No description provided for @value_pwd.
  ///
  /// In en, this message translates to:
  /// **'Person with disability'**
  String get value_pwd;

  /// No description provided for @value_female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get value_female;

  /// No description provided for @value_male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get value_male;

  /// No description provided for @value_other.
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get value_other;

  /// No description provided for @value_secondary.
  ///
  /// In en, this message translates to:
  /// **'Secondary school'**
  String get value_secondary;

  /// No description provided for @value_higher_secondary.
  ///
  /// In en, this message translates to:
  /// **'Higher secondary'**
  String get value_higher_secondary;

  /// No description provided for @value_graduation.
  ///
  /// In en, this message translates to:
  /// **'Graduation'**
  String get value_graduation;

  /// No description provided for @value_income_below_1lakh.
  ///
  /// In en, this message translates to:
  /// **'Up to 1 lakh'**
  String get value_income_below_1lakh;

  /// No description provided for @value_income_1lakh_2_5lakh.
  ///
  /// In en, this message translates to:
  /// **'1 to 2.5 lakh'**
  String get value_income_1lakh_2_5lakh;

  /// No description provided for @value_income_2_5lakh_5lakh.
  ///
  /// In en, this message translates to:
  /// **'2.5 to 5 lakh'**
  String get value_income_2_5lakh_5lakh;

  /// No description provided for @value_income_above_5lakh.
  ///
  /// In en, this message translates to:
  /// **'Above 5 lakh'**
  String get value_income_above_5lakh;

  /// No description provided for @interest_farming.
  ///
  /// In en, this message translates to:
  /// **'Farming'**
  String get interest_farming;

  /// No description provided for @interest_health.
  ///
  /// In en, this message translates to:
  /// **'Health and care'**
  String get interest_health;

  /// No description provided for @interest_teaching.
  ///
  /// In en, this message translates to:
  /// **'Teaching'**
  String get interest_teaching;

  /// No description provided for @interest_machines.
  ///
  /// In en, this message translates to:
  /// **'Machines'**
  String get interest_machines;

  /// No description provided for @interest_motors.
  ///
  /// In en, this message translates to:
  /// **'Motors'**
  String get interest_motors;

  /// No description provided for @interest_repair.
  ///
  /// In en, this message translates to:
  /// **'Repairing'**
  String get interest_repair;

  /// No description provided for @interest_driving.
  ///
  /// In en, this message translates to:
  /// **'Driving'**
  String get interest_driving;

  /// No description provided for @interest_computers.
  ///
  /// In en, this message translates to:
  /// **'Computers'**
  String get interest_computers;

  /// No description provided for @interest_phones.
  ///
  /// In en, this message translates to:
  /// **'Phones'**
  String get interest_phones;

  /// No description provided for @interest_solar.
  ///
  /// In en, this message translates to:
  /// **'Solar and energy'**
  String get interest_solar;

  /// No description provided for @interest_cooking.
  ///
  /// In en, this message translates to:
  /// **'Cooking'**
  String get interest_cooking;

  /// No description provided for @interest_food.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get interest_food;

  /// No description provided for @interest_craft.
  ///
  /// In en, this message translates to:
  /// **'Craft and hands'**
  String get interest_craft;

  /// No description provided for @interest_design.
  ///
  /// In en, this message translates to:
  /// **'Design'**
  String get interest_design;

  /// No description provided for @interest_drawing.
  ///
  /// In en, this message translates to:
  /// **'Drawing'**
  String get interest_drawing;

  /// No description provided for @interest_fashion.
  ///
  /// In en, this message translates to:
  /// **'Fashion'**
  String get interest_fashion;

  /// No description provided for @interest_beauty.
  ///
  /// In en, this message translates to:
  /// **'Beauty and grooming'**
  String get interest_beauty;

  /// No description provided for @interest_people.
  ///
  /// In en, this message translates to:
  /// **'Helping people'**
  String get interest_people;

  /// No description provided for @interest_books.
  ///
  /// In en, this message translates to:
  /// **'Books and study'**
  String get interest_books;

  /// No description provided for @interest_numbers.
  ///
  /// In en, this message translates to:
  /// **'Numbers and accounts'**
  String get interest_numbers;

  /// No description provided for @interest_animals.
  ///
  /// In en, this message translates to:
  /// **'Animals'**
  String get interest_animals;

  /// No description provided for @category_agriculture.
  ///
  /// In en, this message translates to:
  /// **'Agriculture'**
  String get category_agriculture;

  /// No description provided for @category_business.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get category_business;

  /// No description provided for @category_digital.
  ///
  /// In en, this message translates to:
  /// **'Digital work'**
  String get category_digital;

  /// No description provided for @category_education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get category_education;

  /// No description provided for @category_green.
  ///
  /// In en, this message translates to:
  /// **'Green and energy'**
  String get category_green;

  /// No description provided for @category_health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get category_health;

  /// No description provided for @category_trades.
  ///
  /// In en, this message translates to:
  /// **'Skilled trades'**
  String get category_trades;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi', 'mr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'mr':
      return AppLocalizationsMr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
