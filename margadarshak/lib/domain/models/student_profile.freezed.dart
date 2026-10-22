// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudentProfile {

/// A stable, non-identifying identifier. Never a phone number.
 String get studentId;/// The name shown in the app.
 String get displayName;/// How far along the student is in their education.
 EducationStage get stage;/// The current class number (9, 10, 11, 12 or the graduation year).
 int get currentClass;/// The state the student lives in, as a lower-case code such as `mh`.
 String get state;/// The district the student lives in.
 String get district;/// The social category used by most schemes.
 SocialCategory get category;/// The family income band.
 IncomeBand get incomeBand;/// Gender, recorded because some schemes are gender specific.
 Gender get gender;/// Whether nobody in the family has gone to college.
 bool get firstGenerationLearner;/// Free-form interest tags used to match careers.
 Set<String> get interests;/// When the profile was created.
 DateTime get createdAt;
/// Create a copy of StudentProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentProfileCopyWith<StudentProfile> get copyWith => _$StudentProfileCopyWithImpl<StudentProfile>(this as StudentProfile, _$identity);

  /// Serializes this StudentProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentProfile&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.currentClass, currentClass) || other.currentClass == currentClass)&&(identical(other.state, state) || other.state == state)&&(identical(other.district, district) || other.district == district)&&(identical(other.category, category) || other.category == category)&&(identical(other.incomeBand, incomeBand) || other.incomeBand == incomeBand)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.firstGenerationLearner, firstGenerationLearner) || other.firstGenerationLearner == firstGenerationLearner)&&const DeepCollectionEquality().equals(other.interests, interests)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,studentId,displayName,stage,currentClass,state,district,category,incomeBand,gender,firstGenerationLearner,const DeepCollectionEquality().hash(interests),createdAt);

@override
String toString() {
  return 'StudentProfile(studentId: $studentId, displayName: $displayName, stage: $stage, currentClass: $currentClass, state: $state, district: $district, category: $category, incomeBand: $incomeBand, gender: $gender, firstGenerationLearner: $firstGenerationLearner, interests: $interests, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $StudentProfileCopyWith<$Res>  {
  factory $StudentProfileCopyWith(StudentProfile value, $Res Function(StudentProfile) _then) = _$StudentProfileCopyWithImpl;
@useResult
$Res call({
 String studentId, String displayName, EducationStage stage, int currentClass, String state, String district, SocialCategory category, IncomeBand incomeBand, Gender gender, bool firstGenerationLearner, Set<String> interests, DateTime createdAt
});




}
/// @nodoc
class _$StudentProfileCopyWithImpl<$Res>
    implements $StudentProfileCopyWith<$Res> {
  _$StudentProfileCopyWithImpl(this._self, this._then);

  final StudentProfile _self;
  final $Res Function(StudentProfile) _then;

/// Create a copy of StudentProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? studentId = null,Object? displayName = null,Object? stage = null,Object? currentClass = null,Object? state = null,Object? district = null,Object? category = null,Object? incomeBand = null,Object? gender = null,Object? firstGenerationLearner = null,Object? interests = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as EducationStage,currentClass: null == currentClass ? _self.currentClass : currentClass // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as SocialCategory,incomeBand: null == incomeBand ? _self.incomeBand : incomeBand // ignore: cast_nullable_to_non_nullable
as IncomeBand,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,firstGenerationLearner: null == firstGenerationLearner ? _self.firstGenerationLearner : firstGenerationLearner // ignore: cast_nullable_to_non_nullable
as bool,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as Set<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentProfile].
extension StudentProfilePatterns on StudentProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentProfile value)  $default,){
final _that = this;
switch (_that) {
case _StudentProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentProfile value)?  $default,){
final _that = this;
switch (_that) {
case _StudentProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String studentId,  String displayName,  EducationStage stage,  int currentClass,  String state,  String district,  SocialCategory category,  IncomeBand incomeBand,  Gender gender,  bool firstGenerationLearner,  Set<String> interests,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentProfile() when $default != null:
return $default(_that.studentId,_that.displayName,_that.stage,_that.currentClass,_that.state,_that.district,_that.category,_that.incomeBand,_that.gender,_that.firstGenerationLearner,_that.interests,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String studentId,  String displayName,  EducationStage stage,  int currentClass,  String state,  String district,  SocialCategory category,  IncomeBand incomeBand,  Gender gender,  bool firstGenerationLearner,  Set<String> interests,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _StudentProfile():
return $default(_that.studentId,_that.displayName,_that.stage,_that.currentClass,_that.state,_that.district,_that.category,_that.incomeBand,_that.gender,_that.firstGenerationLearner,_that.interests,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String studentId,  String displayName,  EducationStage stage,  int currentClass,  String state,  String district,  SocialCategory category,  IncomeBand incomeBand,  Gender gender,  bool firstGenerationLearner,  Set<String> interests,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StudentProfile() when $default != null:
return $default(_that.studentId,_that.displayName,_that.stage,_that.currentClass,_that.state,_that.district,_that.category,_that.incomeBand,_that.gender,_that.firstGenerationLearner,_that.interests,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentProfile implements StudentProfile {
  const _StudentProfile({required this.studentId, required this.displayName, required this.stage, required this.currentClass, required this.state, required this.district, required this.category, required this.incomeBand, required this.gender, required this.firstGenerationLearner, final  Set<String> interests = const <String>{}, required this.createdAt}): _interests = interests;
  factory _StudentProfile.fromJson(Map<String, dynamic> json) => _$StudentProfileFromJson(json);

/// A stable, non-identifying identifier. Never a phone number.
@override final  String studentId;
/// The name shown in the app.
@override final  String displayName;
/// How far along the student is in their education.
@override final  EducationStage stage;
/// The current class number (9, 10, 11, 12 or the graduation year).
@override final  int currentClass;
/// The state the student lives in, as a lower-case code such as `mh`.
@override final  String state;
/// The district the student lives in.
@override final  String district;
/// The social category used by most schemes.
@override final  SocialCategory category;
/// The family income band.
@override final  IncomeBand incomeBand;
/// Gender, recorded because some schemes are gender specific.
@override final  Gender gender;
/// Whether nobody in the family has gone to college.
@override final  bool firstGenerationLearner;
/// Free-form interest tags used to match careers.
 final  Set<String> _interests;
/// Free-form interest tags used to match careers.
@override@JsonKey() Set<String> get interests {
  if (_interests is EqualUnmodifiableSetView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_interests);
}

/// When the profile was created.
@override final  DateTime createdAt;

/// Create a copy of StudentProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentProfileCopyWith<_StudentProfile> get copyWith => __$StudentProfileCopyWithImpl<_StudentProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentProfile&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.currentClass, currentClass) || other.currentClass == currentClass)&&(identical(other.state, state) || other.state == state)&&(identical(other.district, district) || other.district == district)&&(identical(other.category, category) || other.category == category)&&(identical(other.incomeBand, incomeBand) || other.incomeBand == incomeBand)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.firstGenerationLearner, firstGenerationLearner) || other.firstGenerationLearner == firstGenerationLearner)&&const DeepCollectionEquality().equals(other._interests, _interests)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,studentId,displayName,stage,currentClass,state,district,category,incomeBand,gender,firstGenerationLearner,const DeepCollectionEquality().hash(_interests),createdAt);

@override
String toString() {
  return 'StudentProfile(studentId: $studentId, displayName: $displayName, stage: $stage, currentClass: $currentClass, state: $state, district: $district, category: $category, incomeBand: $incomeBand, gender: $gender, firstGenerationLearner: $firstGenerationLearner, interests: $interests, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StudentProfileCopyWith<$Res> implements $StudentProfileCopyWith<$Res> {
  factory _$StudentProfileCopyWith(_StudentProfile value, $Res Function(_StudentProfile) _then) = __$StudentProfileCopyWithImpl;
@override @useResult
$Res call({
 String studentId, String displayName, EducationStage stage, int currentClass, String state, String district, SocialCategory category, IncomeBand incomeBand, Gender gender, bool firstGenerationLearner, Set<String> interests, DateTime createdAt
});




}
/// @nodoc
class __$StudentProfileCopyWithImpl<$Res>
    implements _$StudentProfileCopyWith<$Res> {
  __$StudentProfileCopyWithImpl(this._self, this._then);

  final _StudentProfile _self;
  final $Res Function(_StudentProfile) _then;

/// Create a copy of StudentProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? studentId = null,Object? displayName = null,Object? stage = null,Object? currentClass = null,Object? state = null,Object? district = null,Object? category = null,Object? incomeBand = null,Object? gender = null,Object? firstGenerationLearner = null,Object? interests = null,Object? createdAt = null,}) {
  return _then(_StudentProfile(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as EducationStage,currentClass: null == currentClass ? _self.currentClass : currentClass // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as SocialCategory,incomeBand: null == incomeBand ? _self.incomeBand : incomeBand // ignore: cast_nullable_to_non_nullable
as IncomeBand,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,firstGenerationLearner: null == firstGenerationLearner ? _self.firstGenerationLearner : firstGenerationLearner // ignore: cast_nullable_to_non_nullable
as bool,interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as Set<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
