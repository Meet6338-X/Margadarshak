// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'Margadarshak';

  @override
  String get appTagline => 'तुमचा पुढचा पाऊल, तुमच्याच भाषेत';

  @override
  String get commonContinue => 'पुढे';

  @override
  String get commonBack => 'मागे';

  @override
  String get commonNext => 'पुढील';

  @override
  String get commonDone => 'पूर्ण';

  @override
  String get commonSave => 'जतन करा';

  @override
  String get commonCancel => 'रद्द करा';

  @override
  String get commonRetry => 'पुन्हा प्रयत्न करा';

  @override
  String get commonClose => 'बंद करा';

  @override
  String get commonSkip => 'वगळा';

  @override
  String get commonLoading => 'लोड होत आहे…';

  @override
  String get commonYes => 'होय';

  @override
  String get commonNo => 'नाही';

  @override
  String get commonSearch => 'शोधा';

  @override
  String get commonSeeAll => 'सर्व पहा';

  @override
  String get commonViewDetails => 'तपशील पहा';

  @override
  String get commonVerified => 'तपासलेली नोंद';

  @override
  String get commonOfficialSource => 'अधिकृत स्रोत';

  @override
  String get commonLastVerified => 'शेवटची तपासणी';

  @override
  String commonDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिवस शिल्ला',
      one: '1 दिवस शिल्ला',
      zero: 'आज शेवटचा दिवस',
    );
    return '$_temp0';
  }

  @override
  String get commonEmptyTitle => 'इथे अजून काही नाही';

  @override
  String get commonErrorTitle => 'काहीतरी चुकले';

  @override
  String get commonErrorBody =>
      'माहिती लोड होऊ शकली नाही. कनेक्शन तपासा आणि पुन्हा प्रयत्न करा.';

  @override
  String get commonOpenLink => 'अधिकृत पेज उघडा';

  @override
  String get applyNow => 'आता अर्ज करा';

  @override
  String get howToApplyTitle => 'अर्ज कसा भरावा';

  @override
  String get commonOfflineNotice =>
      'तुम्ही ऑफलाइन आहात. तुम्हाला लागणारे सर्व काही याच फोनमध्ये साठवलेले आहे.';

  @override
  String get authWelcomeTitle => 'स्वागत आहे';

  @override
  String get authWelcomeBody =>
      'तुमचे नाव सांगा, आम्ही तुमचा मार्ग तयार करू. आम्ही कधीही तुमचा फोन नंबर विचारत नाही.';

  @override
  String get authYourName => 'तुमचे नाव';

  @override
  String get authYourNameHint => 'पहिले नाव पुरेसे आहे';

  @override
  String get authIAmStudent => 'मी विद्यार्थी/विद्यार्थिनी आहे';

  @override
  String get authIAmFacilitator => 'मी शिक्षक किंवा मार्गदर्शक आहे';

  @override
  String get authStudentBody =>
      'करिअर, शिष्यवृत्ती आणि रोजची अभ्यासाची सवय याइए.';

  @override
  String get authFacilitatorBody =>
      'एक शेअर केलेल्या फोनवर संपूर्ण वर्गाला मार्गदर्शन द्या आणि स्वतःचे मॉड्यूल तयार करा.';

  @override
  String get authContinue => 'पुढे';

  @override
  String get authSignOut => 'बाहेर पडा';

  @override
  String authSignedInAs(String name) {
    return '$name म्हणून साइन इन';
  }

  @override
  String get onbTitle => 'काही प्रश्न';

  @override
  String get onbSubtitle =>
      'तुमच्या उत्तरांवरून ठरते की आम्ही कोणत्या शिष्यवृत्ती व परीक्षांचा तपास करू. तुमच्या संमतीशिवाय काहीही शेअर होत नाही.';

  @override
  String onbStepOf(int current, int total) {
    return 'टप्पा $current / $total';
  }

  @override
  String get onbClassQuestion => 'तुम्ही कोणत्या इयत्तेत आहात?';

  @override
  String get onbInterestsQuestion => 'तुम्हाला कोणत्या कामात रस आहे?';

  @override
  String get onbInterestsHint => 'कमालीचे पाच निवडा. हे नंतर बदलता येईल.';

  @override
  String get onbDistrictQuestion => 'तुम्ही कोणत्या जिल्ह्यात आहात?';

  @override
  String get onbDistrictHint => 'तुमच्या जिल्ह्याचे नाव लिहा';

  @override
  String get onbCategoryQuestion => 'तुमची सामाजिक श्रेणी';

  @override
  String get onbIncomeQuestion => 'तुमच्या कुटुंबाची वार्षिक उत्पन्न';

  @override
  String get onbGenderQuestion => 'तुमचा लिंग';

  @override
  String get onbFirstGenQuestion =>
      'तुमच्या कुटुंबात कोणी पदव्युत्तर झाले आहे का?';

  @override
  String get onbFinish => 'पूर्ण करा आणि माझा मार्ग पहा';

  @override
  String get onbSaveProfile => 'माझी प्रोफाइल जतन करा';

  @override
  String get onbStageSecondary => 'माध्यमिक शाळा (इयत्ता ९-१०)';

  @override
  String get onbStageHigher => 'उच्च माध्यमिक (इयत्ता ११-१२)';

  @override
  String get onbStageGraduation => 'पदव्युत्तर';

  @override
  String get onbSelectAtLeast => 'किमान एक निवडा';

  @override
  String get onbSelectAtMost => 'कमालीचे पाच निवडा';

  @override
  String get navDiscover => 'शोधा';

  @override
  String get navOpportunities => 'शिष्यवृत्ती';

  @override
  String get navLearn => 'शिका';

  @override
  String get navProfile => 'प्रोफाइल';

  @override
  String get discoverTitle => 'तुमचा मार्ग';

  @override
  String get discoverSubtitle =>
      'तुमच्यासारख्यांसाठी विचार करण्याजोग्या करिअर.';

  @override
  String get discoverTopMatches => 'सर्वात जवळचे जुळणी';

  @override
  String get discoverExploreMore => 'अधिक पहा';

  @override
  String get discoverWhyMatched => 'हे का जुळते';

  @override
  String get discoverNoMatches => 'अजून काही क्रमबद्ध करता आले नाही';

  @override
  String get discoverNoMatchesBody => 'काही छंद जोडा, तुमचा मार्ग भरून येईल.';

  @override
  String get discoverTalkTitle => 'बोलून जाणून घ्या';

  @override
  String get discoverTalkBody => 'एक एक करून बोलून उत्तर द्या.';

  @override
  String get discoverTalkStart => 'बोलायला सुरुवात करा';

  @override
  String get discoverTalkStop => 'थांबवा';

  @override
  String get discoverTranscribed => 'आम्ही ऐकले';

  @override
  String get discoverTalkUnavailable =>
      'या डिव्हाइसवर आत्ता बोलून उत्तर देता येत नाही. उत्तरावर टॅप करा.';

  @override
  String get discoverEditProfile => 'माझी उत्तरे बदला';

  @override
  String get discoverEducationPath => 'काय शिकावे';

  @override
  String get discoverEntrySteps => 'पहिले पाऊल';

  @override
  String get discoverRelatedCareers => 'जवळचे मार्ग';

  @override
  String get oppTitle => 'शिष्यवृत्ती व परीक्षा';

  @override
  String get oppSubtitle =>
      'इथली प्रत्येक नोंद अधिकृत स्रोतावर तपासलेली आहे आणि तिचा दुवा दिलेला आहे.';

  @override
  String get oppEligible => 'तुम्ही अर्ज करू शकता';

  @override
  String get oppNotEligible => 'तुमच्यासाठी नाही';

  @override
  String get oppNeedsInfo => 'अजून एक माहिती हवी';

  @override
  String get oppOnlyEligible => 'फक्त मला जे मिळते ते';

  @override
  String get oppAllScopes => 'सर्व';

  @override
  String get oppStateSchemes => 'माझे राज्य';

  @override
  String get oppNationalSchemes => 'राष्ट्रीय';

  @override
  String get deadlineSoonTitle => 'लवकर समाप्त होत आहे';

  @override
  String get oppNoResults => 'सध्या कोणतीही नोंद जुळत नाही';

  @override
  String get oppNoResultsBody =>
      'आम्ही फक्त तेच दाखवतो ज्याची खात्री आहे. प्रोफाइल पूर्ण करून पुन्हा पहा.';

  @override
  String get oppDocumentChecklist => 'जमा करावयाची कागदपत्रे';

  @override
  String get oppNoDocuments => 'या नोंदीसाठी कोणतीही कागदपत्रे नाहीत.';

  @override
  String get oppOpenOfficial => 'अधिकृत संकेतस्थळावर अर्ज करा';

  @override
  String get oppDeadline => 'अर्जाची अंतिम मुदत';

  @override
  String get oppOpeningOn => 'सुरुवात';

  @override
  String get oppClosedOn => 'बंद';

  @override
  String get oppOpenNow => 'आत्ता उघडे';

  @override
  String get oppClosed => 'बंद झाले';

  @override
  String oppLastVerifiedOn(String date) {
    return '$date रोजी तपासले';
  }

  @override
  String get oppKindScholarship => 'शिष्यवृत्ती';

  @override
  String get oppKindScheme => 'योजना';

  @override
  String get oppKindExam => 'परीक्षा';

  @override
  String get oppKindApprenticeship => 'शिक्षुता';

  @override
  String get oppSearchHint => 'नावाने शोधा';

  @override
  String get oppShowNotEligible => 'सर्व दाखवा';

  @override
  String get oppExplainTitle => 'हे का जुळते';

  @override
  String get oppExplainButton => 'समजावून सांगा';

  @override
  String get oppExplainNoMatch => 'तपासलेले जुळणी नाही';

  @override
  String get oppExplainNoMatchBody =>
      'सध्या आमच्या नोंदीत या प्रोफाइलला जुळणी नाही. आम्ही अंदाज लावत नाही.';

  @override
  String get oppExplainNextSteps => 'पुढील पाऊल';

  @override
  String get oppExplainCited => 'वापरलेल्या नोंदी';

  @override
  String get oppExplainOffline => 'फोनमधील जतन केलेल्या नोंदींवरून लिहिले.';

  @override
  String get oppRulesTitle => 'आम्ही कसे तपासले';

  @override
  String get oppRulePassed => 'तुम्ही ही अट पूर्ण करता';

  @override
  String get oppRuleFailed => 'तुम्ही अजून ही अट पूर्ण करत नाही';

  @override
  String get oppRuleMissing => 'हे तुमच्याकडून आम्हाला हवे';

  @override
  String oppCountResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count नोंदी',
      one: '१ नोंद',
      zero: 'नोंदी नाहीत',
    );
    return '$_temp0';
  }

  @override
  String get oppApplied => 'अर्ज केल्याची नोंद';

  @override
  String get oppMarkApplied => 'मी अर्ज केला';

  @override
  String oppAppliedOn(String date) {
    return '$date रोजी अर्ज केला';
  }

  @override
  String get learnTitle => 'शिका';

  @override
  String get learnSubtitle => 'रोज पाच छोटे क्लिप. एवढीच ही सवय.';

  @override
  String get learnTodayTitle => 'आज';

  @override
  String get learnQueueEmpty => 'आजचे क्लिप पूर्ण झाले. उद्या पुन्हा या.';

  @override
  String get learnQueueDone => 'आजच्यासाठी फक्त इतकेच';

  @override
  String get learnStreak => 'स्ट्रीक';

  @override
  String get learnLongest => 'सर्वात मोठी स्ट्रीक';

  @override
  String get learnFreezes => 'शिल्ले फ्रीझ';

  @override
  String get learnPoints => 'गुण';

  @override
  String get learnBadges => 'बॅज';

  @override
  String get learnNoBadges =>
      'तुमचा शिक्षक तुमचा खरा पाऊल पाहतो तेव्हा बॅज मिळतात.';

  @override
  String get learnCompleteClip => 'पूर्ण झाले असे चिन्हांकित करा';

  @override
  String get learnCompleted => 'पूर्ण झाले';

  @override
  String get learnNextClip => 'पुढील क्लिप';

  @override
  String get learnClipOfDay => 'आजचा क्लिप';

  @override
  String get learnCheckinQuestion => 'आजसाठी एक प्रश्न';

  @override
  String get learnCheckinYes => 'होय';

  @override
  String get learnCheckinNo => 'अजून नाही';

  @override
  String get learnCheckinSend => 'पाठवा';

  @override
  String get learnCheckinDone => 'आभार. तुमच्या शिक्षकाला हे दिसेल.';

  @override
  String get learnFreezeUsed => 'एक फ्रीझने तुमची स्ट्रीक जिवंत ठेवली.';

  @override
  String learnDuration(int seconds) {
    return '$seconds से';
  }

  @override
  String get profileTitle => 'प्रोफाइल';

  @override
  String get profileIdentity => 'तुमची माहिती';

  @override
  String get profileStage => 'टप्पा';

  @override
  String get profileClass => 'इयत्ता';

  @override
  String get profileState => 'राज्य';

  @override
  String get profileDistrict => 'जिल्हा';

  @override
  String get profileCategory => 'श्रेणी';

  @override
  String get profileIncome => 'कुटुंबाचे उत्पन्न';

  @override
  String get profileGender => 'लिंग';

  @override
  String get profileFirstGeneration => 'पहिल्या पिढीचा विद्यार्थी';

  @override
  String get profileInterests => 'छंद';

  @override
  String get profileStudentId => 'विद्यार्थी ओळख क्रमांक';

  @override
  String get profileLanguage => 'भाषा';

  @override
  String get profileAbout => 'या अॅपबद्दल';

  @override
  String get profilePrivacyNote =>
      'पात्रता तपासण्ये लागणारेच आम्ही ठेवतो. तुमचा ओळख क्रमांक हा फोन नंबर नाही.';

  @override
  String get profileDataPackVersion => 'नोंदीची आवृत्ती';

  @override
  String get profileEdit => 'बदल';

  @override
  String get profileSaveChanges => 'बदल जतन करा';

  @override
  String get profileNameLabel => 'नाव';

  @override
  String get profileNameHint => 'तुमचे नाव';

  @override
  String get profileFacilitator => 'मार्गदर्शक';

  @override
  String get profileStudent => 'विद्यार्थी';

  @override
  String get facTitle => 'मार्गदर्शक';

  @override
  String get facSubtitle => 'एक शेअर केलेल्या फोनवर वर्गाला मार्गदर्शन द्या.';

  @override
  String get facClassesTitle => 'तुमचे वर्ग';

  @override
  String get facNewClass => 'नवीन वर्ग';

  @override
  String get facClassNameLabel => 'वर्गाचे नाव';

  @override
  String get facClassNameHint => 'उदा. इयत्ता ९-अ';

  @override
  String get facSchoolLabel => 'शाळा किंवा संस्था';

  @override
  String get facClassCreated => 'वर्ग तयार झाला';

  @override
  String get facStudentsTitle => 'विद्यार्थी';

  @override
  String get facAddStudent => 'विद्यार्थी जोडा';

  @override
  String get facStudentNameLabel => 'विद्यार्थ्याचे नाव';

  @override
  String get facStudentClassLabel => 'इयत्ता';

  @override
  String get facStudentAdded => 'विद्यार्थी जोडला';

  @override
  String get facFlagTalent => 'प्रतिभा म्हणून चिन्हांकित करा';

  @override
  String get facRecommend => 'शिफारस करा';

  @override
  String facRecommended(int count) {
    return '$count विद्यार्थ्यांना शिफारस केली';
  }

  @override
  String get facNoStudents => 'या वर्गात अजून कोणताही विद्यार्थी नाही.';

  @override
  String get facModulesTitle => 'तुमची मॉड्यूल';

  @override
  String get facPublishModule => 'मॉड्यूल प्रकाशित करा';

  @override
  String get facModuleTitleLabel => 'मॉड्यूलचा शीर्षक';

  @override
  String get facModuleBodyLabel => 'हे कशाबद्दल आहे?';

  @override
  String get facPricingLabel => 'विद्यार्थी कसे पैसे देतात?';

  @override
  String get facPricingFree => 'विनामूल्य';

  @override
  String get facPricingPayPerModule => 'प्रति मॉड्यूल पैसे';

  @override
  String get facPricingSubscription => 'सदस्यत्व';

  @override
  String get facPriceLabel => 'रुपयांत किंमत';

  @override
  String get facPublish => 'प्रकाशित करा';

  @override
  String get facPublished => 'मॉड्यूल प्रकाशित झाले';

  @override
  String get facNoModules =>
      'तुम्ही अजून कोणतेही मॉड्यूल प्रकाशित केलेले नाही.';

  @override
  String get facVisibilityNote =>
      '१८ वर्षांखालील विद्यार्थी त्यांच्या मार्गदर्शकाची शिफारस पाहू शकतात.';

  @override
  String get facSelectStudent => 'विद्यार्थी निवडा';

  @override
  String get facClassEmpty =>
      'विद्यार्थ्यांना मार्गदर्शन देण्यासाठी वर्ग तयार करा.';

  @override
  String facStudentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count विद्यार्थी',
      one: '१ विद्यार्थी',
      zero: 'कोणताही विद्यार्थी नाही',
    );
    return '$_temp0';
  }

  @override
  String get rule_category_sc_st =>
      'फक्त अनुसूचित जात किंवा अनुसूचित जनजातीतील विद्यार्थ्यांसाठी.';

  @override
  String get rule_category_obc => 'फक्त इतर मागास वर्गातील विद्यार्थ्यांसाठी.';

  @override
  String get rule_category_sc => 'फक्त अनुसूचित जातीतील विद्यार्थ्यांसाठी.';

  @override
  String get rule_income_at_most =>
      'कुटुंबाचे उत्पन्न या योजनेच्या मर्यादेच्या आत असावे.';

  @override
  String get rule_stage_after_class_12 =>
      'इयत्ता १२ उत्तीर्ण झालेल्या विद्यार्थ्यांसाठी खुले.';

  @override
  String get rule_stage_secondary => 'माध्यमिक शाळेतील विद्यार्थ्यांसाठी खुले.';

  @override
  String get rule_stage_school =>
      'शाळा किंवा महाविद्यालयातील विद्यार्थ्यांसाठी खुले.';

  @override
  String get rule_stage_graduation => 'पदव्युत्तर विद्यार्थ्यांसाठी खुले.';

  @override
  String get rule_gender_female => 'मुलीं आणि महिलांसाठी खुले.';

  @override
  String get rule_first_generation =>
      'पहिल्या पिढीच्या विद्यार्थ्यांसाठी खुले.';

  @override
  String get rule_life_situation_special =>
      'त्या विद्यार्थ्यांसाठी ज्यांचे पालक नाहीत, शहीदाची मुले, किंवा ज्यांच्या पालकांना गंभीर आजार किंवा 80 पेक्षा जास्त अपंगत्व आहे.';

  @override
  String get rule_category_pwd =>
      'अपंगत्व प्रमाणपत्र असलेल्या विद्यार्थ्यांसाठी.';

  @override
  String get rule_class_at_least_9 =>
      'तुम्ही इयत्ता ९ किंवा त्याहून वर असणे आवश्यक.';

  @override
  String get rule_class_at_least_8 =>
      'तुम्ही इयत्ता ८ किंवा त्याहून वर असणे आवश्यक.';

  @override
  String get rule_class_range =>
      'अधिकृत स्रोताने दिलेल्या इयत्ता मर्यादेला लागू.';

  @override
  String get rule_state_only => 'ही नोंद फक्त तुमच्या राज्याला लागू आहे.';

  @override
  String get label_education_stage => 'शिक्षण टप्पा';

  @override
  String get label_current_class => 'सध्याची इयत्ता';

  @override
  String get label_income_band => 'कुटुंबाचे उत्पन्न';

  @override
  String get label_social_category => 'सामाजिक श्रेणी';

  @override
  String get label_gender => 'लिंग';

  @override
  String get label_state => 'राज्य';

  @override
  String get label_district => 'जिल्हा';

  @override
  String get label_first_generation_learner => 'पहिल्या पिढीचा विद्यार्थी';

  @override
  String get label_life_situation => 'कुटुंबाची परिस्थिती';

  @override
  String get value_general => 'सर्वसाधारण';

  @override
  String get value_sc => 'अनुसूचित जात';

  @override
  String get value_st => 'अनुसूचित जनजात';

  @override
  String get value_obc => 'इतर मागास वर्ग';

  @override
  String get value_pwd => 'दिव्यांग';

  @override
  String get value_female => 'महिला';

  @override
  String get value_male => 'पुरुष';

  @override
  String get value_other => 'सांगायची नाही';

  @override
  String get value_secondary => 'माध्यमिक शाळा';

  @override
  String get value_higher_secondary => 'उच्च माध्यमिक';

  @override
  String get value_graduation => 'पदव्युत्तर';

  @override
  String get value_income_below_1lakh => '१ लाखापर्यंत';

  @override
  String get value_income_1lakh_2_5lakh => '१ ते २.५ लाख';

  @override
  String get value_income_2_5lakh_5lakh => '२.५ ते ५ लाख';

  @override
  String get value_income_above_5lakh => '५ लाखांपेक्षा जास्त';

  @override
  String get interest_farming => 'शेती';

  @override
  String get interest_health => 'आरोग्य आणि काळजी';

  @override
  String get interest_teaching => 'अध्ययन';

  @override
  String get interest_machines => 'यंत्रे';

  @override
  String get interest_motors => 'अंजने आणि वाहने';

  @override
  String get interest_repair => 'दुरुस्ती';

  @override
  String get interest_driving => 'ड्रायव्हिंग';

  @override
  String get interest_computers => 'संगणक';

  @override
  String get interest_phones => 'फोन';

  @override
  String get interest_solar => 'सौर ऊर्जा';

  @override
  String get interest_cooking => 'स्वयंपाक';

  @override
  String get interest_food => 'अन्न';

  @override
  String get interest_craft => 'हातकाम';

  @override
  String get interest_design => 'डिझाइन';

  @override
  String get interest_drawing => 'रेखांकन';

  @override
  String get interest_fashion => 'फॅशन';

  @override
  String get interest_beauty => 'सौंदर्य आणि काळजी';

  @override
  String get interest_people => 'लोकांची मदत';

  @override
  String get interest_books => 'पुस्तके आणि अभ्यास';

  @override
  String get interest_numbers => 'संख्या आणि हिशेब';

  @override
  String get interest_animals => 'जनावरे';

  @override
  String get category_agriculture => 'शेती';

  @override
  String get category_business => 'व्यवसाय';

  @override
  String get category_digital => 'डिजिटल काम';

  @override
  String get category_education => 'शिक्षण';

  @override
  String get category_green => 'हिरवट आणि ऊर्जा';

  @override
  String get category_health => 'आरोग्य';

  @override
  String get category_trades => 'कौशल्य व्यवसाय';

  @override
  String get adminTitle => 'प्रशासक कन्सोल';

  @override
  String get adminSubtitle =>
      'या डिव्हाइसवर असलेले वापरकर्ते आणि सामग्री संपादित करा.';

  @override
  String get adminManage => 'व्यवस्थापित करा';

  @override
  String get adminControls => 'नियंत्रणे';

  @override
  String get adminStudents => 'विद्यार्थी';

  @override
  String get adminClips => 'शिक्षण क्लिप';

  @override
  String get adminOpportunities => 'संधी';

  @override
  String get adminEdited => 'संपादित';

  @override
  String get adminDataPack => 'डेटा पॅक';

  @override
  String get adminResetAll => 'सर्व संपादने काढा';

  @override
  String get adminResetAllBody =>
      'यामुळे जतन केलेले प्रत्येक संपादन काढले जाईल आणि मूळ डेटा पॅक पुन्हा येईल. विद्यार्थ्यांचे प्रोफाइल आणि प्रगती तशीच राहील.';

  @override
  String get adminResetDone => 'सर्व संपादने काढली.';

  @override
  String get adminSaveDone => 'जतन केले.';

  @override
  String get adminDeletedDone => 'काढले.';

  @override
  String get adminDelete => 'काढा';

  @override
  String get adminDeleteStudentTitle => 'हा विद्यार्थी काढायचा?';

  @override
  String get adminDeleteStudentBody =>
      'या विद्यार्थ्याचे प्रोफाइल आणि संपूर्ण शिक्षण प्रगती या डिव्हाइसवरून काढली जाईल.';

  @override
  String get adminNoStudents => 'या डिव्हाइसवर अजून विद्यार्थी प्रोफाइल नाही.';

  @override
  String get adminNoClips => 'कोणतीही शिक्षण क्लिप उपलब्ध नाही.';

  @override
  String get adminNoOpportunities => 'कोणतीही संधी उपलब्ध नाही.';

  @override
  String get adminDisplayName => 'दाखवायचे नाव';

  @override
  String get adminTitleEn => 'शीर्षक (इंग्रजी)';

  @override
  String get adminTitleHi => 'शीर्षक (हिंदी)';

  @override
  String get adminTitleMr => 'शीर्षक (मराठी)';

  @override
  String get adminSummaryEn => 'सारांश (इंग्रजी)';

  @override
  String get adminSummaryHi => 'सारांश (हिंदी)';

  @override
  String get adminSummaryMr => 'सारांश (मराठी)';

  @override
  String get adminDurationSeconds => 'कालावधी सेकंदात';

  @override
  String get adminVideoUrl => 'व्हिडिओ लिंक (ऐच्छिक)';

  @override
  String get adminSlides => 'स्लाइड्स, प्रत्येक ओळीत एक';

  @override
  String get adminRestoreFromPack => 'डेटा पॅकमधून पुन्हा आणा';

  @override
  String get adminSourceName => 'अधिकृत स्रोताचे नाव';

  @override
  String get adminSourceUrl => 'अधिकृत स्रोत लिंक';

  @override
  String get adminDeadline => 'अर्जाची शेवटची तारीख';

  @override
  String get adminApplyUrl => 'अर्ज लिंक (ऐच्छिक)';

  @override
  String get adminAmountDisclosed => 'रक्कम जाहीर आहे';

  @override
  String get adminMinClass => 'किमान इयत्ता';

  @override
  String get adminMaxClass => 'कमाल इयत्ता';

  @override
  String get adminClearDate => 'तारीख काढा';

  @override
  String get adminSetDate => 'तारीख निवडा';

  @override
  String get adminStudentEditor => 'विद्यार्थी संपादित करा';

  @override
  String get adminClipEditor => 'क्लिप संपादित करा';

  @override
  String get adminOpportunityEditor => 'संधी संपादित करा';

  @override
  String get commonVideoChip => 'व्हिडिओ';

  @override
  String get commonWatchVideo => 'व्हिडिओ पहा';
}
