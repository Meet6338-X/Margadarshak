// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opportunity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Opportunity {

/// The stable identifier, unique across all data packs.
 String get id;/// What kind of opportunity this is.
 OpportunityKind get kind;/// The opportunity name.
 LocalizedText get title;/// A short explanation of what the opportunity gives.
 LocalizedText get summary;/// The name of the body that publishes the opportunity.
 String get officialSourceName;/// The link to the official page. Mandatory — an opportunity without one
/// is never shown to a student.
 String get officialSourceUrl;/// The date a human last checked the official page.
 DateTime get lastVerifiedAt;/// `national` or a state code such as `mh`.
 String get scope;/// The rules that decide whether a student qualifies.
 List<EligibilityRule> get eligibilityRules;/// The documents a student has to collect.
 List<DocumentRequirement> get requiredDocuments;/// When applications open, if the record has a window.
 DateTime? get applicationOpensAt;/// When applications close, if the record has a window.
 DateTime? get applicationClosesAt;/// Interest and career tags used for ranking.
 List<String> get categories;/// Career ids this opportunity leads towards.
 List<String> get careerIds;/// The lowest class the student may be in.
 int? get minClass;/// The highest class the student may be in.
 int? get maxClass;/// Whether the official page states an amount. When it does not, the app
/// says so instead of guessing.
 bool get amountDisclosed;/// The page where the student actually submits the application, when the
/// official portal separates it from the information page. When it is
/// absent the app sends the student to the official source itself.
 String? get applyUrl;/// The concrete steps of the application flow, when the official source
/// publishes them as steps. An empty list means the app shows only the
/// link and the document checklist.
 List<LocalizedText> get applySteps;
/// Create a copy of Opportunity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpportunityCopyWith<Opportunity> get copyWith => _$OpportunityCopyWithImpl<Opportunity>(this as Opportunity, _$identity);

  /// Serializes this Opportunity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Opportunity&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.officialSourceName, officialSourceName) || other.officialSourceName == officialSourceName)&&(identical(other.officialSourceUrl, officialSourceUrl) || other.officialSourceUrl == officialSourceUrl)&&(identical(other.lastVerifiedAt, lastVerifiedAt) || other.lastVerifiedAt == lastVerifiedAt)&&(identical(other.scope, scope) || other.scope == scope)&&const DeepCollectionEquality().equals(other.eligibilityRules, eligibilityRules)&&const DeepCollectionEquality().equals(other.requiredDocuments, requiredDocuments)&&(identical(other.applicationOpensAt, applicationOpensAt) || other.applicationOpensAt == applicationOpensAt)&&(identical(other.applicationClosesAt, applicationClosesAt) || other.applicationClosesAt == applicationClosesAt)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.careerIds, careerIds)&&(identical(other.minClass, minClass) || other.minClass == minClass)&&(identical(other.maxClass, maxClass) || other.maxClass == maxClass)&&(identical(other.amountDisclosed, amountDisclosed) || other.amountDisclosed == amountDisclosed)&&(identical(other.applyUrl, applyUrl) || other.applyUrl == applyUrl)&&const DeepCollectionEquality().equals(other.applySteps, applySteps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,kind,title,summary,officialSourceName,officialSourceUrl,lastVerifiedAt,scope,const DeepCollectionEquality().hash(eligibilityRules),const DeepCollectionEquality().hash(requiredDocuments),applicationOpensAt,applicationClosesAt,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(careerIds),minClass,maxClass,amountDisclosed,applyUrl,const DeepCollectionEquality().hash(applySteps)]);

@override
String toString() {
  return 'Opportunity(id: $id, kind: $kind, title: $title, summary: $summary, officialSourceName: $officialSourceName, officialSourceUrl: $officialSourceUrl, lastVerifiedAt: $lastVerifiedAt, scope: $scope, eligibilityRules: $eligibilityRules, requiredDocuments: $requiredDocuments, applicationOpensAt: $applicationOpensAt, applicationClosesAt: $applicationClosesAt, categories: $categories, careerIds: $careerIds, minClass: $minClass, maxClass: $maxClass, amountDisclosed: $amountDisclosed, applyUrl: $applyUrl, applySteps: $applySteps)';
}


}

/// @nodoc
abstract mixin class $OpportunityCopyWith<$Res>  {
  factory $OpportunityCopyWith(Opportunity value, $Res Function(Opportunity) _then) = _$OpportunityCopyWithImpl;
@useResult
$Res call({
 String id, OpportunityKind kind, LocalizedText title, LocalizedText summary, String officialSourceName, String officialSourceUrl, DateTime lastVerifiedAt, String scope, List<EligibilityRule> eligibilityRules, List<DocumentRequirement> requiredDocuments, DateTime? applicationOpensAt, DateTime? applicationClosesAt, List<String> categories, List<String> careerIds, int? minClass, int? maxClass, bool amountDisclosed, String? applyUrl, List<LocalizedText> applySteps
});


$LocalizedTextCopyWith<$Res> get title;$LocalizedTextCopyWith<$Res> get summary;

}
/// @nodoc
class _$OpportunityCopyWithImpl<$Res>
    implements $OpportunityCopyWith<$Res> {
  _$OpportunityCopyWithImpl(this._self, this._then);

  final Opportunity _self;
  final $Res Function(Opportunity) _then;

/// Create a copy of Opportunity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? summary = null,Object? officialSourceName = null,Object? officialSourceUrl = null,Object? lastVerifiedAt = null,Object? scope = null,Object? eligibilityRules = null,Object? requiredDocuments = null,Object? applicationOpensAt = freezed,Object? applicationClosesAt = freezed,Object? categories = null,Object? careerIds = null,Object? minClass = freezed,Object? maxClass = freezed,Object? amountDisclosed = null,Object? applyUrl = freezed,Object? applySteps = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as OpportunityKind,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as LocalizedText,officialSourceName: null == officialSourceName ? _self.officialSourceName : officialSourceName // ignore: cast_nullable_to_non_nullable
as String,officialSourceUrl: null == officialSourceUrl ? _self.officialSourceUrl : officialSourceUrl // ignore: cast_nullable_to_non_nullable
as String,lastVerifiedAt: null == lastVerifiedAt ? _self.lastVerifiedAt : lastVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,eligibilityRules: null == eligibilityRules ? _self.eligibilityRules : eligibilityRules // ignore: cast_nullable_to_non_nullable
as List<EligibilityRule>,requiredDocuments: null == requiredDocuments ? _self.requiredDocuments : requiredDocuments // ignore: cast_nullable_to_non_nullable
as List<DocumentRequirement>,applicationOpensAt: freezed == applicationOpensAt ? _self.applicationOpensAt : applicationOpensAt // ignore: cast_nullable_to_non_nullable
as DateTime?,applicationClosesAt: freezed == applicationClosesAt ? _self.applicationClosesAt : applicationClosesAt // ignore: cast_nullable_to_non_nullable
as DateTime?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,careerIds: null == careerIds ? _self.careerIds : careerIds // ignore: cast_nullable_to_non_nullable
as List<String>,minClass: freezed == minClass ? _self.minClass : minClass // ignore: cast_nullable_to_non_nullable
as int?,maxClass: freezed == maxClass ? _self.maxClass : maxClass // ignore: cast_nullable_to_non_nullable
as int?,amountDisclosed: null == amountDisclosed ? _self.amountDisclosed : amountDisclosed // ignore: cast_nullable_to_non_nullable
as bool,applyUrl: freezed == applyUrl ? _self.applyUrl : applyUrl // ignore: cast_nullable_to_non_nullable
as String?,applySteps: null == applySteps ? _self.applySteps : applySteps // ignore: cast_nullable_to_non_nullable
as List<LocalizedText>,
  ));
}
/// Create a copy of Opportunity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get title {
  
  return $LocalizedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Opportunity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get summary {
  
  return $LocalizedTextCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [Opportunity].
extension OpportunityPatterns on Opportunity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Opportunity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Opportunity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Opportunity value)  $default,){
final _that = this;
switch (_that) {
case _Opportunity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Opportunity value)?  $default,){
final _that = this;
switch (_that) {
case _Opportunity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  OpportunityKind kind,  LocalizedText title,  LocalizedText summary,  String officialSourceName,  String officialSourceUrl,  DateTime lastVerifiedAt,  String scope,  List<EligibilityRule> eligibilityRules,  List<DocumentRequirement> requiredDocuments,  DateTime? applicationOpensAt,  DateTime? applicationClosesAt,  List<String> categories,  List<String> careerIds,  int? minClass,  int? maxClass,  bool amountDisclosed,  String? applyUrl,  List<LocalizedText> applySteps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Opportunity() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.summary,_that.officialSourceName,_that.officialSourceUrl,_that.lastVerifiedAt,_that.scope,_that.eligibilityRules,_that.requiredDocuments,_that.applicationOpensAt,_that.applicationClosesAt,_that.categories,_that.careerIds,_that.minClass,_that.maxClass,_that.amountDisclosed,_that.applyUrl,_that.applySteps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  OpportunityKind kind,  LocalizedText title,  LocalizedText summary,  String officialSourceName,  String officialSourceUrl,  DateTime lastVerifiedAt,  String scope,  List<EligibilityRule> eligibilityRules,  List<DocumentRequirement> requiredDocuments,  DateTime? applicationOpensAt,  DateTime? applicationClosesAt,  List<String> categories,  List<String> careerIds,  int? minClass,  int? maxClass,  bool amountDisclosed,  String? applyUrl,  List<LocalizedText> applySteps)  $default,) {final _that = this;
switch (_that) {
case _Opportunity():
return $default(_that.id,_that.kind,_that.title,_that.summary,_that.officialSourceName,_that.officialSourceUrl,_that.lastVerifiedAt,_that.scope,_that.eligibilityRules,_that.requiredDocuments,_that.applicationOpensAt,_that.applicationClosesAt,_that.categories,_that.careerIds,_that.minClass,_that.maxClass,_that.amountDisclosed,_that.applyUrl,_that.applySteps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  OpportunityKind kind,  LocalizedText title,  LocalizedText summary,  String officialSourceName,  String officialSourceUrl,  DateTime lastVerifiedAt,  String scope,  List<EligibilityRule> eligibilityRules,  List<DocumentRequirement> requiredDocuments,  DateTime? applicationOpensAt,  DateTime? applicationClosesAt,  List<String> categories,  List<String> careerIds,  int? minClass,  int? maxClass,  bool amountDisclosed,  String? applyUrl,  List<LocalizedText> applySteps)?  $default,) {final _that = this;
switch (_that) {
case _Opportunity() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.summary,_that.officialSourceName,_that.officialSourceUrl,_that.lastVerifiedAt,_that.scope,_that.eligibilityRules,_that.requiredDocuments,_that.applicationOpensAt,_that.applicationClosesAt,_that.categories,_that.careerIds,_that.minClass,_that.maxClass,_that.amountDisclosed,_that.applyUrl,_that.applySteps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Opportunity implements Opportunity {
  const _Opportunity({required this.id, required this.kind, required this.title, required this.summary, required this.officialSourceName, required this.officialSourceUrl, required this.lastVerifiedAt, required this.scope, final  List<EligibilityRule> eligibilityRules = const <EligibilityRule>[], final  List<DocumentRequirement> requiredDocuments = const <DocumentRequirement>[], this.applicationOpensAt, this.applicationClosesAt, final  List<String> categories = const <String>[], final  List<String> careerIds = const <String>[], this.minClass, this.maxClass, required this.amountDisclosed, this.applyUrl, final  List<LocalizedText> applySteps = const <LocalizedText>[]}): _eligibilityRules = eligibilityRules,_requiredDocuments = requiredDocuments,_categories = categories,_careerIds = careerIds,_applySteps = applySteps;
  factory _Opportunity.fromJson(Map<String, dynamic> json) => _$OpportunityFromJson(json);

/// The stable identifier, unique across all data packs.
@override final  String id;
/// What kind of opportunity this is.
@override final  OpportunityKind kind;
/// The opportunity name.
@override final  LocalizedText title;
/// A short explanation of what the opportunity gives.
@override final  LocalizedText summary;
/// The name of the body that publishes the opportunity.
@override final  String officialSourceName;
/// The link to the official page. Mandatory — an opportunity without one
/// is never shown to a student.
@override final  String officialSourceUrl;
/// The date a human last checked the official page.
@override final  DateTime lastVerifiedAt;
/// `national` or a state code such as `mh`.
@override final  String scope;
/// The rules that decide whether a student qualifies.
 final  List<EligibilityRule> _eligibilityRules;
/// The rules that decide whether a student qualifies.
@override@JsonKey() List<EligibilityRule> get eligibilityRules {
  if (_eligibilityRules is EqualUnmodifiableListView) return _eligibilityRules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eligibilityRules);
}

/// The documents a student has to collect.
 final  List<DocumentRequirement> _requiredDocuments;
/// The documents a student has to collect.
@override@JsonKey() List<DocumentRequirement> get requiredDocuments {
  if (_requiredDocuments is EqualUnmodifiableListView) return _requiredDocuments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requiredDocuments);
}

/// When applications open, if the record has a window.
@override final  DateTime? applicationOpensAt;
/// When applications close, if the record has a window.
@override final  DateTime? applicationClosesAt;
/// Interest and career tags used for ranking.
 final  List<String> _categories;
/// Interest and career tags used for ranking.
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

/// Career ids this opportunity leads towards.
 final  List<String> _careerIds;
/// Career ids this opportunity leads towards.
@override@JsonKey() List<String> get careerIds {
  if (_careerIds is EqualUnmodifiableListView) return _careerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_careerIds);
}

/// The lowest class the student may be in.
@override final  int? minClass;
/// The highest class the student may be in.
@override final  int? maxClass;
/// Whether the official page states an amount. When it does not, the app
/// says so instead of guessing.
@override final  bool amountDisclosed;
/// The page where the student actually submits the application, when the
/// official portal separates it from the information page. When it is
/// absent the app sends the student to the official source itself.
@override final  String? applyUrl;
/// The concrete steps of the application flow, when the official source
/// publishes them as steps. An empty list means the app shows only the
/// link and the document checklist.
 final  List<LocalizedText> _applySteps;
/// The concrete steps of the application flow, when the official source
/// publishes them as steps. An empty list means the app shows only the
/// link and the document checklist.
@override@JsonKey() List<LocalizedText> get applySteps {
  if (_applySteps is EqualUnmodifiableListView) return _applySteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applySteps);
}


/// Create a copy of Opportunity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpportunityCopyWith<_Opportunity> get copyWith => __$OpportunityCopyWithImpl<_Opportunity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpportunityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Opportunity&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.officialSourceName, officialSourceName) || other.officialSourceName == officialSourceName)&&(identical(other.officialSourceUrl, officialSourceUrl) || other.officialSourceUrl == officialSourceUrl)&&(identical(other.lastVerifiedAt, lastVerifiedAt) || other.lastVerifiedAt == lastVerifiedAt)&&(identical(other.scope, scope) || other.scope == scope)&&const DeepCollectionEquality().equals(other._eligibilityRules, _eligibilityRules)&&const DeepCollectionEquality().equals(other._requiredDocuments, _requiredDocuments)&&(identical(other.applicationOpensAt, applicationOpensAt) || other.applicationOpensAt == applicationOpensAt)&&(identical(other.applicationClosesAt, applicationClosesAt) || other.applicationClosesAt == applicationClosesAt)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._careerIds, _careerIds)&&(identical(other.minClass, minClass) || other.minClass == minClass)&&(identical(other.maxClass, maxClass) || other.maxClass == maxClass)&&(identical(other.amountDisclosed, amountDisclosed) || other.amountDisclosed == amountDisclosed)&&(identical(other.applyUrl, applyUrl) || other.applyUrl == applyUrl)&&const DeepCollectionEquality().equals(other._applySteps, _applySteps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,kind,title,summary,officialSourceName,officialSourceUrl,lastVerifiedAt,scope,const DeepCollectionEquality().hash(_eligibilityRules),const DeepCollectionEquality().hash(_requiredDocuments),applicationOpensAt,applicationClosesAt,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_careerIds),minClass,maxClass,amountDisclosed,applyUrl,const DeepCollectionEquality().hash(_applySteps)]);

@override
String toString() {
  return 'Opportunity(id: $id, kind: $kind, title: $title, summary: $summary, officialSourceName: $officialSourceName, officialSourceUrl: $officialSourceUrl, lastVerifiedAt: $lastVerifiedAt, scope: $scope, eligibilityRules: $eligibilityRules, requiredDocuments: $requiredDocuments, applicationOpensAt: $applicationOpensAt, applicationClosesAt: $applicationClosesAt, categories: $categories, careerIds: $careerIds, minClass: $minClass, maxClass: $maxClass, amountDisclosed: $amountDisclosed, applyUrl: $applyUrl, applySteps: $applySteps)';
}


}

/// @nodoc
abstract mixin class _$OpportunityCopyWith<$Res> implements $OpportunityCopyWith<$Res> {
  factory _$OpportunityCopyWith(_Opportunity value, $Res Function(_Opportunity) _then) = __$OpportunityCopyWithImpl;
@override @useResult
$Res call({
 String id, OpportunityKind kind, LocalizedText title, LocalizedText summary, String officialSourceName, String officialSourceUrl, DateTime lastVerifiedAt, String scope, List<EligibilityRule> eligibilityRules, List<DocumentRequirement> requiredDocuments, DateTime? applicationOpensAt, DateTime? applicationClosesAt, List<String> categories, List<String> careerIds, int? minClass, int? maxClass, bool amountDisclosed, String? applyUrl, List<LocalizedText> applySteps
});


@override $LocalizedTextCopyWith<$Res> get title;@override $LocalizedTextCopyWith<$Res> get summary;

}
/// @nodoc
class __$OpportunityCopyWithImpl<$Res>
    implements _$OpportunityCopyWith<$Res> {
  __$OpportunityCopyWithImpl(this._self, this._then);

  final _Opportunity _self;
  final $Res Function(_Opportunity) _then;

/// Create a copy of Opportunity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? summary = null,Object? officialSourceName = null,Object? officialSourceUrl = null,Object? lastVerifiedAt = null,Object? scope = null,Object? eligibilityRules = null,Object? requiredDocuments = null,Object? applicationOpensAt = freezed,Object? applicationClosesAt = freezed,Object? categories = null,Object? careerIds = null,Object? minClass = freezed,Object? maxClass = freezed,Object? amountDisclosed = null,Object? applyUrl = freezed,Object? applySteps = null,}) {
  return _then(_Opportunity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as OpportunityKind,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as LocalizedText,officialSourceName: null == officialSourceName ? _self.officialSourceName : officialSourceName // ignore: cast_nullable_to_non_nullable
as String,officialSourceUrl: null == officialSourceUrl ? _self.officialSourceUrl : officialSourceUrl // ignore: cast_nullable_to_non_nullable
as String,lastVerifiedAt: null == lastVerifiedAt ? _self.lastVerifiedAt : lastVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,eligibilityRules: null == eligibilityRules ? _self._eligibilityRules : eligibilityRules // ignore: cast_nullable_to_non_nullable
as List<EligibilityRule>,requiredDocuments: null == requiredDocuments ? _self._requiredDocuments : requiredDocuments // ignore: cast_nullable_to_non_nullable
as List<DocumentRequirement>,applicationOpensAt: freezed == applicationOpensAt ? _self.applicationOpensAt : applicationOpensAt // ignore: cast_nullable_to_non_nullable
as DateTime?,applicationClosesAt: freezed == applicationClosesAt ? _self.applicationClosesAt : applicationClosesAt // ignore: cast_nullable_to_non_nullable
as DateTime?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,careerIds: null == careerIds ? _self._careerIds : careerIds // ignore: cast_nullable_to_non_nullable
as List<String>,minClass: freezed == minClass ? _self.minClass : minClass // ignore: cast_nullable_to_non_nullable
as int?,maxClass: freezed == maxClass ? _self.maxClass : maxClass // ignore: cast_nullable_to_non_nullable
as int?,amountDisclosed: null == amountDisclosed ? _self.amountDisclosed : amountDisclosed // ignore: cast_nullable_to_non_nullable
as bool,applyUrl: freezed == applyUrl ? _self.applyUrl : applyUrl // ignore: cast_nullable_to_non_nullable
as String?,applySteps: null == applySteps ? _self._applySteps : applySteps // ignore: cast_nullable_to_non_nullable
as List<LocalizedText>,
  ));
}

/// Create a copy of Opportunity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get title {
  
  return $LocalizedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Opportunity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get summary {
  
  return $LocalizedTextCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$EligibilityRule {

/// The stable identifier of this rule inside its opportunity.
 String get id;/// The profile field the rule inspects.
 EligibilityField get field;/// The comparison the rule performs.
 EligibilityOperator get operator;/// The values the rule compares against.
 List<String> get values;/// The reason shown when the rule fails.
 String get reasonKey;/// Whether failing this rule blocks the whole opportunity.
 bool get isBlocking;
/// Create a copy of EligibilityRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EligibilityRuleCopyWith<EligibilityRule> get copyWith => _$EligibilityRuleCopyWithImpl<EligibilityRule>(this as EligibilityRule, _$identity);

  /// Serializes this EligibilityRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EligibilityRule&&(identical(other.id, id) || other.id == id)&&(identical(other.field, field) || other.field == field)&&(identical(other.operator, operator) || other.operator == operator)&&const DeepCollectionEquality().equals(other.values, values)&&(identical(other.reasonKey, reasonKey) || other.reasonKey == reasonKey)&&(identical(other.isBlocking, isBlocking) || other.isBlocking == isBlocking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,field,operator,const DeepCollectionEquality().hash(values),reasonKey,isBlocking);

@override
String toString() {
  return 'EligibilityRule(id: $id, field: $field, operator: $operator, values: $values, reasonKey: $reasonKey, isBlocking: $isBlocking)';
}


}

/// @nodoc
abstract mixin class $EligibilityRuleCopyWith<$Res>  {
  factory $EligibilityRuleCopyWith(EligibilityRule value, $Res Function(EligibilityRule) _then) = _$EligibilityRuleCopyWithImpl;
@useResult
$Res call({
 String id, EligibilityField field, EligibilityOperator operator, List<String> values, String reasonKey, bool isBlocking
});




}
/// @nodoc
class _$EligibilityRuleCopyWithImpl<$Res>
    implements $EligibilityRuleCopyWith<$Res> {
  _$EligibilityRuleCopyWithImpl(this._self, this._then);

  final EligibilityRule _self;
  final $Res Function(EligibilityRule) _then;

/// Create a copy of EligibilityRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? field = null,Object? operator = null,Object? values = null,Object? reasonKey = null,Object? isBlocking = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as EligibilityField,operator: null == operator ? _self.operator : operator // ignore: cast_nullable_to_non_nullable
as EligibilityOperator,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<String>,reasonKey: null == reasonKey ? _self.reasonKey : reasonKey // ignore: cast_nullable_to_non_nullable
as String,isBlocking: null == isBlocking ? _self.isBlocking : isBlocking // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EligibilityRule].
extension EligibilityRulePatterns on EligibilityRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EligibilityRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EligibilityRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EligibilityRule value)  $default,){
final _that = this;
switch (_that) {
case _EligibilityRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EligibilityRule value)?  $default,){
final _that = this;
switch (_that) {
case _EligibilityRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  EligibilityField field,  EligibilityOperator operator,  List<String> values,  String reasonKey,  bool isBlocking)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EligibilityRule() when $default != null:
return $default(_that.id,_that.field,_that.operator,_that.values,_that.reasonKey,_that.isBlocking);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  EligibilityField field,  EligibilityOperator operator,  List<String> values,  String reasonKey,  bool isBlocking)  $default,) {final _that = this;
switch (_that) {
case _EligibilityRule():
return $default(_that.id,_that.field,_that.operator,_that.values,_that.reasonKey,_that.isBlocking);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  EligibilityField field,  EligibilityOperator operator,  List<String> values,  String reasonKey,  bool isBlocking)?  $default,) {final _that = this;
switch (_that) {
case _EligibilityRule() when $default != null:
return $default(_that.id,_that.field,_that.operator,_that.values,_that.reasonKey,_that.isBlocking);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EligibilityRule implements EligibilityRule {
  const _EligibilityRule({required this.id, required this.field, required this.operator, final  List<String> values = const <String>[], required this.reasonKey, this.isBlocking = true}): _values = values;
  factory _EligibilityRule.fromJson(Map<String, dynamic> json) => _$EligibilityRuleFromJson(json);

/// The stable identifier of this rule inside its opportunity.
@override final  String id;
/// The profile field the rule inspects.
@override final  EligibilityField field;
/// The comparison the rule performs.
@override final  EligibilityOperator operator;
/// The values the rule compares against.
 final  List<String> _values;
/// The values the rule compares against.
@override@JsonKey() List<String> get values {
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_values);
}

/// The reason shown when the rule fails.
@override final  String reasonKey;
/// Whether failing this rule blocks the whole opportunity.
@override@JsonKey() final  bool isBlocking;

/// Create a copy of EligibilityRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EligibilityRuleCopyWith<_EligibilityRule> get copyWith => __$EligibilityRuleCopyWithImpl<_EligibilityRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EligibilityRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EligibilityRule&&(identical(other.id, id) || other.id == id)&&(identical(other.field, field) || other.field == field)&&(identical(other.operator, operator) || other.operator == operator)&&const DeepCollectionEquality().equals(other._values, _values)&&(identical(other.reasonKey, reasonKey) || other.reasonKey == reasonKey)&&(identical(other.isBlocking, isBlocking) || other.isBlocking == isBlocking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,field,operator,const DeepCollectionEquality().hash(_values),reasonKey,isBlocking);

@override
String toString() {
  return 'EligibilityRule(id: $id, field: $field, operator: $operator, values: $values, reasonKey: $reasonKey, isBlocking: $isBlocking)';
}


}

/// @nodoc
abstract mixin class _$EligibilityRuleCopyWith<$Res> implements $EligibilityRuleCopyWith<$Res> {
  factory _$EligibilityRuleCopyWith(_EligibilityRule value, $Res Function(_EligibilityRule) _then) = __$EligibilityRuleCopyWithImpl;
@override @useResult
$Res call({
 String id, EligibilityField field, EligibilityOperator operator, List<String> values, String reasonKey, bool isBlocking
});




}
/// @nodoc
class __$EligibilityRuleCopyWithImpl<$Res>
    implements _$EligibilityRuleCopyWith<$Res> {
  __$EligibilityRuleCopyWithImpl(this._self, this._then);

  final _EligibilityRule _self;
  final $Res Function(_EligibilityRule) _then;

/// Create a copy of EligibilityRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? field = null,Object? operator = null,Object? values = null,Object? reasonKey = null,Object? isBlocking = null,}) {
  return _then(_EligibilityRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as EligibilityField,operator: null == operator ? _self.operator : operator // ignore: cast_nullable_to_non_nullable
as EligibilityOperator,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<String>,reasonKey: null == reasonKey ? _self.reasonKey : reasonKey // ignore: cast_nullable_to_non_nullable
as String,isBlocking: null == isBlocking ? _self.isBlocking : isBlocking // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$DocumentRequirement {

/// The stable identifier.
 String get id;/// The name of the document.
 LocalizedText get label;/// Where and how to get it.
 LocalizedText get whereToGet;/// Whether the application cannot proceed without it.
 bool get isMandatory;/// The careers this document is needed for.
 List<String> get careerIds;
/// Create a copy of DocumentRequirement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentRequirementCopyWith<DocumentRequirement> get copyWith => _$DocumentRequirementCopyWithImpl<DocumentRequirement>(this as DocumentRequirement, _$identity);

  /// Serializes this DocumentRequirement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentRequirement&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.whereToGet, whereToGet) || other.whereToGet == whereToGet)&&(identical(other.isMandatory, isMandatory) || other.isMandatory == isMandatory)&&const DeepCollectionEquality().equals(other.careerIds, careerIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,whereToGet,isMandatory,const DeepCollectionEquality().hash(careerIds));

@override
String toString() {
  return 'DocumentRequirement(id: $id, label: $label, whereToGet: $whereToGet, isMandatory: $isMandatory, careerIds: $careerIds)';
}


}

/// @nodoc
abstract mixin class $DocumentRequirementCopyWith<$Res>  {
  factory $DocumentRequirementCopyWith(DocumentRequirement value, $Res Function(DocumentRequirement) _then) = _$DocumentRequirementCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText label, LocalizedText whereToGet, bool isMandatory, List<String> careerIds
});


$LocalizedTextCopyWith<$Res> get label;$LocalizedTextCopyWith<$Res> get whereToGet;

}
/// @nodoc
class _$DocumentRequirementCopyWithImpl<$Res>
    implements $DocumentRequirementCopyWith<$Res> {
  _$DocumentRequirementCopyWithImpl(this._self, this._then);

  final DocumentRequirement _self;
  final $Res Function(DocumentRequirement) _then;

/// Create a copy of DocumentRequirement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? whereToGet = null,Object? isMandatory = null,Object? careerIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,whereToGet: null == whereToGet ? _self.whereToGet : whereToGet // ignore: cast_nullable_to_non_nullable
as LocalizedText,isMandatory: null == isMandatory ? _self.isMandatory : isMandatory // ignore: cast_nullable_to_non_nullable
as bool,careerIds: null == careerIds ? _self.careerIds : careerIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of DocumentRequirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get label {
  
  return $LocalizedTextCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}/// Create a copy of DocumentRequirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get whereToGet {
  
  return $LocalizedTextCopyWith<$Res>(_self.whereToGet, (value) {
    return _then(_self.copyWith(whereToGet: value));
  });
}
}


/// Adds pattern-matching-related methods to [DocumentRequirement].
extension DocumentRequirementPatterns on DocumentRequirement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentRequirement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentRequirement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentRequirement value)  $default,){
final _that = this;
switch (_that) {
case _DocumentRequirement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentRequirement value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentRequirement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText label,  LocalizedText whereToGet,  bool isMandatory,  List<String> careerIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentRequirement() when $default != null:
return $default(_that.id,_that.label,_that.whereToGet,_that.isMandatory,_that.careerIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText label,  LocalizedText whereToGet,  bool isMandatory,  List<String> careerIds)  $default,) {final _that = this;
switch (_that) {
case _DocumentRequirement():
return $default(_that.id,_that.label,_that.whereToGet,_that.isMandatory,_that.careerIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText label,  LocalizedText whereToGet,  bool isMandatory,  List<String> careerIds)?  $default,) {final _that = this;
switch (_that) {
case _DocumentRequirement() when $default != null:
return $default(_that.id,_that.label,_that.whereToGet,_that.isMandatory,_that.careerIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentRequirement implements DocumentRequirement {
  const _DocumentRequirement({required this.id, required this.label, required this.whereToGet, required this.isMandatory, final  List<String> careerIds = const <String>[]}): _careerIds = careerIds;
  factory _DocumentRequirement.fromJson(Map<String, dynamic> json) => _$DocumentRequirementFromJson(json);

/// The stable identifier.
@override final  String id;
/// The name of the document.
@override final  LocalizedText label;
/// Where and how to get it.
@override final  LocalizedText whereToGet;
/// Whether the application cannot proceed without it.
@override final  bool isMandatory;
/// The careers this document is needed for.
 final  List<String> _careerIds;
/// The careers this document is needed for.
@override@JsonKey() List<String> get careerIds {
  if (_careerIds is EqualUnmodifiableListView) return _careerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_careerIds);
}


/// Create a copy of DocumentRequirement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentRequirementCopyWith<_DocumentRequirement> get copyWith => __$DocumentRequirementCopyWithImpl<_DocumentRequirement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentRequirementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentRequirement&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.whereToGet, whereToGet) || other.whereToGet == whereToGet)&&(identical(other.isMandatory, isMandatory) || other.isMandatory == isMandatory)&&const DeepCollectionEquality().equals(other._careerIds, _careerIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,whereToGet,isMandatory,const DeepCollectionEquality().hash(_careerIds));

@override
String toString() {
  return 'DocumentRequirement(id: $id, label: $label, whereToGet: $whereToGet, isMandatory: $isMandatory, careerIds: $careerIds)';
}


}

/// @nodoc
abstract mixin class _$DocumentRequirementCopyWith<$Res> implements $DocumentRequirementCopyWith<$Res> {
  factory _$DocumentRequirementCopyWith(_DocumentRequirement value, $Res Function(_DocumentRequirement) _then) = __$DocumentRequirementCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText label, LocalizedText whereToGet, bool isMandatory, List<String> careerIds
});


@override $LocalizedTextCopyWith<$Res> get label;@override $LocalizedTextCopyWith<$Res> get whereToGet;

}
/// @nodoc
class __$DocumentRequirementCopyWithImpl<$Res>
    implements _$DocumentRequirementCopyWith<$Res> {
  __$DocumentRequirementCopyWithImpl(this._self, this._then);

  final _DocumentRequirement _self;
  final $Res Function(_DocumentRequirement) _then;

/// Create a copy of DocumentRequirement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? whereToGet = null,Object? isMandatory = null,Object? careerIds = null,}) {
  return _then(_DocumentRequirement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,whereToGet: null == whereToGet ? _self.whereToGet : whereToGet // ignore: cast_nullable_to_non_nullable
as LocalizedText,isMandatory: null == isMandatory ? _self.isMandatory : isMandatory // ignore: cast_nullable_to_non_nullable
as bool,careerIds: null == careerIds ? _self._careerIds : careerIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of DocumentRequirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get label {
  
  return $LocalizedTextCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}/// Create a copy of DocumentRequirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get whereToGet {
  
  return $LocalizedTextCopyWith<$Res>(_self.whereToGet, (value) {
    return _then(_self.copyWith(whereToGet: value));
  });
}
}

// dart format on
