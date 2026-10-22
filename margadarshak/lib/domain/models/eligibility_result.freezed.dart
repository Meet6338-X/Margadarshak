// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eligibility_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EligibilityResult {

/// The opportunity this result belongs to.
 String get opportunityId;/// The overall verdict.
 EligibilityStatus get status;/// The outcome of every rule that was checked.
 List<RuleOutcome> get outcomes;/// Profile fields that were missing and therefore blocked a verdict.
 List<String> get missingFields;/// The official source link, copied here so a view can show it without
/// loading the whole opportunity again.
 String get sourceUrl;/// The date the source was last verified.
 DateTime get lastVerifiedAt;
/// Create a copy of EligibilityResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EligibilityResultCopyWith<EligibilityResult> get copyWith => _$EligibilityResultCopyWithImpl<EligibilityResult>(this as EligibilityResult, _$identity);

  /// Serializes this EligibilityResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EligibilityResult&&(identical(other.opportunityId, opportunityId) || other.opportunityId == opportunityId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.outcomes, outcomes)&&const DeepCollectionEquality().equals(other.missingFields, missingFields)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&(identical(other.lastVerifiedAt, lastVerifiedAt) || other.lastVerifiedAt == lastVerifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,opportunityId,status,const DeepCollectionEquality().hash(outcomes),const DeepCollectionEquality().hash(missingFields),sourceUrl,lastVerifiedAt);

@override
String toString() {
  return 'EligibilityResult(opportunityId: $opportunityId, status: $status, outcomes: $outcomes, missingFields: $missingFields, sourceUrl: $sourceUrl, lastVerifiedAt: $lastVerifiedAt)';
}


}

/// @nodoc
abstract mixin class $EligibilityResultCopyWith<$Res>  {
  factory $EligibilityResultCopyWith(EligibilityResult value, $Res Function(EligibilityResult) _then) = _$EligibilityResultCopyWithImpl;
@useResult
$Res call({
 String opportunityId, EligibilityStatus status, List<RuleOutcome> outcomes, List<String> missingFields, String sourceUrl, DateTime lastVerifiedAt
});




}
/// @nodoc
class _$EligibilityResultCopyWithImpl<$Res>
    implements $EligibilityResultCopyWith<$Res> {
  _$EligibilityResultCopyWithImpl(this._self, this._then);

  final EligibilityResult _self;
  final $Res Function(EligibilityResult) _then;

/// Create a copy of EligibilityResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? opportunityId = null,Object? status = null,Object? outcomes = null,Object? missingFields = null,Object? sourceUrl = null,Object? lastVerifiedAt = null,}) {
  return _then(_self.copyWith(
opportunityId: null == opportunityId ? _self.opportunityId : opportunityId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EligibilityStatus,outcomes: null == outcomes ? _self.outcomes : outcomes // ignore: cast_nullable_to_non_nullable
as List<RuleOutcome>,missingFields: null == missingFields ? _self.missingFields : missingFields // ignore: cast_nullable_to_non_nullable
as List<String>,sourceUrl: null == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String,lastVerifiedAt: null == lastVerifiedAt ? _self.lastVerifiedAt : lastVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [EligibilityResult].
extension EligibilityResultPatterns on EligibilityResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EligibilityResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EligibilityResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EligibilityResult value)  $default,){
final _that = this;
switch (_that) {
case _EligibilityResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EligibilityResult value)?  $default,){
final _that = this;
switch (_that) {
case _EligibilityResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String opportunityId,  EligibilityStatus status,  List<RuleOutcome> outcomes,  List<String> missingFields,  String sourceUrl,  DateTime lastVerifiedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EligibilityResult() when $default != null:
return $default(_that.opportunityId,_that.status,_that.outcomes,_that.missingFields,_that.sourceUrl,_that.lastVerifiedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String opportunityId,  EligibilityStatus status,  List<RuleOutcome> outcomes,  List<String> missingFields,  String sourceUrl,  DateTime lastVerifiedAt)  $default,) {final _that = this;
switch (_that) {
case _EligibilityResult():
return $default(_that.opportunityId,_that.status,_that.outcomes,_that.missingFields,_that.sourceUrl,_that.lastVerifiedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String opportunityId,  EligibilityStatus status,  List<RuleOutcome> outcomes,  List<String> missingFields,  String sourceUrl,  DateTime lastVerifiedAt)?  $default,) {final _that = this;
switch (_that) {
case _EligibilityResult() when $default != null:
return $default(_that.opportunityId,_that.status,_that.outcomes,_that.missingFields,_that.sourceUrl,_that.lastVerifiedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EligibilityResult implements EligibilityResult {
  const _EligibilityResult({required this.opportunityId, required this.status, final  List<RuleOutcome> outcomes = const <RuleOutcome>[], final  List<String> missingFields = const <String>[], required this.sourceUrl, required this.lastVerifiedAt}): _outcomes = outcomes,_missingFields = missingFields;
  factory _EligibilityResult.fromJson(Map<String, dynamic> json) => _$EligibilityResultFromJson(json);

/// The opportunity this result belongs to.
@override final  String opportunityId;
/// The overall verdict.
@override final  EligibilityStatus status;
/// The outcome of every rule that was checked.
 final  List<RuleOutcome> _outcomes;
/// The outcome of every rule that was checked.
@override@JsonKey() List<RuleOutcome> get outcomes {
  if (_outcomes is EqualUnmodifiableListView) return _outcomes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_outcomes);
}

/// Profile fields that were missing and therefore blocked a verdict.
 final  List<String> _missingFields;
/// Profile fields that were missing and therefore blocked a verdict.
@override@JsonKey() List<String> get missingFields {
  if (_missingFields is EqualUnmodifiableListView) return _missingFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missingFields);
}

/// The official source link, copied here so a view can show it without
/// loading the whole opportunity again.
@override final  String sourceUrl;
/// The date the source was last verified.
@override final  DateTime lastVerifiedAt;

/// Create a copy of EligibilityResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EligibilityResultCopyWith<_EligibilityResult> get copyWith => __$EligibilityResultCopyWithImpl<_EligibilityResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EligibilityResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EligibilityResult&&(identical(other.opportunityId, opportunityId) || other.opportunityId == opportunityId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._outcomes, _outcomes)&&const DeepCollectionEquality().equals(other._missingFields, _missingFields)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&(identical(other.lastVerifiedAt, lastVerifiedAt) || other.lastVerifiedAt == lastVerifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,opportunityId,status,const DeepCollectionEquality().hash(_outcomes),const DeepCollectionEquality().hash(_missingFields),sourceUrl,lastVerifiedAt);

@override
String toString() {
  return 'EligibilityResult(opportunityId: $opportunityId, status: $status, outcomes: $outcomes, missingFields: $missingFields, sourceUrl: $sourceUrl, lastVerifiedAt: $lastVerifiedAt)';
}


}

/// @nodoc
abstract mixin class _$EligibilityResultCopyWith<$Res> implements $EligibilityResultCopyWith<$Res> {
  factory _$EligibilityResultCopyWith(_EligibilityResult value, $Res Function(_EligibilityResult) _then) = __$EligibilityResultCopyWithImpl;
@override @useResult
$Res call({
 String opportunityId, EligibilityStatus status, List<RuleOutcome> outcomes, List<String> missingFields, String sourceUrl, DateTime lastVerifiedAt
});




}
/// @nodoc
class __$EligibilityResultCopyWithImpl<$Res>
    implements _$EligibilityResultCopyWith<$Res> {
  __$EligibilityResultCopyWithImpl(this._self, this._then);

  final _EligibilityResult _self;
  final $Res Function(_EligibilityResult) _then;

/// Create a copy of EligibilityResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? opportunityId = null,Object? status = null,Object? outcomes = null,Object? missingFields = null,Object? sourceUrl = null,Object? lastVerifiedAt = null,}) {
  return _then(_EligibilityResult(
opportunityId: null == opportunityId ? _self.opportunityId : opportunityId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EligibilityStatus,outcomes: null == outcomes ? _self._outcomes : outcomes // ignore: cast_nullable_to_non_nullable
as List<RuleOutcome>,missingFields: null == missingFields ? _self._missingFields : missingFields // ignore: cast_nullable_to_non_nullable
as List<String>,sourceUrl: null == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String,lastVerifiedAt: null == lastVerifiedAt ? _self.lastVerifiedAt : lastVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$RuleOutcome {

/// The identifier of the rule that produced this outcome.
 String get ruleId;/// The reason key explaining the rule.
 String get reasonKey;/// Whether the rule passed.
 bool get passed;/// Whether this rule blocks the whole opportunity.
 bool get isBlocking;/// The profile value that was compared, when there was one.
 String? get actualValue;/// The values the rule was comparing against.
 List<String> get expectedValues;
/// Create a copy of RuleOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RuleOutcomeCopyWith<RuleOutcome> get copyWith => _$RuleOutcomeCopyWithImpl<RuleOutcome>(this as RuleOutcome, _$identity);

  /// Serializes this RuleOutcome to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RuleOutcome&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId)&&(identical(other.reasonKey, reasonKey) || other.reasonKey == reasonKey)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.isBlocking, isBlocking) || other.isBlocking == isBlocking)&&(identical(other.actualValue, actualValue) || other.actualValue == actualValue)&&const DeepCollectionEquality().equals(other.expectedValues, expectedValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ruleId,reasonKey,passed,isBlocking,actualValue,const DeepCollectionEquality().hash(expectedValues));

@override
String toString() {
  return 'RuleOutcome(ruleId: $ruleId, reasonKey: $reasonKey, passed: $passed, isBlocking: $isBlocking, actualValue: $actualValue, expectedValues: $expectedValues)';
}


}

/// @nodoc
abstract mixin class $RuleOutcomeCopyWith<$Res>  {
  factory $RuleOutcomeCopyWith(RuleOutcome value, $Res Function(RuleOutcome) _then) = _$RuleOutcomeCopyWithImpl;
@useResult
$Res call({
 String ruleId, String reasonKey, bool passed, bool isBlocking, String? actualValue, List<String> expectedValues
});




}
/// @nodoc
class _$RuleOutcomeCopyWithImpl<$Res>
    implements $RuleOutcomeCopyWith<$Res> {
  _$RuleOutcomeCopyWithImpl(this._self, this._then);

  final RuleOutcome _self;
  final $Res Function(RuleOutcome) _then;

/// Create a copy of RuleOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ruleId = null,Object? reasonKey = null,Object? passed = null,Object? isBlocking = null,Object? actualValue = freezed,Object? expectedValues = null,}) {
  return _then(_self.copyWith(
ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,reasonKey: null == reasonKey ? _self.reasonKey : reasonKey // ignore: cast_nullable_to_non_nullable
as String,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,isBlocking: null == isBlocking ? _self.isBlocking : isBlocking // ignore: cast_nullable_to_non_nullable
as bool,actualValue: freezed == actualValue ? _self.actualValue : actualValue // ignore: cast_nullable_to_non_nullable
as String?,expectedValues: null == expectedValues ? _self.expectedValues : expectedValues // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [RuleOutcome].
extension RuleOutcomePatterns on RuleOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RuleOutcome value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RuleOutcome() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RuleOutcome value)  $default,){
final _that = this;
switch (_that) {
case _RuleOutcome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RuleOutcome value)?  $default,){
final _that = this;
switch (_that) {
case _RuleOutcome() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ruleId,  String reasonKey,  bool passed,  bool isBlocking,  String? actualValue,  List<String> expectedValues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RuleOutcome() when $default != null:
return $default(_that.ruleId,_that.reasonKey,_that.passed,_that.isBlocking,_that.actualValue,_that.expectedValues);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ruleId,  String reasonKey,  bool passed,  bool isBlocking,  String? actualValue,  List<String> expectedValues)  $default,) {final _that = this;
switch (_that) {
case _RuleOutcome():
return $default(_that.ruleId,_that.reasonKey,_that.passed,_that.isBlocking,_that.actualValue,_that.expectedValues);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ruleId,  String reasonKey,  bool passed,  bool isBlocking,  String? actualValue,  List<String> expectedValues)?  $default,) {final _that = this;
switch (_that) {
case _RuleOutcome() when $default != null:
return $default(_that.ruleId,_that.reasonKey,_that.passed,_that.isBlocking,_that.actualValue,_that.expectedValues);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RuleOutcome implements RuleOutcome {
  const _RuleOutcome({required this.ruleId, required this.reasonKey, required this.passed, required this.isBlocking, this.actualValue, final  List<String> expectedValues = const <String>[]}): _expectedValues = expectedValues;
  factory _RuleOutcome.fromJson(Map<String, dynamic> json) => _$RuleOutcomeFromJson(json);

/// The identifier of the rule that produced this outcome.
@override final  String ruleId;
/// The reason key explaining the rule.
@override final  String reasonKey;
/// Whether the rule passed.
@override final  bool passed;
/// Whether this rule blocks the whole opportunity.
@override final  bool isBlocking;
/// The profile value that was compared, when there was one.
@override final  String? actualValue;
/// The values the rule was comparing against.
 final  List<String> _expectedValues;
/// The values the rule was comparing against.
@override@JsonKey() List<String> get expectedValues {
  if (_expectedValues is EqualUnmodifiableListView) return _expectedValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expectedValues);
}


/// Create a copy of RuleOutcome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RuleOutcomeCopyWith<_RuleOutcome> get copyWith => __$RuleOutcomeCopyWithImpl<_RuleOutcome>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RuleOutcomeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RuleOutcome&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId)&&(identical(other.reasonKey, reasonKey) || other.reasonKey == reasonKey)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.isBlocking, isBlocking) || other.isBlocking == isBlocking)&&(identical(other.actualValue, actualValue) || other.actualValue == actualValue)&&const DeepCollectionEquality().equals(other._expectedValues, _expectedValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ruleId,reasonKey,passed,isBlocking,actualValue,const DeepCollectionEquality().hash(_expectedValues));

@override
String toString() {
  return 'RuleOutcome(ruleId: $ruleId, reasonKey: $reasonKey, passed: $passed, isBlocking: $isBlocking, actualValue: $actualValue, expectedValues: $expectedValues)';
}


}

/// @nodoc
abstract mixin class _$RuleOutcomeCopyWith<$Res> implements $RuleOutcomeCopyWith<$Res> {
  factory _$RuleOutcomeCopyWith(_RuleOutcome value, $Res Function(_RuleOutcome) _then) = __$RuleOutcomeCopyWithImpl;
@override @useResult
$Res call({
 String ruleId, String reasonKey, bool passed, bool isBlocking, String? actualValue, List<String> expectedValues
});




}
/// @nodoc
class __$RuleOutcomeCopyWithImpl<$Res>
    implements _$RuleOutcomeCopyWith<$Res> {
  __$RuleOutcomeCopyWithImpl(this._self, this._then);

  final _RuleOutcome _self;
  final $Res Function(_RuleOutcome) _then;

/// Create a copy of RuleOutcome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ruleId = null,Object? reasonKey = null,Object? passed = null,Object? isBlocking = null,Object? actualValue = freezed,Object? expectedValues = null,}) {
  return _then(_RuleOutcome(
ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,reasonKey: null == reasonKey ? _self.reasonKey : reasonKey // ignore: cast_nullable_to_non_nullable
as String,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,isBlocking: null == isBlocking ? _self.isBlocking : isBlocking // ignore: cast_nullable_to_non_nullable
as bool,actualValue: freezed == actualValue ? _self.actualValue : actualValue // ignore: cast_nullable_to_non_nullable
as String?,expectedValues: null == expectedValues ? _self._expectedValues : expectedValues // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
