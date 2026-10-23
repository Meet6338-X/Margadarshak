// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Streak {

/// Consecutive days completed, counting the current day.
 int get currentDays;/// The longest run ever achieved.
 int get longestDays;/// The last day the student completed the queue.
 DateTime? get lastCompletedOn;/// How many freezes are still available.
 int get freezesAvailable;/// How many freezes have been used so far.
 int get freezesUsed;
/// Create a copy of Streak
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreakCopyWith<Streak> get copyWith => _$StreakCopyWithImpl<Streak>(this as Streak, _$identity);

  /// Serializes this Streak to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Streak&&(identical(other.currentDays, currentDays) || other.currentDays == currentDays)&&(identical(other.longestDays, longestDays) || other.longestDays == longestDays)&&(identical(other.lastCompletedOn, lastCompletedOn) || other.lastCompletedOn == lastCompletedOn)&&(identical(other.freezesAvailable, freezesAvailable) || other.freezesAvailable == freezesAvailable)&&(identical(other.freezesUsed, freezesUsed) || other.freezesUsed == freezesUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentDays,longestDays,lastCompletedOn,freezesAvailable,freezesUsed);

@override
String toString() {
  return 'Streak(currentDays: $currentDays, longestDays: $longestDays, lastCompletedOn: $lastCompletedOn, freezesAvailable: $freezesAvailable, freezesUsed: $freezesUsed)';
}


}

/// @nodoc
abstract mixin class $StreakCopyWith<$Res>  {
  factory $StreakCopyWith(Streak value, $Res Function(Streak) _then) = _$StreakCopyWithImpl;
@useResult
$Res call({
 int currentDays, int longestDays, DateTime? lastCompletedOn, int freezesAvailable, int freezesUsed
});




}
/// @nodoc
class _$StreakCopyWithImpl<$Res>
    implements $StreakCopyWith<$Res> {
  _$StreakCopyWithImpl(this._self, this._then);

  final Streak _self;
  final $Res Function(Streak) _then;

/// Create a copy of Streak
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentDays = null,Object? longestDays = null,Object? lastCompletedOn = freezed,Object? freezesAvailable = null,Object? freezesUsed = null,}) {
  return _then(_self.copyWith(
currentDays: null == currentDays ? _self.currentDays : currentDays // ignore: cast_nullable_to_non_nullable
as int,longestDays: null == longestDays ? _self.longestDays : longestDays // ignore: cast_nullable_to_non_nullable
as int,lastCompletedOn: freezed == lastCompletedOn ? _self.lastCompletedOn : lastCompletedOn // ignore: cast_nullable_to_non_nullable
as DateTime?,freezesAvailable: null == freezesAvailable ? _self.freezesAvailable : freezesAvailable // ignore: cast_nullable_to_non_nullable
as int,freezesUsed: null == freezesUsed ? _self.freezesUsed : freezesUsed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Streak].
extension StreakPatterns on Streak {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Streak value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Streak() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Streak value)  $default,){
final _that = this;
switch (_that) {
case _Streak():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Streak value)?  $default,){
final _that = this;
switch (_that) {
case _Streak() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentDays,  int longestDays,  DateTime? lastCompletedOn,  int freezesAvailable,  int freezesUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Streak() when $default != null:
return $default(_that.currentDays,_that.longestDays,_that.lastCompletedOn,_that.freezesAvailable,_that.freezesUsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentDays,  int longestDays,  DateTime? lastCompletedOn,  int freezesAvailable,  int freezesUsed)  $default,) {final _that = this;
switch (_that) {
case _Streak():
return $default(_that.currentDays,_that.longestDays,_that.lastCompletedOn,_that.freezesAvailable,_that.freezesUsed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentDays,  int longestDays,  DateTime? lastCompletedOn,  int freezesAvailable,  int freezesUsed)?  $default,) {final _that = this;
switch (_that) {
case _Streak() when $default != null:
return $default(_that.currentDays,_that.longestDays,_that.lastCompletedOn,_that.freezesAvailable,_that.freezesUsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Streak implements Streak {
  const _Streak({required this.currentDays, required this.longestDays, this.lastCompletedOn, this.freezesAvailable = 2, this.freezesUsed = 0});
  factory _Streak.fromJson(Map<String, dynamic> json) => _$StreakFromJson(json);

/// Consecutive days completed, counting the current day.
@override final  int currentDays;
/// The longest run ever achieved.
@override final  int longestDays;
/// The last day the student completed the queue.
@override final  DateTime? lastCompletedOn;
/// How many freezes are still available.
@override@JsonKey() final  int freezesAvailable;
/// How many freezes have been used so far.
@override@JsonKey() final  int freezesUsed;

/// Create a copy of Streak
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreakCopyWith<_Streak> get copyWith => __$StreakCopyWithImpl<_Streak>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreakToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Streak&&(identical(other.currentDays, currentDays) || other.currentDays == currentDays)&&(identical(other.longestDays, longestDays) || other.longestDays == longestDays)&&(identical(other.lastCompletedOn, lastCompletedOn) || other.lastCompletedOn == lastCompletedOn)&&(identical(other.freezesAvailable, freezesAvailable) || other.freezesAvailable == freezesAvailable)&&(identical(other.freezesUsed, freezesUsed) || other.freezesUsed == freezesUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentDays,longestDays,lastCompletedOn,freezesAvailable,freezesUsed);

@override
String toString() {
  return 'Streak(currentDays: $currentDays, longestDays: $longestDays, lastCompletedOn: $lastCompletedOn, freezesAvailable: $freezesAvailable, freezesUsed: $freezesUsed)';
}


}

/// @nodoc
abstract mixin class _$StreakCopyWith<$Res> implements $StreakCopyWith<$Res> {
  factory _$StreakCopyWith(_Streak value, $Res Function(_Streak) _then) = __$StreakCopyWithImpl;
@override @useResult
$Res call({
 int currentDays, int longestDays, DateTime? lastCompletedOn, int freezesAvailable, int freezesUsed
});




}
/// @nodoc
class __$StreakCopyWithImpl<$Res>
    implements _$StreakCopyWith<$Res> {
  __$StreakCopyWithImpl(this._self, this._then);

  final _Streak _self;
  final $Res Function(_Streak) _then;

/// Create a copy of Streak
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentDays = null,Object? longestDays = null,Object? lastCompletedOn = freezed,Object? freezesAvailable = null,Object? freezesUsed = null,}) {
  return _then(_Streak(
currentDays: null == currentDays ? _self.currentDays : currentDays // ignore: cast_nullable_to_non_nullable
as int,longestDays: null == longestDays ? _self.longestDays : longestDays // ignore: cast_nullable_to_non_nullable
as int,lastCompletedOn: freezed == lastCompletedOn ? _self.lastCompletedOn : lastCompletedOn // ignore: cast_nullable_to_non_nullable
as DateTime?,freezesAvailable: null == freezesAvailable ? _self.freezesAvailable : freezesAvailable // ignore: cast_nullable_to_non_nullable
as int,freezesUsed: null == freezesUsed ? _self.freezesUsed : freezesUsed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Badge {

/// The stable identifier.
 String get id;/// The badge name.
 LocalizedText get label;/// A short description of what earned it.
 LocalizedText get description;/// When it was awarded.
 DateTime get awardedOn;
/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadgeCopyWith<Badge> get copyWith => _$BadgeCopyWithImpl<Badge>(this as Badge, _$identity);

  /// Serializes this Badge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Badge&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.awardedOn, awardedOn) || other.awardedOn == awardedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,description,awardedOn);

@override
String toString() {
  return 'Badge(id: $id, label: $label, description: $description, awardedOn: $awardedOn)';
}


}

/// @nodoc
abstract mixin class $BadgeCopyWith<$Res>  {
  factory $BadgeCopyWith(Badge value, $Res Function(Badge) _then) = _$BadgeCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText label, LocalizedText description, DateTime awardedOn
});


$LocalizedTextCopyWith<$Res> get label;$LocalizedTextCopyWith<$Res> get description;

}
/// @nodoc
class _$BadgeCopyWithImpl<$Res>
    implements $BadgeCopyWith<$Res> {
  _$BadgeCopyWithImpl(this._self, this._then);

  final Badge _self;
  final $Res Function(Badge) _then;

/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? description = null,Object? awardedOn = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as LocalizedText,awardedOn: null == awardedOn ? _self.awardedOn : awardedOn // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get label {
  
  return $LocalizedTextCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get description {
  
  return $LocalizedTextCopyWith<$Res>(_self.description, (value) {
    return _then(_self.copyWith(description: value));
  });
}
}


/// Adds pattern-matching-related methods to [Badge].
extension BadgePatterns on Badge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Badge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Badge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Badge value)  $default,){
final _that = this;
switch (_that) {
case _Badge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Badge value)?  $default,){
final _that = this;
switch (_that) {
case _Badge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText label,  LocalizedText description,  DateTime awardedOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Badge() when $default != null:
return $default(_that.id,_that.label,_that.description,_that.awardedOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText label,  LocalizedText description,  DateTime awardedOn)  $default,) {final _that = this;
switch (_that) {
case _Badge():
return $default(_that.id,_that.label,_that.description,_that.awardedOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText label,  LocalizedText description,  DateTime awardedOn)?  $default,) {final _that = this;
switch (_that) {
case _Badge() when $default != null:
return $default(_that.id,_that.label,_that.description,_that.awardedOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Badge implements Badge {
  const _Badge({required this.id, required this.label, required this.description, required this.awardedOn});
  factory _Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);

/// The stable identifier.
@override final  String id;
/// The badge name.
@override final  LocalizedText label;
/// A short description of what earned it.
@override final  LocalizedText description;
/// When it was awarded.
@override final  DateTime awardedOn;

/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadgeCopyWith<_Badge> get copyWith => __$BadgeCopyWithImpl<_Badge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BadgeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Badge&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.awardedOn, awardedOn) || other.awardedOn == awardedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,description,awardedOn);

@override
String toString() {
  return 'Badge(id: $id, label: $label, description: $description, awardedOn: $awardedOn)';
}


}

/// @nodoc
abstract mixin class _$BadgeCopyWith<$Res> implements $BadgeCopyWith<$Res> {
  factory _$BadgeCopyWith(_Badge value, $Res Function(_Badge) _then) = __$BadgeCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText label, LocalizedText description, DateTime awardedOn
});


@override $LocalizedTextCopyWith<$Res> get label;@override $LocalizedTextCopyWith<$Res> get description;

}
/// @nodoc
class __$BadgeCopyWithImpl<$Res>
    implements _$BadgeCopyWith<$Res> {
  __$BadgeCopyWithImpl(this._self, this._then);

  final _Badge _self;
  final $Res Function(_Badge) _then;

/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? description = null,Object? awardedOn = null,}) {
  return _then(_Badge(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as LocalizedText,awardedOn: null == awardedOn ? _self.awardedOn : awardedOn // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get label {
  
  return $LocalizedTextCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}/// Create a copy of Badge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get description {
  
  return $LocalizedTextCopyWith<$Res>(_self.description, (value) {
    return _then(_self.copyWith(description: value));
  });
}
}


/// @nodoc
mixin _$LearningProgress {

/// The student this progress belongs to.
 String get studentId;/// The clips the student has finished.
 Set<String> get completedClipIds;/// The days on which the student finished the daily queue, as ISO dates.
 Set<String> get completedDates;/// Points, awarded for effort rather than for scores.
 int get points;/// Badges earned so far.
 List<Badge> get badges;/// The current streak.
 Streak get streak;/// The opportunities the student has opened.
 Set<String> get viewedOpportunityIds;
/// Create a copy of LearningProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningProgressCopyWith<LearningProgress> get copyWith => _$LearningProgressCopyWithImpl<LearningProgress>(this as LearningProgress, _$identity);

  /// Serializes this LearningProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningProgress&&(identical(other.studentId, studentId) || other.studentId == studentId)&&const DeepCollectionEquality().equals(other.completedClipIds, completedClipIds)&&const DeepCollectionEquality().equals(other.completedDates, completedDates)&&(identical(other.points, points) || other.points == points)&&const DeepCollectionEquality().equals(other.badges, badges)&&(identical(other.streak, streak) || other.streak == streak)&&const DeepCollectionEquality().equals(other.viewedOpportunityIds, viewedOpportunityIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,studentId,const DeepCollectionEquality().hash(completedClipIds),const DeepCollectionEquality().hash(completedDates),points,const DeepCollectionEquality().hash(badges),streak,const DeepCollectionEquality().hash(viewedOpportunityIds));

@override
String toString() {
  return 'LearningProgress(studentId: $studentId, completedClipIds: $completedClipIds, completedDates: $completedDates, points: $points, badges: $badges, streak: $streak, viewedOpportunityIds: $viewedOpportunityIds)';
}


}

/// @nodoc
abstract mixin class $LearningProgressCopyWith<$Res>  {
  factory $LearningProgressCopyWith(LearningProgress value, $Res Function(LearningProgress) _then) = _$LearningProgressCopyWithImpl;
@useResult
$Res call({
 String studentId, Set<String> completedClipIds, Set<String> completedDates, int points, List<Badge> badges, Streak streak, Set<String> viewedOpportunityIds
});


$StreakCopyWith<$Res> get streak;

}
/// @nodoc
class _$LearningProgressCopyWithImpl<$Res>
    implements $LearningProgressCopyWith<$Res> {
  _$LearningProgressCopyWithImpl(this._self, this._then);

  final LearningProgress _self;
  final $Res Function(LearningProgress) _then;

/// Create a copy of LearningProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? studentId = null,Object? completedClipIds = null,Object? completedDates = null,Object? points = null,Object? badges = null,Object? streak = null,Object? viewedOpportunityIds = null,}) {
  return _then(_self.copyWith(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,completedClipIds: null == completedClipIds ? _self.completedClipIds : completedClipIds // ignore: cast_nullable_to_non_nullable
as Set<String>,completedDates: null == completedDates ? _self.completedDates : completedDates // ignore: cast_nullable_to_non_nullable
as Set<String>,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<Badge>,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as Streak,viewedOpportunityIds: null == viewedOpportunityIds ? _self.viewedOpportunityIds : viewedOpportunityIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}
/// Create a copy of LearningProgress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreakCopyWith<$Res> get streak {
  
  return $StreakCopyWith<$Res>(_self.streak, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}


/// Adds pattern-matching-related methods to [LearningProgress].
extension LearningProgressPatterns on LearningProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearningProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearningProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearningProgress value)  $default,){
final _that = this;
switch (_that) {
case _LearningProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearningProgress value)?  $default,){
final _that = this;
switch (_that) {
case _LearningProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String studentId,  Set<String> completedClipIds,  Set<String> completedDates,  int points,  List<Badge> badges,  Streak streak,  Set<String> viewedOpportunityIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearningProgress() when $default != null:
return $default(_that.studentId,_that.completedClipIds,_that.completedDates,_that.points,_that.badges,_that.streak,_that.viewedOpportunityIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String studentId,  Set<String> completedClipIds,  Set<String> completedDates,  int points,  List<Badge> badges,  Streak streak,  Set<String> viewedOpportunityIds)  $default,) {final _that = this;
switch (_that) {
case _LearningProgress():
return $default(_that.studentId,_that.completedClipIds,_that.completedDates,_that.points,_that.badges,_that.streak,_that.viewedOpportunityIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String studentId,  Set<String> completedClipIds,  Set<String> completedDates,  int points,  List<Badge> badges,  Streak streak,  Set<String> viewedOpportunityIds)?  $default,) {final _that = this;
switch (_that) {
case _LearningProgress() when $default != null:
return $default(_that.studentId,_that.completedClipIds,_that.completedDates,_that.points,_that.badges,_that.streak,_that.viewedOpportunityIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LearningProgress implements LearningProgress {
  const _LearningProgress({required this.studentId, final  Set<String> completedClipIds = const <String>{}, final  Set<String> completedDates = const <String>{}, required this.points, final  List<Badge> badges = const <Badge>[], required this.streak, final  Set<String> viewedOpportunityIds = const <String>{}}): _completedClipIds = completedClipIds,_completedDates = completedDates,_badges = badges,_viewedOpportunityIds = viewedOpportunityIds;
  factory _LearningProgress.fromJson(Map<String, dynamic> json) => _$LearningProgressFromJson(json);

/// The student this progress belongs to.
@override final  String studentId;
/// The clips the student has finished.
 final  Set<String> _completedClipIds;
/// The clips the student has finished.
@override@JsonKey() Set<String> get completedClipIds {
  if (_completedClipIds is EqualUnmodifiableSetView) return _completedClipIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_completedClipIds);
}

/// The days on which the student finished the daily queue, as ISO dates.
 final  Set<String> _completedDates;
/// The days on which the student finished the daily queue, as ISO dates.
@override@JsonKey() Set<String> get completedDates {
  if (_completedDates is EqualUnmodifiableSetView) return _completedDates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_completedDates);
}

/// Points, awarded for effort rather than for scores.
@override final  int points;
/// Badges earned so far.
 final  List<Badge> _badges;
/// Badges earned so far.
@override@JsonKey() List<Badge> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}

/// The current streak.
@override final  Streak streak;
/// The opportunities the student has opened.
 final  Set<String> _viewedOpportunityIds;
/// The opportunities the student has opened.
@override@JsonKey() Set<String> get viewedOpportunityIds {
  if (_viewedOpportunityIds is EqualUnmodifiableSetView) return _viewedOpportunityIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_viewedOpportunityIds);
}


/// Create a copy of LearningProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningProgressCopyWith<_LearningProgress> get copyWith => __$LearningProgressCopyWithImpl<_LearningProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LearningProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningProgress&&(identical(other.studentId, studentId) || other.studentId == studentId)&&const DeepCollectionEquality().equals(other._completedClipIds, _completedClipIds)&&const DeepCollectionEquality().equals(other._completedDates, _completedDates)&&(identical(other.points, points) || other.points == points)&&const DeepCollectionEquality().equals(other._badges, _badges)&&(identical(other.streak, streak) || other.streak == streak)&&const DeepCollectionEquality().equals(other._viewedOpportunityIds, _viewedOpportunityIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,studentId,const DeepCollectionEquality().hash(_completedClipIds),const DeepCollectionEquality().hash(_completedDates),points,const DeepCollectionEquality().hash(_badges),streak,const DeepCollectionEquality().hash(_viewedOpportunityIds));

@override
String toString() {
  return 'LearningProgress(studentId: $studentId, completedClipIds: $completedClipIds, completedDates: $completedDates, points: $points, badges: $badges, streak: $streak, viewedOpportunityIds: $viewedOpportunityIds)';
}


}

/// @nodoc
abstract mixin class _$LearningProgressCopyWith<$Res> implements $LearningProgressCopyWith<$Res> {
  factory _$LearningProgressCopyWith(_LearningProgress value, $Res Function(_LearningProgress) _then) = __$LearningProgressCopyWithImpl;
@override @useResult
$Res call({
 String studentId, Set<String> completedClipIds, Set<String> completedDates, int points, List<Badge> badges, Streak streak, Set<String> viewedOpportunityIds
});


@override $StreakCopyWith<$Res> get streak;

}
/// @nodoc
class __$LearningProgressCopyWithImpl<$Res>
    implements _$LearningProgressCopyWith<$Res> {
  __$LearningProgressCopyWithImpl(this._self, this._then);

  final _LearningProgress _self;
  final $Res Function(_LearningProgress) _then;

/// Create a copy of LearningProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? studentId = null,Object? completedClipIds = null,Object? completedDates = null,Object? points = null,Object? badges = null,Object? streak = null,Object? viewedOpportunityIds = null,}) {
  return _then(_LearningProgress(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String,completedClipIds: null == completedClipIds ? _self._completedClipIds : completedClipIds // ignore: cast_nullable_to_non_nullable
as Set<String>,completedDates: null == completedDates ? _self._completedDates : completedDates // ignore: cast_nullable_to_non_nullable
as Set<String>,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<Badge>,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as Streak,viewedOpportunityIds: null == viewedOpportunityIds ? _self._viewedOpportunityIds : viewedOpportunityIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

/// Create a copy of LearningProgress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreakCopyWith<$Res> get streak {
  
  return $StreakCopyWith<$Res>(_self.streak, (value) {
    return _then(_self.copyWith(streak: value));
  });
}
}

// dart format on
