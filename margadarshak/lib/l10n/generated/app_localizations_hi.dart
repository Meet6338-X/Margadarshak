// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Margadarshak';

  @override
  String get appTagline => 'आपका अगला कदम, आपकी ही भाषा में';

  @override
  String get commonContinue => 'आगे बढ़ें';

  @override
  String get commonBack => 'पीछे';

  @override
  String get commonNext => 'अगला';

  @override
  String get commonDone => 'पूर्ण';

  @override
  String get commonSave => 'सहेजें';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get commonRetry => 'फिर कोशिश करें';

  @override
  String get commonClose => 'बंद करें';

  @override
  String get commonSkip => 'छोड़ें';

  @override
  String get commonLoading => 'लोड हो रहा है…';

  @override
  String get commonYes => 'हाँ';

  @override
  String get commonNo => 'नहीं';

  @override
  String get commonSearch => 'खोजें';

  @override
  String get commonSeeAll => 'सभी देखें';

  @override
  String get commonViewDetails => 'विवरण देखें';

  @override
  String get commonVerified => 'सत्यापित रिकॉर्ड';

  @override
  String get commonOfficialSource => 'आधिकारिक स्रोत';

  @override
  String get commonLastVerified => 'अंतिम जाँच';

  @override
  String commonDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिन बाकी',
      one: '1 दिन बाकी',
      zero: 'आज अंतिम दिन',
    );
    return '$_temp0';
  }

  @override
  String get commonEmptyTitle => 'यहाँ अभी कुछ नहीं है';

  @override
  String get commonErrorTitle => 'कुछ गड़बड़ हुई';

  @override
  String get commonErrorBody =>
      'जानकारी लोड नहीं हो पाई। कनेक्शन जाँचें और फिर कोशिश करें।';

  @override
  String get commonOpenLink => 'आधिकारिक पेज खोलें';

  @override
  String get applyNow => 'अभी आवेदन करें';

  @override
  String get howToApplyTitle => 'आवेदन कैसे करें';

  @override
  String get commonOfflineNotice =>
      'आप ऑफ़लाइन हैं। आपको ज़रूरी सब कुछ इसी फ़ोन में सहेजा है।';

  @override
  String get authWelcomeTitle => 'स्वागत है';

  @override
  String get authWelcomeBody =>
      'अपना नाम बताइए, हम आपका रास्ता बनाएँगे। हम कभी आपका फ़ोन नंबर नहीं माँगते।';

  @override
  String get authYourName => 'आपका नाम';

  @override
  String get authYourNameHint => 'सिर्फ़ पहला नाम काफ़ी है';

  @override
  String get authIAmStudent => 'मैं छात्र/छात्रा हूँ';

  @override
  String get authIAmFacilitator => 'मैं शिक्षक या सलाहकार हूँ';

  @override
  String get authStudentBody =>
      'करियर, छात्रवृत्ति और रोज़ की सीखने की दिनचर्या पाइए।';

  @override
  String get authFacilitatorBody =>
      'एक साझा फ़ोन पर पूरी कक्षा को मार्गदर्शन दें और अपने मॉड्यूल बनाइए।';

  @override
  String get authContinue => 'आगे बढ़ें';

  @override
  String get authSignOut => 'साइन आउट';

  @override
  String authSignedInAs(String name) {
    return '$name के रूप में साइन इन';
  }

  @override
  String get onbTitle => 'कुछ सवाल';

  @override
  String get onbSubtitle =>
      'आपके जवाब तय करते हैं कि हम कौन-सी छात्रवृत्ति और परीक्षाएँ जाँचें। आपकी मंज़ूरी के बिना कुछ भी साझा नहीं होता।';

  @override
  String onbStepOf(int current, int total) {
    return 'चरण $current / $total';
  }

  @override
  String get onbClassQuestion => 'आप किस कक्षा में हैं?';

  @override
  String get onbInterestsQuestion => 'आपको किस काम में रस है?';

  @override
  String get onbInterestsHint => 'अधिकतम पाँच चुनें। इसे बाद में बदल सकते हैं।';

  @override
  String get onbDistrictQuestion => 'आप किस ज़िले में हैं?';

  @override
  String get onbDistrictHint => 'अपने ज़िले का नाम लिखिए';

  @override
  String get onbCategoryQuestion => 'आपकी सामाजिक श्रेणी';

  @override
  String get onbIncomeQuestion => 'आपके परिवार की सालाना आय';

  @override
  String get onbGenderQuestion => 'आपका लिंग';

  @override
  String get onbFirstGenQuestion => 'क्या आपके परिवार में कोई ग्रेजुएट हुआ है?';

  @override
  String get onbFinish => 'पूरा करें और अपना रास्ता देखें';

  @override
  String get onbSaveProfile => 'मेरी प्रोफ़ाइल सहेजें';

  @override
  String get onbStageSecondary => 'माध्यमिक विद्यालय (कक्षा 9-10)';

  @override
  String get onbStageHigher => 'उच्च माध्यमिक (कक्षा 11-12)';

  @override
  String get onbStageGraduation => 'स्नातक';

  @override
  String get onbSelectAtLeast => 'कम से कम एक चुनें';

  @override
  String get onbSelectAtMost => 'अधिकतम पाँच चुनें';

  @override
  String get navDiscover => 'खोजें';

  @override
  String get navOpportunities => 'छात्रवृत्ति';

  @override
  String get navLearn => 'सीखें';

  @override
  String get navProfile => 'प्रोफ़ाइल';

  @override
  String get discoverTitle => 'आपका रास्ता';

  @override
  String get discoverSubtitle =>
      'आपके जैसे किसी के लिए विचार करने योग्य करियर।';

  @override
  String get discoverTopMatches => 'सबसे मिलते-जुलते';

  @override
  String get discoverExploreMore => 'और देखें';

  @override
  String get discoverWhyMatched => 'यह क्यों मेल खाता है';

  @override
  String get discoverNoMatches => 'अभी कुछ भी क्रम में नहीं आया';

  @override
  String get discoverNoMatchesBody =>
      'कुछ रुचियाँ जोड़िए, आपका रास्ता भर जाएगा।';

  @override
  String get discoverTalkTitle => 'बातचीत करके जानें';

  @override
  String get discoverTalkBody => 'एक-एक करके बोलकर जवाब दीजिए।';

  @override
  String get discoverTalkStart => 'बोलना शुरू करें';

  @override
  String get discoverTalkStop => 'रोकें';

  @override
  String get discoverTranscribed => 'हमने सुना';

  @override
  String get discoverTalkUnavailable =>
      'इस डिवाइस पर अभी बोलकर जवाब नहीं दिया जा सकता। जवाब पर टैप कीजिए।';

  @override
  String get discoverEditProfile => 'मेरे जवाब बदलें';

  @override
  String get discoverEducationPath => 'क्या पढ़ना है';

  @override
  String get discoverEntrySteps => 'पहले कदम';

  @override
  String get discoverRelatedCareers => 'आस-पास के रास्ते';

  @override
  String get oppTitle => 'छात्रवृत्ति और परीक्षाएँ';

  @override
  String get oppSubtitle =>
      'यहाँ हर रिकॉर्ड आधिकारिक स्रोत पर जाँचा गया है और उसका लिंक भी दिया गया है।';

  @override
  String get oppEligible => 'आप आवेदन कर सकते हैं';

  @override
  String get oppNotEligible => 'आपके लिए नहीं है';

  @override
  String get oppNeedsInfo => 'एक और जानकारी चाहिए';

  @override
  String get oppOnlyEligible => 'सिर्फ़ जो मुझे मिलता है';

  @override
  String get oppAllScopes => 'सभी';

  @override
  String get oppStateSchemes => 'मेरा राज्य';

  @override
  String get oppNationalSchemes => 'राष्ट्रीय';

  @override
  String get deadlineSoonTitle => 'जल्द समाप्त हो रहे हैं';

  @override
  String get oppNoResults => 'अभी कोई रिकॉर्ड मेल नहीं खाता';

  @override
  String get oppNoResultsBody =>
      'हम केवल वही दिखाते हैं जिसकी पुष्टि हो सके। प्रोफ़ाइल पूरी करने के बाद फिर देखिए।';

  @override
  String get oppDocumentChecklist => 'जुटाने वाले दस्तावेज़';

  @override
  String get oppNoDocuments =>
      'इस रिकॉर्ड के लिए कोई दस्तावेज़ सूचीबद्ध नहीं है।';

  @override
  String get oppOpenOfficial => 'आधिकारिक साइट पर आवेदन करें';

  @override
  String get oppDeadline => 'आवेदन की अंतिम तिथि';

  @override
  String get oppOpeningOn => 'शुरुआत';

  @override
  String get oppClosedOn => 'बंद';

  @override
  String get oppOpenNow => 'अभी खुला है';

  @override
  String get oppClosed => 'बंद हो चुका है';

  @override
  String oppLastVerifiedOn(String date) {
    return '$date को जाँचा गया';
  }

  @override
  String get oppKindScholarship => 'छात्रवृत्ति';

  @override
  String get oppKindScheme => 'योजना';

  @override
  String get oppKindExam => 'परीक्षा';

  @override
  String get oppKindApprenticeship => 'शिक्षुता';

  @override
  String get oppSearchHint => 'नाम से खोजें';

  @override
  String get oppShowNotEligible => 'सब कुछ दिखाएँ';

  @override
  String get oppExplainTitle => 'यह क्यों मेल खाता है';

  @override
  String get oppExplainButton => 'समझाइए';

  @override
  String get oppExplainNoMatch => 'कोई सत्यापित मेल नहीं';

  @override
  String get oppExplainNoMatchBody =>
      'अभी हमारे रिकॉर्ड में इस प्रोफ़ाइल का कोई मेल नहीं है। हम अनुमान नहीं लगाएँगे।';

  @override
  String get oppExplainNextSteps => 'अगले कदम';

  @override
  String get oppExplainCited => 'उपयोग किए गए रिकॉर्ड';

  @override
  String get oppExplainOffline => 'आपके फ़ोन में सहेजे रिकॉर्ड से लिखा गया।';

  @override
  String get oppRulesTitle => 'हमने कैसे जाँचा';

  @override
  String get oppRulePassed => 'आप यह शर्त पूरी करते हैं';

  @override
  String get oppRuleFailed => 'आप अभी यह शर्त पूरी नहीं करते';

  @override
  String get oppRuleMissing => 'यह हमें आपसे चाहिए';

  @override
  String oppCountResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count रिकॉर्ड',
      one: '1 रिकॉर्ड',
      zero: 'कोई रिकॉर्ड नहीं',
    );
    return '$_temp0';
  }

  @override
  String get oppApplied => 'आवेदन किया हुआ दर्ज';

  @override
  String get oppMarkApplied => 'मैंने आवेदन कर दिया';

  @override
  String oppAppliedOn(String date) {
    return '$date को आवेदन किया';
  }

  @override
  String get learnTitle => 'सीखें';

  @override
  String get learnSubtitle => 'रोज़ पाँच छोटे क्लिप। बस इतनी ही दिनचर्या।';

  @override
  String get learnTodayTitle => 'आज';

  @override
  String get learnQueueEmpty => 'आज के क्लिप पूरे हो गए। कल फिर आइए।';

  @override
  String get learnQueueDone => 'आज के लिए बस इतना ही';

  @override
  String get learnStreak => 'स्ट्रीक';

  @override
  String get learnLongest => 'सबसे लंबी स्ट्रीक';

  @override
  String get learnFreezes => 'बचे फ़्रीज़';

  @override
  String get learnPoints => 'अंक';

  @override
  String get learnBadges => 'बैज';

  @override
  String get learnNoBadges =>
      'बैज तब आते हैं जब आपका शिक्षक आपके असली कदम को देखता है।';

  @override
  String get learnCompleteClip => 'पूरा हुआ चिह्नित करें';

  @override
  String get learnCompleted => 'पूरा हुआ';

  @override
  String get learnNextClip => 'अगला क्लिप';

  @override
  String get learnClipOfDay => 'आज का क्लिप';

  @override
  String get learnCheckinQuestion => 'आज के लिए एक सवाल';

  @override
  String get learnCheckinYes => 'हाँ';

  @override
  String get learnCheckinNo => 'अभी नहीं';

  @override
  String get learnCheckinSend => 'भेजें';

  @override
  String get learnCheckinDone => 'धन्यवाद। आपके शिक्षक को यह दिखेगा।';

  @override
  String get learnFreezeUsed => 'एक फ़्रीज़ ने आपकी स्ट्रीक ज़िंदा रखी।';

  @override
  String learnDuration(int seconds) {
    return '$seconds से';
  }

  @override
  String get profileTitle => 'प्रोफ़ाइल';

  @override
  String get profileIdentity => 'आपकी जानकारी';

  @override
  String get profileStage => 'चरण';

  @override
  String get profileClass => 'कक्षा';

  @override
  String get profileState => 'राज्य';

  @override
  String get profileDistrict => 'ज़िला';

  @override
  String get profileCategory => 'श्रेणी';

  @override
  String get profileIncome => 'परिवार की आय';

  @override
  String get profileGender => 'लिंग';

  @override
  String get profileFirstGeneration => 'पहली पीढ़ी का विद्यार्थी';

  @override
  String get profileInterests => 'रुचियाँ';

  @override
  String get profileStudentId => 'छात्र पहचान संख्या';

  @override
  String get profileLanguage => 'भाषा';

  @override
  String get profileAbout => 'इस ऐप के बारे में';

  @override
  String get profilePrivacyNote =>
      'हम वही रखते हैं जो पात्रता की जाँच के लिए चाहिए। आपकी पहचान संख्या आपका फ़ोन नंबर नहीं है।';

  @override
  String get profileDataPackVersion => 'रिकॉर्ड संस्करण';

  @override
  String get profileEdit => 'बदलें';

  @override
  String get profileSaveChanges => 'बदलाव सहेजें';

  @override
  String get profileNameLabel => 'नाम';

  @override
  String get profileNameHint => 'आपका नाम';

  @override
  String get profileFacilitator => 'सलाहकार';

  @override
  String get profileStudent => 'छात्र';

  @override
  String get facTitle => 'सलाहकार';

  @override
  String get facSubtitle => 'एक साझा फ़ोन पर कक्षा को मार्गदर्शन दें।';

  @override
  String get facClassesTitle => 'आपकी कक्षाएँ';

  @override
  String get facNewClass => 'नई कक्षा';

  @override
  String get facClassNameLabel => 'कक्षा का नाम';

  @override
  String get facClassNameHint => 'जैसे, कक्षा 9-अ';

  @override
  String get facSchoolLabel => 'स्कूल या संस्था';

  @override
  String get facClassCreated => 'कक्षा बन गई';

  @override
  String get facStudentsTitle => 'छात्र';

  @override
  String get facAddStudent => 'छात्र जोड़ें';

  @override
  String get facStudentNameLabel => 'छात्र का नाम';

  @override
  String get facStudentClassLabel => 'कक्षा';

  @override
  String get facStudentAdded => 'छात्र जुड़ गया';

  @override
  String get facFlagTalent => 'प्रतिभा के रूप में चिह्नित करें';

  @override
  String get facRecommend => 'सुझाएँ';

  @override
  String facRecommended(int count) {
    return '$count छात्रों को सुझाया गया';
  }

  @override
  String get facNoStudents => 'इस कक्षा में अभी कोई छात्र नहीं है।';

  @override
  String get facModulesTitle => 'आपके मॉड्यूल';

  @override
  String get facPublishModule => 'मॉड्यूल प्रकाशित करें';

  @override
  String get facModuleTitleLabel => 'मॉड्यूल का शीर्षक';

  @override
  String get facModuleBodyLabel => 'यह किस बारे में है?';

  @override
  String get facPricingLabel => 'छात्र कैसे भुगतान करें?';

  @override
  String get facPricingFree => 'निःशुल्क';

  @override
  String get facPricingPayPerModule => 'प्रति मॉड्यूल भुगतान';

  @override
  String get facPricingSubscription => 'सदस्यता';

  @override
  String get facPriceLabel => 'रुपये में मूल्य';

  @override
  String get facPublish => 'प्रकाशित करें';

  @override
  String get facPublished => 'मॉड्यूल प्रकाशित हो गया';

  @override
  String get facNoModules => 'आपने अभी कोई मॉड्यूल प्रकाशित नहीं किया।';

  @override
  String get facVisibilityNote =>
      '18 से कम आयु के छात्र अपने सलाहकार की सिफ़ारिश देख सकते हैं।';

  @override
  String get facSelectStudent => 'छात्र चुनें';

  @override
  String get facClassEmpty => 'छात्रों को मार्गदर्शन देने के लिए कक्षा बनाएँ।';

  @override
  String facStudentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count छात्र',
      one: '1 छात्र',
      zero: 'कोई छात्र नहीं',
    );
    return '$_temp0';
  }

  @override
  String get rule_category_sc_st =>
      'केवल अनुसूचित जाति या अनुसूचित जनजाति के छात्रों के लिए।';

  @override
  String get rule_category_obc => 'केवल अन्य पिछड़ा वर्ग के छात्रों के लिए।';

  @override
  String get rule_category_sc => 'केवल अनुसूचित जाति के छात्रों के लिए।';

  @override
  String get rule_income_at_most =>
      'परिवार की आय इस योजना की सीमा के भीतर होनी चाहिए।';

  @override
  String get rule_stage_after_class_12 =>
      'कक्षा 12 उत्तीर्ण करने वाले छात्रों के लिए खुला है।';

  @override
  String get rule_stage_secondary =>
      'माध्यमिक विद्यालय के छात्रों के लिए खुला है।';

  @override
  String get rule_stage_school =>
      'विद्यालय या महाविद्यालय के छात्रों के लिए खुला है।';

  @override
  String get rule_stage_graduation => 'स्नातक छात्रों के लिए खुला है।';

  @override
  String get rule_gender_female => 'लड़कियों और महिलाओं के लिए खुला है।';

  @override
  String get rule_first_generation =>
      'पहली पीढ़ी के विद्यार्थियों के लिए खुला है।';

  @override
  String get rule_life_situation_special =>
      'उन विद्यार्थियों के लिए जिनका माता-पिता नहीं है, शहीद के बच्चे, या जिनके माता-पिता को गंभीर बीमारी है या 80 प्रतिशत से अधिक दिव्यांगता है।';

  @override
  String get rule_category_pwd =>
      'दिव्यांगता प्रमाण पत्र वाले विद्यार्थियों के लिए।';

  @override
  String get rule_class_at_least_9 => 'आपको कक्षा 9 या उससे ऊपर होना चाहिए।';

  @override
  String get rule_class_at_least_8 => 'आपको कक्षा 8 या उससे ऊपर होना चाहिए।';

  @override
  String get rule_class_range =>
      'आधिकारिक स्रोत के दी गई कक्षा सीमा पर लागू है।';

  @override
  String get rule_state_only => 'यह रिकॉर्ड केवल आपके राज्य पर लागू है।';

  @override
  String get label_education_stage => 'शिक्षा चरण';

  @override
  String get label_current_class => 'वर्तमान कक्षा';

  @override
  String get label_income_band => 'परिवार की आय';

  @override
  String get label_social_category => 'सामाजिक श्रेणी';

  @override
  String get label_gender => 'लिंग';

  @override
  String get label_state => 'राज्य';

  @override
  String get label_district => 'ज़िला';

  @override
  String get label_first_generation_learner => 'पहली पीढ़ी का विद्यार्थी';

  @override
  String get label_life_situation => 'पारिवारिक स्थिति';

  @override
  String get value_general => 'सामान्य';

  @override
  String get value_sc => 'अनुसूचित जाति';

  @override
  String get value_st => 'अनुसूचित जनजाति';

  @override
  String get value_obc => 'अन्य पिछड़ा वर्ग';

  @override
  String get value_pwd => 'दिव्यांग';

  @override
  String get value_female => 'महिला';

  @override
  String get value_male => 'पुरुष';

  @override
  String get value_other => 'बताना पसंद नहीं';

  @override
  String get value_secondary => 'माध्यमिक विद्यालय';

  @override
  String get value_higher_secondary => 'उच्च माध्यमिक';

  @override
  String get value_graduation => 'स्नातक';

  @override
  String get value_income_below_1lakh => '1 लाख तक';

  @override
  String get value_income_1lakh_2_5lakh => '1 से 2.5 लाख';

  @override
  String get value_income_2_5lakh_5lakh => '2.5 से 5 लाख';

  @override
  String get value_income_above_5lakh => '5 लाख से ऊपर';

  @override
  String get interest_farming => 'खेती';

  @override
  String get interest_health => 'स्वास्थ्य और सेवा';

  @override
  String get interest_teaching => 'पढ़ाना';

  @override
  String get interest_machines => 'मशीनें';

  @override
  String get interest_motors => 'इंजन और वाहन';

  @override
  String get interest_repair => 'मरम्मत';

  @override
  String get interest_driving => 'ड्राइविंग';

  @override
  String get interest_computers => 'कंप्यूटर';

  @override
  String get interest_phones => 'फ़ोन';

  @override
  String get interest_solar => 'सौर ऊर्जा';

  @override
  String get interest_cooking => 'खाना बनाना';

  @override
  String get interest_food => 'खाना';

  @override
  String get interest_craft => 'हस्तकला';

  @override
  String get interest_design => 'डिज़ाइन';

  @override
  String get interest_drawing => 'ड्रॉइंग';

  @override
  String get interest_fashion => 'फ़ैशन';

  @override
  String get interest_beauty => 'सौंदर्य और केयर';

  @override
  String get interest_people => 'लोगों की मदद';

  @override
  String get interest_books => 'किताबें और पढ़ाई';

  @override
  String get interest_numbers => 'गणित और हिसाब';

  @override
  String get interest_animals => 'जानवर';

  @override
  String get category_agriculture => 'कृषि';

  @override
  String get category_business => 'व्यवसाय';

  @override
  String get category_digital => 'डिजिटल काम';

  @override
  String get category_education => 'शिक्षा';

  @override
  String get category_green => 'हरित और ऊर्जा';

  @override
  String get category_health => 'स्वास्थ्य';

  @override
  String get category_trades => 'कौशल व्यवसाय';

  @override
  String get adminTitle => 'व्यवस्थापक कंसोल';

  @override
  String get adminSubtitle =>
      'इस डिवाइस पर रखे उपयोगकर्ता और सामग्री संपादित करें।';

  @override
  String get adminManage => 'प्रबंधित करें';

  @override
  String get adminControls => 'नियंत्रण';

  @override
  String get adminStudents => 'छात्र';

  @override
  String get adminClips => 'लर्निंग क्लिप';

  @override
  String get adminOpportunities => 'अवसर';

  @override
  String get adminEdited => 'संपादित';

  @override
  String get adminDataPack => 'डेटा पैक';

  @override
  String get adminResetAll => 'सभी संपादन हटाएँ';

  @override
  String get adminResetAllBody =>
      'इससे हर सहेजा गया संपादन हट जाएगा और मूल डेटा पैक बहाल हो जाएगा। छात्र प्रोफ़ाइल और प्रगति अछूती रहेंगी।';

  @override
  String get adminResetDone => 'सभी संपादन हटा दिए गए।';

  @override
  String get adminSaveDone => 'सहेजा गया।';

  @override
  String get adminDeletedDone => 'हटा दिया गया।';

  @override
  String get adminDelete => 'हटाएँ';

  @override
  String get adminDeleteStudentTitle => 'क्या यह छात्र हटाएँ?';

  @override
  String get adminDeleteStudentBody =>
      'इस छात्र की प्रोफ़ाइल और पूरी लर्निंग प्रगति इस डिवाइस से हटा दी जाएगी।';

  @override
  String get adminNoStudents => 'इस डिवाइस पर अभी कोई छात्र प्रोफ़ाइल नहीं है।';

  @override
  String get adminNoClips => 'कोई लर्निंग क्लिप उपलब्ध नहीं है।';

  @override
  String get adminNoOpportunities => 'कोई अवसर उपलब्ध नहीं है।';

  @override
  String get adminDisplayName => 'प्रदर्शित नाम';

  @override
  String get adminTitleEn => 'शीर्षक (अंग्रेज़ी)';

  @override
  String get adminTitleHi => 'शीर्षक (हिन्दी)';

  @override
  String get adminTitleMr => 'शीर्षक (मराठी)';

  @override
  String get adminSummaryEn => 'सारांश (अंग्रेज़ी)';

  @override
  String get adminSummaryHi => 'सारांश (हिन्दी)';

  @override
  String get adminSummaryMr => 'सारांश (मराठी)';

  @override
  String get adminDurationSeconds => 'अवधि सेकंड में';

  @override
  String get adminVideoUrl => 'वीडियो लिंक (वैकल्पिक)';

  @override
  String get adminSlides => 'स्लाइड, हर पंक्ति में एक';

  @override
  String get adminRestoreFromPack => 'डेटा पैक से बहाल करें';

  @override
  String get adminSourceName => 'आधिकारिक स्रोत का नाम';

  @override
  String get adminSourceUrl => 'आधिकारिक स्रोत लिंक';

  @override
  String get adminDeadline => 'आवेदन की अंतिम तिथि';

  @override
  String get adminApplyUrl => 'आवेदन लिंक (वैकल्पिक)';

  @override
  String get adminAmountDisclosed => 'राशि बताई गई है';

  @override
  String get adminMinClass => 'न्यूनतम कक्षा';

  @override
  String get adminMaxClass => 'अधिकतम कक्षा';

  @override
  String get adminClearDate => 'तिथि हटाएँ';

  @override
  String get adminSetDate => 'तिथि चुनें';

  @override
  String get adminStudentEditor => 'छात्र संपादित करें';

  @override
  String get adminClipEditor => 'क्लिप संपादित करें';

  @override
  String get adminOpportunityEditor => 'अवसर संपादित करें';

  @override
  String get commonVideoChip => 'वीडियो';

  @override
  String get commonWatchVideo => 'वीडियो देखें';
}
