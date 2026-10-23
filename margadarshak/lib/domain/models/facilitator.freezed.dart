// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facilitator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FacilitatorClass {

/// The stable identifier.
 String get classId;/// The facilitator who owns this class.
 String get facilitatorId;/// The name of the class, for example `Class 9-A`.
 String get name;/// The school or institution.
 String get schoolName;/// The state code.
 String get state;/// The district.
 String get district;/// The students in the class.
 List<RosterStudent> get students;/// When the class was created.
 DateTime get createdAt;
/// Create a copy of FacilitatorClass
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilitatorClassCopyWith<FacilitatorClass> get copyWith => _$FacilitatorClassCopyWithImpl<FacilitatorClass>(this as FacilitatorClass, _$identity);

  /// Serializes this FacilitatorClass to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilitatorClass&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.facilitatorId, facilitatorId) || other.facilitatorId == facilitatorId)&&(identical(other.name, name) || other.name == name)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&(identical(other.state, state) || other.state == state)&&(identical(other.district, district) || other.district == district)&&const DeepCollectionEquality().equals(other.students, students)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classId,facilitatorId,name,schoolName,state,district,const DeepCollectionEquality().hash(students),createdAt);

@override
String toString() {
  return 'FacilitatorClass(classId: $classId, facilitatorId: $facilitatorId, name: $name, schoolName: $schoolName, state: $state, district: $district, students: $students, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FacilitatorClassCopyWith<$Res>  {
  factory $FacilitatorClassCopyWith(FacilitatorClass value, $Res Function(FacilitatorClass) _then) = _$FacilitatorClassCopyWithImpl;
@useResult
$Res call({
 String classId, String facilitatorId, String name, String schoolName, String state, String district, List<RosterStudent> students, DateTime createdAt
});




}
/// @nodoc
class _$FacilitatorClassCopyWithImpl<$Res>
    implements $FacilitatorClassCopyWith<$Res> {
  _$FacilitatorClassCopyWithImpl(this._self, this._then);

  final FacilitatorClass _self;
  final $Res Function(FacilitatorClass) _then;

/// Create a copy of FacilitatorClass
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? classId = null,Object? facilitatorId = null,Object? name = null,Object? schoolName = null,Object? state = null,Object? district = null,Object? students = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,facilitatorId: null == facilitatorId ? _self.facilitatorId : facilitatorId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,students: null == students ? _self.students : students // ignore: cast_nullable_to_non_nullable
as List<RosterStudent>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilitatorClass].
extension FacilitatorClassPatterns on FacilitatorClass {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilitatorClass value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilitatorClass() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilitatorClass value)  $default,){
final _that = this;
switch (_that) {
case _FacilitatorClass():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilitatorClass value)?  $default,){
final _that = this;
switch (_that) {
case _FacilitatorClass() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String classId,  String facilitatorId,  String name,  String schoolName,  String state,  String district,  List<RosterStudent> students,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilitatorClass() when $default != null:
return $default(_that.classId,_that.facilitatorId,_that.name,_that.schoolName,_that.state,_that.district,_that.students,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String classId,  String facilitatorId,  String name,  String schoolName,  String state,  String district,  List<RosterStudent> students,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FacilitatorClass():
return $default(_that.classId,_that.facilitatorId,_that.name,_that.schoolName,_that.state,_that.district,_that.students,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String classId,  String facilitatorId,  String name,  String schoolName,  String state,  String district,  List<RosterStudent> students,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FacilitatorClass() when $default != null:
return $default(_that.classId,_that.facilitatorId,_that.name,_that.schoolName,_that.state,_that.district,_that.students,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FacilitatorClass implements FacilitatorClass {
  const _FacilitatorClass({required this.classId, required this.facilitatorId, required this.name, required this.schoolName, required this.state, required this.district, final  List<RosterStudent> students = const <RosterStudent>[], required this.createdAt}): _students = students;
  factory _FacilitatorClass.fromJson(Map<String, dynamic> json) => _$FacilitatorClassFromJson(json);

/// The stable identifier.
@override final  String classId;
/// The facilitator who owns this class.
@override final  String facilitatorId;
/// The name of the class, for example `Class 9-A`.
@override final  String name;
/// The school or institution.
@override final  String schoolName;
/// The state code.
@override final  String state;
/// The district.
@override final  String district;
/// The students in the class.
 final  List<RosterStudent> _students;
/// The students in the class.
@override@JsonKey() List<RosterStudent> get students {
  if (_students is EqualUnmodifiableListView) return _students;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_students);
}

/// When the class was created.
@override final  DateTime createdAt;

/// Create a copy of FacilitatorClass
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilitatorClassCopyWith<_FacilitatorClass> get copyWith => __$FacilitatorClassCopyWithImpl<_FacilitatorClass>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FacilitatorClassToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilitatorClass&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.facilitatorId, facilitatorId) || other.facilitatorId == facilitatorId)&&(identical(other.name, name) || other.name == name)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&(identical(other.state, state) || other.state == state)&&(identical(other.district, district) || other.district == district)&&const DeepCollectionEquality().equals(other._students, _students)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classId,facilitatorId,name,schoolName,state,district,const DeepCollectionEquality().hash(_students),createdAt);

@override
String toString() {
  return 'FacilitatorClass(classId: $classId, facilitatorId: $facilitatorId, name: $name, schoolName: $schoolName, state: $state, district: $district, students: $students, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FacilitatorClassCopyWith<$Res> implements $FacilitatorClassCopyWith<$Res> {
  factory _$FacilitatorClassCopyWith(_FacilitatorClass value, $Res Function(_FacilitatorClass) _then) = __$FacilitatorClassCopyWithImpl;
@override @useResult
$Res call({
 String classId, String facilitatorId, String name, String schoolName, String state, String district, List<RosterStudent> students, DateTime createdAt
});




}
/// @nodoc
class __$FacilitatorClassCopyWithImpl<$Res>
    implements _$FacilitatorClassCopyWith<$Res> {
  __$FacilitatorClassCopyWithImpl(this._self, this._then);

  final _FacilitatorClass _self;
  final $Res Function(_FacilitatorClass) _then;

/// Create a copy of FacilitatorClass
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? classId = null,Object? facilitatorId = null,Object? name = null,Object? schoolName = null,Object? state = null,Object? district = null,Object? students = null,Object? createdAt = null,}) {
  return _then(_FacilitatorClass(
classId: null == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String,facilitatorId: null == facilitatorId ? _self.facilitatorId : facilitatorId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,students: null == students ? _self._students : students // ignore: cast_nullable_to_non_nullable
as List<RosterStudent>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$RosterStudent {

/// The student's identifier, the same one used in their own profile.
 String get studentId;/// The student's name.
 String get displayName;/// How far along the student is.
 EducationStage get stage;/// The current class number.
 int get currentClass;/// The social category.
 SocialCategory get category;/// The family income band.
 IncomeBand get incomeBand;/// Gender.
 Gender get gender;/// Whether nobody in the family has gone to college.
 bool get firstGenerationLearner;/// The interests the facilitator tagged.
 List<String> get interestTags;/// Whether the facilitator flagged this student as talented.
 bool get isFlagged;/// Opportunities the facilitator recommended to this student.
 List<String> get recommendedOpportunityIds;/// When the student joined the class.
 DateTime get joinedOn;
/// Create a copy of RosterStudent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RosterStudentCopyWith<RosterStudent> get copyWith => _$RosterStudentCopyWithImpl<RosterStudent>(this as RosterStudent, _$identity);

  /// Serializes this RosterStudent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RosterStudent&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.currentClass, currentClass) || other.currentClass == currentClass)&&(identical(other.category, category) || other.category == category)&&(identical(other.incomeBand, incomeBand) || other.incomeBand == incomeBand)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.firstGenerationLearner, firstGenerationLearner) || other.firstGenerationLearner == firstGenerationLearner)&&const DeepCollectionEquality().equals(other.interestTags, interestTags)&&(identical(other.isFlagged, isFlagged) || other.isFlagged == isFlagged)&&const DeepCollectionEquality().equals(other.recommendedOpportunityIds, recommendedOpportunityIds)&&(identical(other.joinedOn, joinedOn) || other.joinedOn == joinedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,studentId,displayName,stage,currentClass,category,incomeBand,gender,firstGenerationLearner,const DeepCollectionEquality().hash(interestTags),isFlagged,const DeepCollectionEquality().hash(recommendedOpportunityIds),joinedOn);

@override
String toString() {
  return 'RosterStudent(studentId: $studentId, displayName: $displayName, stage: $stage, currentClass: $currentClass, category: $category, incomeBand: $incomeBand, gender: $gender, firstGenerationLearner: $firstGenerationLearner, interestTags: $interestTags, isFlagged: $isFlagged, recommendedOpportunityIds: $recommendedOpportunityIds, joinedOn: $joinedOn)';
}


}

/// @nodoc
abstract mixin class $RosterStudentCopyWith<$Res>  {
  factory $RosterStudentCopyWith(RosterStudent value, $Res Function(RosterStudent) _then) = _$RosterStudentCopyWithImpl;
@useResult
$Res call({
 String studentId, String displayName, EducationStage stage, int currentClass, SocialCategory category, IncomeBand incomeBand, Gender gender, bool firstGenerationLearner, List<String> interestTags, bool isFlagged, List<String> recommendedOpportunityIds, DateTime joinedOn
});




}
/// @nodoc
class _$RosterStudentCopyWithImpl<$Res>
    implements $RosterStudentCopyWith<$Res> {
  _$RosterStudentCopyWithImpl(this._self, this._then);

  final RosterStudent _self;
  final $Res Function(RosterStudent) _then;

/// Create a copy of RosterStudent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? studentId = null,Object? displayName = null,Object? stage = null,Object? currentClass = null,Object? category = null,Object? incomeBand = null,Object? gender = null,Object? firstGenerationLearner = null,Object? interestTags = null,Object? isFlagged = null,Object? recommendedOpportunityIds = null,Object? joinedOn = null,}) {
  return _then(_self.copyWith(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as EducationStage,currentClass: null == currentClass ? _self.currentClass : currentClass // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as SocialCategory,incomeBand: null == incomeBand ? _self.incomeBand : incomeBand // ignore: cast_nullable_to_non_nullable
as IncomeBand,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,firstGenerationLearner: null == firstGenerationLearner ? _self.firstGenerationLearner : firstGenerationLearner // ignore: cast_nullable_to_non_nullable
as bool,interestTags: null == interestTags ? _self.interestTags : interestTags // ignore: cast_nullable_to_non_nullable
as List<String>,isFlagged: null == isFlagged ? _self.isFlagged : isFlagged // ignore: cast_nullable_to_non_nullable
as bool,recommendedOpportunityIds: null == recommendedOpportunityIds ? _self.recommendedOpportunityIds : recommendedOpportunityIds // ignore: cast_nullable_to_non_nullable
as List<String>,joinedOn: null == joinedOn ? _self.joinedOn : joinedOn // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RosterStudent].
extension RosterStudentPatterns on RosterStudent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RosterStudent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RosterStudent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RosterStudent value)  $default,){
final _that = this;
switch (_that) {
case _RosterStudent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RosterStudent value)?  $default,){
final _that = this;
switch (_that) {
case _RosterStudent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String studentId,  String displayName,  EducationStage stage,  int currentClass,  SocialCategory category,  IncomeBand incomeBand,  Gender gender,  bool firstGenerationLearner,  List<String> interestTags,  bool isFlagged,  List<String> recommendedOpportunityIds,  DateTime joinedOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RosterStudent() when $default != null:
return $default(_that.studentId,_that.displayName,_that.stage,_that.currentClass,_that.category,_that.incomeBand,_that.gender,_that.firstGenerationLearner,_that.interestTags,_that.isFlagged,_that.recommendedOpportunityIds,_that.joinedOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String studentId,  String displayName,  EducationStage stage,  int currentClass,  SocialCategory category,  IncomeBand incomeBand,  Gender gender,  bool firstGenerationLearner,  List<String> interestTags,  bool isFlagged,  List<String> recommendedOpportunityIds,  DateTime joinedOn)  $default,) {final _that = this;
switch (_that) {
case _RosterStudent():
return $default(_that.studentId,_that.displayName,_that.stage,_that.currentClass,_that.category,_that.incomeBand,_that.gender,_that.firstGenerationLearner,_that.interestTags,_that.isFlagged,_that.recommendedOpportunityIds,_that.joinedOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String studentId,  String displayName,  EducationStage stage,  int currentClass,  SocialCategory category,  IncomeBand incomeBand,  Gender gender,  bool firstGenerationLearner,  List<String> interestTags,  bool isFlagged,  List<String> recommendedOpportunityIds,  DateTime joinedOn)?  $default,) {final _that = this;
switch (_that) {
case _RosterStudent() when $default != null:
return $default(_that.studentId,_that.displayName,_that.stage,_that.currentClass,_that.category,_that.incomeBand,_that.gender,_that.firstGenerationLearner,_that.interestTags,_that.isFlagged,_that.recommendedOpportunityIds,_that.joinedOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RosterStudent implements RosterStudent {
  const _RosterStudent({required this.studentId, required this.displayName, required this.stage, required this.currentClass, required this.category, required this.incomeBand, required this.gender, required this.firstGenerationLearner, final  List<String> interestTags = const <String>[], required this.isFlagged, final  List<String> recommendedOpportunityIds = const <String>[], required this.joinedOn}): _interestTags = interestTags,_recommendedOpportunityIds = recommendedOpportunityIds;
  factory _RosterStudent.fromJson(Map<String, dynamic> json) => _$RosterStudentFromJson(json);

/// The student's identifier, the same one used in their own profile.
@override final  String studentId;
/// The student's name.
@override final  String displayName;
/// How far along the student is.
@override final  EducationStage stage;
/// The current class number.
@override final  int currentClass;
/// The social category.
@override final  SocialCategory category;
/// The family income band.
@override final  IncomeBand incomeBand;
/// Gender.
@override final  Gender gender;
/// Whether nobody in the family has gone to college.
@override final  bool firstGenerationLearner;
/// The interests the facilitator tagged.
 final  List<String> _interestTags;
/// The interests the facilitator tagged.
@override@JsonKey() List<String> get interestTags {
  if (_interestTags is EqualUnmodifiableListView) return _interestTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interestTags);
}

/// Whether the facilitator flagged this student as talented.
@override final  bool isFlagged;
/// Opportunities the facilitator recommended to this student.
 final  List<String> _recommendedOpportunityIds;
/// Opportunities the facilitator recommended to this student.
@override@JsonKey() List<String> get recommendedOpportunityIds {
  if (_recommendedOpportunityIds is EqualUnmodifiableListView) return _recommendedOpportunityIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendedOpportunityIds);
}

/// When the student joined the class.
@override final  DateTime joinedOn;

/// Create a copy of RosterStudent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RosterStudentCopyWith<_RosterStudent> get copyWith => __$RosterStudentCopyWithImpl<_RosterStudent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RosterStudentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RosterStudent&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.currentClass, currentClass) || other.currentClass == currentClass)&&(identical(other.category, category) || other.category == category)&&(identical(other.incomeBand, incomeBand) || other.incomeBand == incomeBand)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.firstGenerationLearner, firstGenerationLearner) || other.firstGenerationLearner == firstGenerationLearner)&&const DeepCollectionEquality().equals(other._interestTags, _interestTags)&&(identical(other.isFlagged, isFlagged) || other.isFlagged == isFlagged)&&const DeepCollectionEquality().equals(other._recommendedOpportunityIds, _recommendedOpportunityIds)&&(identical(other.joinedOn, joinedOn) || other.joinedOn == joinedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,studentId,displayName,stage,currentClass,category,incomeBand,gender,firstGenerationLearner,const DeepCollectionEquality().hash(_interestTags),isFlagged,const DeepCollectionEquality().hash(_recommendedOpportunityIds),joinedOn);

@override
String toString() {
  return 'RosterStudent(studentId: $studentId, displayName: $displayName, stage: $stage, currentClass: $currentClass, category: $category, incomeBand: $incomeBand, gender: $gender, firstGenerationLearner: $firstGenerationLearner, interestTags: $interestTags, isFlagged: $isFlagged, recommendedOpportunityIds: $recommendedOpportunityIds, joinedOn: $joinedOn)';
}


}

/// @nodoc
abstract mixin class _$RosterStudentCopyWith<$Res> implements $RosterStudentCopyWith<$Res> {
  factory _$RosterStudentCopyWith(_RosterStudent value, $Res Function(_RosterStudent) _then) = __$RosterStudentCopyWithImpl;
@override @useResult
$Res call({
 String studentId, String displayName, EducationStage stage, int currentClass, SocialCategory category, IncomeBand incomeBand, Gender gender, bool firstGenerationLearner, List<String> interestTags, bool isFlagged, List<String> recommendedOpportunityIds, DateTime joinedOn
});




}
/// @nodoc
class __$RosterStudentCopyWithImpl<$Res>
    implements _$RosterStudentCopyWith<$Res> {
  __$RosterStudentCopyWithImpl(this._self, this._then);

  final _RosterStudent _self;
  final $Res Function(_RosterStudent) _then;

/// Create a copy of RosterStudent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? studentId = null,Object? displayName = null,Object? stage = null,Object? currentClass = null,Object? category = null,Object? incomeBand = null,Object? gender = null,Object? firstGenerationLearner = null,Object? interestTags = null,Object? isFlagged = null,Object? recommendedOpportunityIds = null,Object? joinedOn = null,}) {
  return _then(_RosterStudent(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as EducationStage,currentClass: null == currentClass ? _self.currentClass : currentClass // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as SocialCategory,incomeBand: null == incomeBand ? _self.incomeBand : incomeBand // ignore: cast_nullable_to_non_nullable
as IncomeBand,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,firstGenerationLearner: null == firstGenerationLearner ? _self.firstGenerationLearner : firstGenerationLearner // ignore: cast_nullable_to_non_nullable
as bool,interestTags: null == interestTags ? _self._interestTags : interestTags // ignore: cast_nullable_to_non_nullable
as List<String>,isFlagged: null == isFlagged ? _self.isFlagged : isFlagged // ignore: cast_nullable_to_non_nullable
as bool,recommendedOpportunityIds: null == recommendedOpportunityIds ? _self._recommendedOpportunityIds : recommendedOpportunityIds // ignore: cast_nullable_to_non_nullable
as List<String>,joinedOn: null == joinedOn ? _self.joinedOn : joinedOn // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$PublishedModule {

/// The stable identifier.
 String get moduleId;/// The module title.
 String get title;/// What the module covers.
 LocalizedText get description;/// How the module is sold.
 ModulePricing get pricing;/// The price in rupees. Zero for free modules.
 int get priceInRupees;/// How long the module takes.
 int get durationMinutes;/// The clips the module is built from.
 List<String> get clipIds;/// The facilitator who published it.
 String get ownerFacilitatorId;/// When it was published.
 DateTime get publishedOn;
/// Create a copy of PublishedModule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublishedModuleCopyWith<PublishedModule> get copyWith => _$PublishedModuleCopyWithImpl<PublishedModule>(this as PublishedModule, _$identity);

  /// Serializes this PublishedModule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishedModule&&(identical(other.moduleId, moduleId) || other.moduleId == moduleId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.pricing, pricing) || other.pricing == pricing)&&(identical(other.priceInRupees, priceInRupees) || other.priceInRupees == priceInRupees)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&const DeepCollectionEquality().equals(other.clipIds, clipIds)&&(identical(other.ownerFacilitatorId, ownerFacilitatorId) || other.ownerFacilitatorId == ownerFacilitatorId)&&(identical(other.publishedOn, publishedOn) || other.publishedOn == publishedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,moduleId,title,description,pricing,priceInRupees,durationMinutes,const DeepCollectionEquality().hash(clipIds),ownerFacilitatorId,publishedOn);

@override
String toString() {
  return 'PublishedModule(moduleId: $moduleId, title: $title, description: $description, pricing: $pricing, priceInRupees: $priceInRupees, durationMinutes: $durationMinutes, clipIds: $clipIds, ownerFacilitatorId: $ownerFacilitatorId, publishedOn: $publishedOn)';
}


}

/// @nodoc
abstract mixin class $PublishedModuleCopyWith<$Res>  {
  factory $PublishedModuleCopyWith(PublishedModule value, $Res Function(PublishedModule) _then) = _$PublishedModuleCopyWithImpl;
@useResult
$Res call({
 String moduleId, String title, LocalizedText description, ModulePricing pricing, int priceInRupees, int durationMinutes, List<String> clipIds, String ownerFacilitatorId, DateTime publishedOn
});


$LocalizedTextCopyWith<$Res> get description;

}
/// @nodoc
class _$PublishedModuleCopyWithImpl<$Res>
    implements $PublishedModuleCopyWith<$Res> {
  _$PublishedModuleCopyWithImpl(this._self, this._then);

  final PublishedModule _self;
  final $Res Function(PublishedModule) _then;

/// Create a copy of PublishedModule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? moduleId = null,Object? title = null,Object? description = null,Object? pricing = null,Object? priceInRupees = null,Object? durationMinutes = null,Object? clipIds = null,Object? ownerFacilitatorId = null,Object? publishedOn = null,}) {
  return _then(_self.copyWith(
moduleId: null == moduleId ? _self.moduleId : moduleId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as LocalizedText,pricing: null == pricing ? _self.pricing : pricing // ignore: cast_nullable_to_non_nullable
as ModulePricing,priceInRupees: null == priceInRupees ? _self.priceInRupees : priceInRupees // ignore: cast_nullable_to_non_nullable
as int,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,clipIds: null == clipIds ? _self.clipIds : clipIds // ignore: cast_nullable_to_non_nullable
as List<String>,ownerFacilitatorId: null == ownerFacilitatorId ? _self.ownerFacilitatorId : ownerFacilitatorId // ignore: cast_nullable_to_non_nullable
as String,publishedOn: null == publishedOn ? _self.publishedOn : publishedOn // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of PublishedModule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get description {
  
  return $LocalizedTextCopyWith<$Res>(_self.description, (value) {
    return _then(_self.copyWith(description: value));
  });
}
}


/// Adds pattern-matching-related methods to [PublishedModule].
extension PublishedModulePatterns on PublishedModule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublishedModule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublishedModule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublishedModule value)  $default,){
final _that = this;
switch (_that) {
case _PublishedModule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublishedModule value)?  $default,){
final _that = this;
switch (_that) {
case _PublishedModule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String moduleId,  String title,  LocalizedText description,  ModulePricing pricing,  int priceInRupees,  int durationMinutes,  List<String> clipIds,  String ownerFacilitatorId,  DateTime publishedOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublishedModule() when $default != null:
return $default(_that.moduleId,_that.title,_that.description,_that.pricing,_that.priceInRupees,_that.durationMinutes,_that.clipIds,_that.ownerFacilitatorId,_that.publishedOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String moduleId,  String title,  LocalizedText description,  ModulePricing pricing,  int priceInRupees,  int durationMinutes,  List<String> clipIds,  String ownerFacilitatorId,  DateTime publishedOn)  $default,) {final _that = this;
switch (_that) {
case _PublishedModule():
return $default(_that.moduleId,_that.title,_that.description,_that.pricing,_that.priceInRupees,_that.durationMinutes,_that.clipIds,_that.ownerFacilitatorId,_that.publishedOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String moduleId,  String title,  LocalizedText description,  ModulePricing pricing,  int priceInRupees,  int durationMinutes,  List<String> clipIds,  String ownerFacilitatorId,  DateTime publishedOn)?  $default,) {final _that = this;
switch (_that) {
case _PublishedModule() when $default != null:
return $default(_that.moduleId,_that.title,_that.description,_that.pricing,_that.priceInRupees,_that.durationMinutes,_that.clipIds,_that.ownerFacilitatorId,_that.publishedOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublishedModule implements PublishedModule {
  const _PublishedModule({required this.moduleId, required this.title, required this.description, required this.pricing, required this.priceInRupees, required this.durationMinutes, final  List<String> clipIds = const <String>[], required this.ownerFacilitatorId, required this.publishedOn}): _clipIds = clipIds;
  factory _PublishedModule.fromJson(Map<String, dynamic> json) => _$PublishedModuleFromJson(json);

/// The stable identifier.
@override final  String moduleId;
/// The module title.
@override final  String title;
/// What the module covers.
@override final  LocalizedText description;
/// How the module is sold.
@override final  ModulePricing pricing;
/// The price in rupees. Zero for free modules.
@override final  int priceInRupees;
/// How long the module takes.
@override final  int durationMinutes;
/// The clips the module is built from.
 final  List<String> _clipIds;
/// The clips the module is built from.
@override@JsonKey() List<String> get clipIds {
  if (_clipIds is EqualUnmodifiableListView) return _clipIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clipIds);
}

/// The facilitator who published it.
@override final  String ownerFacilitatorId;
/// When it was published.
@override final  DateTime publishedOn;

/// Create a copy of PublishedModule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublishedModuleCopyWith<_PublishedModule> get copyWith => __$PublishedModuleCopyWithImpl<_PublishedModule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublishedModuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublishedModule&&(identical(other.moduleId, moduleId) || other.moduleId == moduleId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.pricing, pricing) || other.pricing == pricing)&&(identical(other.priceInRupees, priceInRupees) || other.priceInRupees == priceInRupees)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&const DeepCollectionEquality().equals(other._clipIds, _clipIds)&&(identical(other.ownerFacilitatorId, ownerFacilitatorId) || other.ownerFacilitatorId == ownerFacilitatorId)&&(identical(other.publishedOn, publishedOn) || other.publishedOn == publishedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,moduleId,title,description,pricing,priceInRupees,durationMinutes,const DeepCollectionEquality().hash(_clipIds),ownerFacilitatorId,publishedOn);

@override
String toString() {
  return 'PublishedModule(moduleId: $moduleId, title: $title, description: $description, pricing: $pricing, priceInRupees: $priceInRupees, durationMinutes: $durationMinutes, clipIds: $clipIds, ownerFacilitatorId: $ownerFacilitatorId, publishedOn: $publishedOn)';
}


}

/// @nodoc
abstract mixin class _$PublishedModuleCopyWith<$Res> implements $PublishedModuleCopyWith<$Res> {
  factory _$PublishedModuleCopyWith(_PublishedModule value, $Res Function(_PublishedModule) _then) = __$PublishedModuleCopyWithImpl;
@override @useResult
$Res call({
 String moduleId, String title, LocalizedText description, ModulePricing pricing, int priceInRupees, int durationMinutes, List<String> clipIds, String ownerFacilitatorId, DateTime publishedOn
});


@override $LocalizedTextCopyWith<$Res> get description;

}
/// @nodoc
class __$PublishedModuleCopyWithImpl<$Res>
    implements _$PublishedModuleCopyWith<$Res> {
  __$PublishedModuleCopyWithImpl(this._self, this._then);

  final _PublishedModule _self;
  final $Res Function(_PublishedModule) _then;

/// Create a copy of PublishedModule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? moduleId = null,Object? title = null,Object? description = null,Object? pricing = null,Object? priceInRupees = null,Object? durationMinutes = null,Object? clipIds = null,Object? ownerFacilitatorId = null,Object? publishedOn = null,}) {
  return _then(_PublishedModule(
moduleId: null == moduleId ? _self.moduleId : moduleId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as LocalizedText,pricing: null == pricing ? _self.pricing : pricing // ignore: cast_nullable_to_non_nullable
as ModulePricing,priceInRupees: null == priceInRupees ? _self.priceInRupees : priceInRupees // ignore: cast_nullable_to_non_nullable
as int,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,clipIds: null == clipIds ? _self._clipIds : clipIds // ignore: cast_nullable_to_non_nullable
as List<String>,ownerFacilitatorId: null == ownerFacilitatorId ? _self.ownerFacilitatorId : ownerFacilitatorId // ignore: cast_nullable_to_non_nullable
as String,publishedOn: null == publishedOn ? _self.publishedOn : publishedOn // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of PublishedModule
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get description {
  
  return $LocalizedTextCopyWith<$Res>(_self.description, (value) {
    return _then(_self.copyWith(description: value));
  });
}
}

// dart format on
