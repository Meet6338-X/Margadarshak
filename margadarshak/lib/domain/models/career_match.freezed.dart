// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'career_match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CareerMatch {

/// The career itself.
 Career get career;/// How strongly it matches, higher is better.
 int get score;/// The interest tags that matched.
 List<String> get matchedTags;
/// Create a copy of CareerMatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CareerMatchCopyWith<CareerMatch> get copyWith => _$CareerMatchCopyWithImpl<CareerMatch>(this as CareerMatch, _$identity);

  /// Serializes this CareerMatch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CareerMatch&&(identical(other.career, career) || other.career == career)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other.matchedTags, matchedTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,career,score,const DeepCollectionEquality().hash(matchedTags));

@override
String toString() {
  return 'CareerMatch(career: $career, score: $score, matchedTags: $matchedTags)';
}


}

/// @nodoc
abstract mixin class $CareerMatchCopyWith<$Res>  {
  factory $CareerMatchCopyWith(CareerMatch value, $Res Function(CareerMatch) _then) = _$CareerMatchCopyWithImpl;
@useResult
$Res call({
 Career career, int score, List<String> matchedTags
});


$CareerCopyWith<$Res> get career;

}
/// @nodoc
class _$CareerMatchCopyWithImpl<$Res>
    implements $CareerMatchCopyWith<$Res> {
  _$CareerMatchCopyWithImpl(this._self, this._then);

  final CareerMatch _self;
  final $Res Function(CareerMatch) _then;

/// Create a copy of CareerMatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? career = null,Object? score = null,Object? matchedTags = null,}) {
  return _then(_self.copyWith(
career: null == career ? _self.career : career // ignore: cast_nullable_to_non_nullable
as Career,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,matchedTags: null == matchedTags ? _self.matchedTags : matchedTags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of CareerMatch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CareerCopyWith<$Res> get career {
  
  return $CareerCopyWith<$Res>(_self.career, (value) {
    return _then(_self.copyWith(career: value));
  });
}
}


/// Adds pattern-matching-related methods to [CareerMatch].
extension CareerMatchPatterns on CareerMatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CareerMatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CareerMatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CareerMatch value)  $default,){
final _that = this;
switch (_that) {
case _CareerMatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CareerMatch value)?  $default,){
final _that = this;
switch (_that) {
case _CareerMatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Career career,  int score,  List<String> matchedTags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CareerMatch() when $default != null:
return $default(_that.career,_that.score,_that.matchedTags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Career career,  int score,  List<String> matchedTags)  $default,) {final _that = this;
switch (_that) {
case _CareerMatch():
return $default(_that.career,_that.score,_that.matchedTags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Career career,  int score,  List<String> matchedTags)?  $default,) {final _that = this;
switch (_that) {
case _CareerMatch() when $default != null:
return $default(_that.career,_that.score,_that.matchedTags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CareerMatch implements CareerMatch {
  const _CareerMatch({required this.career, required this.score, final  List<String> matchedTags = const <String>[]}): _matchedTags = matchedTags;
  factory _CareerMatch.fromJson(Map<String, dynamic> json) => _$CareerMatchFromJson(json);

/// The career itself.
@override final  Career career;
/// How strongly it matches, higher is better.
@override final  int score;
/// The interest tags that matched.
 final  List<String> _matchedTags;
/// The interest tags that matched.
@override@JsonKey() List<String> get matchedTags {
  if (_matchedTags is EqualUnmodifiableListView) return _matchedTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matchedTags);
}


/// Create a copy of CareerMatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CareerMatchCopyWith<_CareerMatch> get copyWith => __$CareerMatchCopyWithImpl<_CareerMatch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CareerMatchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CareerMatch&&(identical(other.career, career) || other.career == career)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other._matchedTags, _matchedTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,career,score,const DeepCollectionEquality().hash(_matchedTags));

@override
String toString() {
  return 'CareerMatch(career: $career, score: $score, matchedTags: $matchedTags)';
}


}

/// @nodoc
abstract mixin class _$CareerMatchCopyWith<$Res> implements $CareerMatchCopyWith<$Res> {
  factory _$CareerMatchCopyWith(_CareerMatch value, $Res Function(_CareerMatch) _then) = __$CareerMatchCopyWithImpl;
@override @useResult
$Res call({
 Career career, int score, List<String> matchedTags
});


@override $CareerCopyWith<$Res> get career;

}
/// @nodoc
class __$CareerMatchCopyWithImpl<$Res>
    implements _$CareerMatchCopyWith<$Res> {
  __$CareerMatchCopyWithImpl(this._self, this._then);

  final _CareerMatch _self;
  final $Res Function(_CareerMatch) _then;

/// Create a copy of CareerMatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? career = null,Object? score = null,Object? matchedTags = null,}) {
  return _then(_CareerMatch(
career: null == career ? _self.career : career // ignore: cast_nullable_to_non_nullable
as Career,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,matchedTags: null == matchedTags ? _self._matchedTags : matchedTags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of CareerMatch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CareerCopyWith<$Res> get career {
  
  return $CareerCopyWith<$Res>(_self.career, (value) {
    return _then(_self.copyWith(career: value));
  });
}
}

// dart format on
