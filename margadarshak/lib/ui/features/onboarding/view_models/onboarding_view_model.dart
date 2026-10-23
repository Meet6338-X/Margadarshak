/// The state of the onboarding form.
library;

import 'package:flutter/foundation.dart';

import '../../../../core/failure.dart';
import '../../../../core/result.dart';
import '../../../../domain/models/enums.dart';
import '../../../../domain/models/student_profile.dart';
import '../../../../domain/repositories/repositories.dart';

/// The number of steps in the onboarding form.
const int kOnboardingStepCount = 4;

/// Collects the few facts the rules engine needs, and nothing more.
///
/// Every field here is needed by at least one eligibility rule. The form asks
/// for no phone number, no name of the parent and no address.
class OnboardingViewModel extends ChangeNotifier {
  /// Creates the view model.
  OnboardingViewModel({required StudentRepository studentRepository}) : _studentRepository = studentRepository;

  final StudentRepository _studentRepository;

  int _step = 0;
  EducationStage _stage = EducationStage.secondary;
  int _currentClass = 9;
  final Set<String> _interests = <String>{};
  String _district = '';
  String _state = 'mh';
  SocialCategory _category = SocialCategory.general;
  IncomeBand _incomeBand = IncomeBand.belowOneLakh;
  Gender _gender = Gender.female;
  bool _firstGenerationLearner = false;
  bool _busy = false;
  Failure? _failure;

  /// The step the form is on, starting at zero.
  int get step => _step;

  /// The education stage.
  EducationStage get stage => _stage;

  /// The class the student is in. Thirteen stands for college.
  int get currentClass => _currentClass;

  /// The classes the student can pick for the current stage.
  List<int> get availableClasses => switch (_stage) {
        EducationStage.secondary => const <int>[9, 10],
        EducationStage.higherSecondary => const <int>[11, 12],
        EducationStage.graduation => const <int>[13],
      };

  /// The picked interests.
  Set<String> get interests => Set<String>.unmodifiable(_interests);

  /// The district the student lives in.
  String get district => _district;

  /// The state code of the student.
  String get state => _state;

  /// The social category.
  SocialCategory get category => _category;

  /// The family income band.
  IncomeBand get incomeBand => _incomeBand;

  /// The gender.
  Gender get gender => _gender;

  /// Whether the student is the first in the family to study.
  bool get firstGenerationLearner => _firstGenerationLearner;

  /// Whether the profile is being saved.
  bool get isBusy => _busy;

  /// The last failure, if any.
  Failure? get failure => _failure;

  /// Moves to the next step.
  void next() {
    if (_step < kOnboardingStepCount - 1) {
      _step += 1;
      notifyListeners();
    }
  }

  /// Moves to the previous step.
  void back() {
    if (_step > 0) {
      _step -= 1;
      notifyListeners();
    }
  }

  /// Picks the education stage and the matching class.
  void setStage(EducationStage stage) {
    _stage = stage;
    _currentClass = switch (stage) {
      EducationStage.secondary => 9,
      EducationStage.higherSecondary => 11,
      EducationStage.graduation => 13,
    };
    notifyListeners();
  }

  /// Picks the class.
  void setClass(int value) {
    _currentClass = value;
    notifyListeners();
  }

  /// Adds or removes an interest.
  void toggleInterest(String tag) {
    if (!_interests.remove(tag)) {
      _interests.add(tag);
    }
    notifyListeners();
  }

  /// Stores the district.
  void setDistrict(String value) {
    _district = value;
    notifyListeners();
  }

  /// Stores the state.
  void setState(String code) {
    _state = code;
    notifyListeners();
  }

  /// Stores the social category.
  void setCategory(SocialCategory value) {
    _category = value;
    notifyListeners();
  }

  /// Stores the income band.
  void setIncomeBand(IncomeBand value) {
    _incomeBand = value;
    notifyListeners();
  }

  /// Stores the gender.
  void setGender(Gender value) {
    _gender = value;
    notifyListeners();
  }

  /// Stores the first generation flag.
  void setFirstGenerationLearner(bool value) {
    _firstGenerationLearner = value;
    notifyListeners();
  }

  /// Whether the current step has everything it needs.
  bool get canContinue => switch (_step) {
        0 => true,
        1 => _interests.isNotEmpty,
        2 => _district.trim().isNotEmpty,
        _ => true,
      };

  /// Saves the profile of [studentId].
  Future<bool> save(String studentId) async {
    if (_district.trim().isEmpty) {
      _failure = Failure.validation('The district is required.');
      notifyListeners();
      return false;
    }

    _busy = true;
    _failure = null;
    notifyListeners();

    final profile = StudentProfile(
      studentId: studentId,
      displayName: '',
      stage: _stage,
      currentClass: _currentClass,
      state: _state,
      district: _district.trim(),
      category: _category,
      incomeBand: _incomeBand,
      gender: _gender,
      firstGenerationLearner: _firstGenerationLearner,
      interests: _interests,
      createdAt: DateTime.now(),
    );

    final Result<StudentProfile> result = await _studentRepository.saveProfile(profile);

    _busy = false;
    if (result case FailureResult<StudentProfile>(:final failure)) {
      _failure = failure;
    }
    notifyListeners();
    return result.isSuccess;
  }
}
