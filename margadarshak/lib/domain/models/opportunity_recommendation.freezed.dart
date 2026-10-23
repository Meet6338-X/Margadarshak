// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opportunity_recommendation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpportunityRecommendation {

/// The opportunity itself.
 Opportunity get opportunity;/// The eligibility verdict for this student.
 EligibilityResult get eligibility;/// How relevant the opportunity is to this student, higher is better.
 int get relevanceScore;
/// Create a copy of OpportunityRecommendation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpportunityRecommendationCopyWith<OpportunityRecommendation> get copyWith => _$OpportunityRecommendationCopyWithImpl<OpportunityRecommendation>(this as OpportunityRecommendation, _$identity);

  /// Serializes this OpportunityRecommendation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpportunityRecommendation&&(identical(other.opportunity, opportunity) || other.opportunity == opportunity)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.relevanceScore, relevanceScore) || other.relevanceScore == relevanceScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,opportunity,eligibility,relevanceScore);

@override
String toString() {
  return 'OpportunityRecommendation(opportunity: $opportunity, eligibility: $eligibility, relevanceScore: $relevanceScore)';
}


}

/// @nodoc
abstract mixin class $OpportunityRecommendationCopyWith<$Res>  {
  factory $OpportunityRecommendationCopyWith(OpportunityRecommendation value, $Res Function(OpportunityRecommendation) _then) = _$OpportunityRecommendationCopyWithImpl;
@useResult
$Res call({
 Opportunity opportunity, EligibilityResult eligibility, int relevanceScore
});


$OpportunityCopyWith<$Res> get opportunity;$EligibilityResultCopyWith<$Res> get eligibility;

}
/// @nodoc
class _$OpportunityRecommendationCopyWithImpl<$Res>
    implements $OpportunityRecommendationCopyWith<$Res> {
  _$OpportunityRecommendationCopyWithImpl(this._self, this._then);

  final OpportunityRecommendation _self;
  final $Res Function(OpportunityRecommendation) _then;

/// Create a copy of OpportunityRecommendation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? opportunity = null,Object? eligibility = null,Object? relevanceScore = null,}) {
  return _then(_self.copyWith(
opportunity: null == opportunity ? _self.opportunity : opportunity // ignore: cast_nullable_to_non_nullable
as Opportunity,eligibility: null == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as EligibilityResult,relevanceScore: null == relevanceScore ? _self.relevanceScore : relevanceScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of OpportunityRecommendation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpportunityCopyWith<$Res> get opportunity {
  
  return $OpportunityCopyWith<$Res>(_self.opportunity, (value) {
    return _then(_self.copyWith(opportunity: value));
  });
}/// Create a copy of OpportunityRecommendation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EligibilityResultCopyWith<$Res> get eligibility {
  
  return $EligibilityResultCopyWith<$Res>(_self.eligibility, (value) {
    return _then(_self.copyWith(eligibility: value));
  });
}
}


/// Adds pattern-matching-related methods to [OpportunityRecommendation].
extension OpportunityRecommendationPatterns on OpportunityRecommendation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpportunityRecommendation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpportunityRecommendation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpportunityRecommendation value)  $default,){
final _that = this;
switch (_that) {
case _OpportunityRecommendation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpportunityRecommendation value)?  $default,){
final _that = this;
switch (_that) {
case _OpportunityRecommendation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Opportunity opportunity,  EligibilityResult eligibility,  int relevanceScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpportunityRecommendation() when $default != null:
return $default(_that.opportunity,_that.eligibility,_that.relevanceScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Opportunity opportunity,  EligibilityResult eligibility,  int relevanceScore)  $default,) {final _that = this;
switch (_that) {
case _OpportunityRecommendation():
return $default(_that.opportunity,_that.eligibility,_that.relevanceScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Opportunity opportunity,  EligibilityResult eligibility,  int relevanceScore)?  $default,) {final _that = this;
switch (_that) {
case _OpportunityRecommendation() when $default != null:
return $default(_that.opportunity,_that.eligibility,_that.relevanceScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpportunityRecommendation implements OpportunityRecommendation {
  const _OpportunityRecommendation({required this.opportunity, required this.eligibility, required this.relevanceScore});
  factory _OpportunityRecommendation.fromJson(Map<String, dynamic> json) => _$OpportunityRecommendationFromJson(json);

/// The opportunity itself.
@override final  Opportunity opportunity;
/// The eligibility verdict for this student.
@override final  EligibilityResult eligibility;
/// How relevant the opportunity is to this student, higher is better.
@override final  int relevanceScore;

/// Create a copy of OpportunityRecommendation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpportunityRecommendationCopyWith<_OpportunityRecommendation> get copyWith => __$OpportunityRecommendationCopyWithImpl<_OpportunityRecommendation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpportunityRecommendationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpportunityRecommendation&&(identical(other.opportunity, opportunity) || other.opportunity == opportunity)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.relevanceScore, relevanceScore) || other.relevanceScore == relevanceScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,opportunity,eligibility,relevanceScore);

@override
String toString() {
  return 'OpportunityRecommendation(opportunity: $opportunity, eligibility: $eligibility, relevanceScore: $relevanceScore)';
}


}

/// @nodoc
abstract mixin class _$OpportunityRecommendationCopyWith<$Res> implements $OpportunityRecommendationCopyWith<$Res> {
  factory _$OpportunityRecommendationCopyWith(_OpportunityRecommendation value, $Res Function(_OpportunityRecommendation) _then) = __$OpportunityRecommendationCopyWithImpl;
@override @useResult
$Res call({
 Opportunity opportunity, EligibilityResult eligibility, int relevanceScore
});


@override $OpportunityCopyWith<$Res> get opportunity;@override $EligibilityResultCopyWith<$Res> get eligibility;

}
/// @nodoc
class __$OpportunityRecommendationCopyWithImpl<$Res>
    implements _$OpportunityRecommendationCopyWith<$Res> {
  __$OpportunityRecommendationCopyWithImpl(this._self, this._then);

  final _OpportunityRecommendation _self;
  final $Res Function(_OpportunityRecommendation) _then;

/// Create a copy of OpportunityRecommendation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? opportunity = null,Object? eligibility = null,Object? relevanceScore = null,}) {
  return _then(_OpportunityRecommendation(
opportunity: null == opportunity ? _self.opportunity : opportunity // ignore: cast_nullable_to_non_nullable
as Opportunity,eligibility: null == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as EligibilityResult,relevanceScore: null == relevanceScore ? _self.relevanceScore : relevanceScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of OpportunityRecommendation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpportunityCopyWith<$Res> get opportunity {
  
  return $OpportunityCopyWith<$Res>(_self.opportunity, (value) {
    return _then(_self.copyWith(opportunity: value));
  });
}/// Create a copy of OpportunityRecommendation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EligibilityResultCopyWith<$Res> get eligibility {
  
  return $EligibilityResultCopyWith<$Res>(_self.eligibility, (value) {
    return _then(_self.copyWith(eligibility: value));
  });
}
}

// dart format on
