// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explanation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Explanation {

/// The explanation text, in the requested language.
 String get text;/// The identifiers of the records the explanation was written from.
 List<String> get citedOpportunityIds;/// The concrete next steps the student should take.
 List<String> get nextSteps;/// Whether a verified match exists.
 bool get hasVerifiedMatch;/// The language the text is written in.
 String get languageCode;/// When the explanation was written.
 DateTime get generatedAt;
/// Create a copy of Explanation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExplanationCopyWith<Explanation> get copyWith => _$ExplanationCopyWithImpl<Explanation>(this as Explanation, _$identity);

  /// Serializes this Explanation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Explanation&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.citedOpportunityIds, citedOpportunityIds)&&const DeepCollectionEquality().equals(other.nextSteps, nextSteps)&&(identical(other.hasVerifiedMatch, hasVerifiedMatch) || other.hasVerifiedMatch == hasVerifiedMatch)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(citedOpportunityIds),const DeepCollectionEquality().hash(nextSteps),hasVerifiedMatch,languageCode,generatedAt);

@override
String toString() {
  return 'Explanation(text: $text, citedOpportunityIds: $citedOpportunityIds, nextSteps: $nextSteps, hasVerifiedMatch: $hasVerifiedMatch, languageCode: $languageCode, generatedAt: $generatedAt)';
}


}

/// @nodoc
abstract mixin class $ExplanationCopyWith<$Res>  {
  factory $ExplanationCopyWith(Explanation value, $Res Function(Explanation) _then) = _$ExplanationCopyWithImpl;
@useResult
$Res call({
 String text, List<String> citedOpportunityIds, List<String> nextSteps, bool hasVerifiedMatch, String languageCode, DateTime generatedAt
});




}
/// @nodoc
class _$ExplanationCopyWithImpl<$Res>
    implements $ExplanationCopyWith<$Res> {
  _$ExplanationCopyWithImpl(this._self, this._then);

  final Explanation _self;
  final $Res Function(Explanation) _then;

/// Create a copy of Explanation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? citedOpportunityIds = null,Object? nextSteps = null,Object? hasVerifiedMatch = null,Object? languageCode = null,Object? generatedAt = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,citedOpportunityIds: null == citedOpportunityIds ? _self.citedOpportunityIds : citedOpportunityIds // ignore: cast_nullable_to_non_nullable
as List<String>,nextSteps: null == nextSteps ? _self.nextSteps : nextSteps // ignore: cast_nullable_to_non_nullable
as List<String>,hasVerifiedMatch: null == hasVerifiedMatch ? _self.hasVerifiedMatch : hasVerifiedMatch // ignore: cast_nullable_to_non_nullable
as bool,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Explanation].
extension ExplanationPatterns on Explanation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Explanation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Explanation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Explanation value)  $default,){
final _that = this;
switch (_that) {
case _Explanation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Explanation value)?  $default,){
final _that = this;
switch (_that) {
case _Explanation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  List<String> citedOpportunityIds,  List<String> nextSteps,  bool hasVerifiedMatch,  String languageCode,  DateTime generatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Explanation() when $default != null:
return $default(_that.text,_that.citedOpportunityIds,_that.nextSteps,_that.hasVerifiedMatch,_that.languageCode,_that.generatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  List<String> citedOpportunityIds,  List<String> nextSteps,  bool hasVerifiedMatch,  String languageCode,  DateTime generatedAt)  $default,) {final _that = this;
switch (_that) {
case _Explanation():
return $default(_that.text,_that.citedOpportunityIds,_that.nextSteps,_that.hasVerifiedMatch,_that.languageCode,_that.generatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  List<String> citedOpportunityIds,  List<String> nextSteps,  bool hasVerifiedMatch,  String languageCode,  DateTime generatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Explanation() when $default != null:
return $default(_that.text,_that.citedOpportunityIds,_that.nextSteps,_that.hasVerifiedMatch,_that.languageCode,_that.generatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Explanation implements Explanation {
  const _Explanation({required this.text, final  List<String> citedOpportunityIds = const <String>[], final  List<String> nextSteps = const <String>[], required this.hasVerifiedMatch, required this.languageCode, required this.generatedAt}): _citedOpportunityIds = citedOpportunityIds,_nextSteps = nextSteps;
  factory _Explanation.fromJson(Map<String, dynamic> json) => _$ExplanationFromJson(json);

/// The explanation text, in the requested language.
@override final  String text;
/// The identifiers of the records the explanation was written from.
 final  List<String> _citedOpportunityIds;
/// The identifiers of the records the explanation was written from.
@override@JsonKey() List<String> get citedOpportunityIds {
  if (_citedOpportunityIds is EqualUnmodifiableListView) return _citedOpportunityIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_citedOpportunityIds);
}

/// The concrete next steps the student should take.
 final  List<String> _nextSteps;
/// The concrete next steps the student should take.
@override@JsonKey() List<String> get nextSteps {
  if (_nextSteps is EqualUnmodifiableListView) return _nextSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nextSteps);
}

/// Whether a verified match exists.
@override final  bool hasVerifiedMatch;
/// The language the text is written in.
@override final  String languageCode;
/// When the explanation was written.
@override final  DateTime generatedAt;

/// Create a copy of Explanation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExplanationCopyWith<_Explanation> get copyWith => __$ExplanationCopyWithImpl<_Explanation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExplanationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Explanation&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._citedOpportunityIds, _citedOpportunityIds)&&const DeepCollectionEquality().equals(other._nextSteps, _nextSteps)&&(identical(other.hasVerifiedMatch, hasVerifiedMatch) || other.hasVerifiedMatch == hasVerifiedMatch)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(_citedOpportunityIds),const DeepCollectionEquality().hash(_nextSteps),hasVerifiedMatch,languageCode,generatedAt);

@override
String toString() {
  return 'Explanation(text: $text, citedOpportunityIds: $citedOpportunityIds, nextSteps: $nextSteps, hasVerifiedMatch: $hasVerifiedMatch, languageCode: $languageCode, generatedAt: $generatedAt)';
}


}

/// @nodoc
abstract mixin class _$ExplanationCopyWith<$Res> implements $ExplanationCopyWith<$Res> {
  factory _$ExplanationCopyWith(_Explanation value, $Res Function(_Explanation) _then) = __$ExplanationCopyWithImpl;
@override @useResult
$Res call({
 String text, List<String> citedOpportunityIds, List<String> nextSteps, bool hasVerifiedMatch, String languageCode, DateTime generatedAt
});




}
/// @nodoc
class __$ExplanationCopyWithImpl<$Res>
    implements _$ExplanationCopyWith<$Res> {
  __$ExplanationCopyWithImpl(this._self, this._then);

  final _Explanation _self;
  final $Res Function(_Explanation) _then;

/// Create a copy of Explanation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? citedOpportunityIds = null,Object? nextSteps = null,Object? hasVerifiedMatch = null,Object? languageCode = null,Object? generatedAt = null,}) {
  return _then(_Explanation(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,citedOpportunityIds: null == citedOpportunityIds ? _self._citedOpportunityIds : citedOpportunityIds // ignore: cast_nullable_to_non_nullable
as List<String>,nextSteps: null == nextSteps ? _self._nextSteps : nextSteps // ignore: cast_nullable_to_non_nullable
as List<String>,hasVerifiedMatch: null == hasVerifiedMatch ? _self.hasVerifiedMatch : hasVerifiedMatch // ignore: cast_nullable_to_non_nullable
as bool,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
