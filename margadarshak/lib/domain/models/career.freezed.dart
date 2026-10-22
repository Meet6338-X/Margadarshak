// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'career.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Career {

/// The stable identifier.
 String get id;/// The career name.
 LocalizedText get title;/// A one or two line description.
 LocalizedText get summary;/// A broad grouping such as `agriculture`, `health`, `trades`, `digital`.
 String get category;/// The education path that leads here, from the student's current stage.
 List<String> get educationPath;/// Interest tags that make this career a good match.
 List<String> get interestTags;/// Career ids that sit next to this one in a similar family of work.
 List<String> get relatedCareerIds;/// The first concrete steps a student can take.
 List<LocalizedText> get entrySteps;/// Whether this is a non-STEM path.
 bool get nonStem;/// Whether this career builds on a local or traditional skill.
 bool get localTraditionalSkill;
/// Create a copy of Career
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CareerCopyWith<Career> get copyWith => _$CareerCopyWithImpl<Career>(this as Career, _$identity);

  /// Serializes this Career to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Career&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.educationPath, educationPath)&&const DeepCollectionEquality().equals(other.interestTags, interestTags)&&const DeepCollectionEquality().equals(other.relatedCareerIds, relatedCareerIds)&&const DeepCollectionEquality().equals(other.entrySteps, entrySteps)&&(identical(other.nonStem, nonStem) || other.nonStem == nonStem)&&(identical(other.localTraditionalSkill, localTraditionalSkill) || other.localTraditionalSkill == localTraditionalSkill));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,category,const DeepCollectionEquality().hash(educationPath),const DeepCollectionEquality().hash(interestTags),const DeepCollectionEquality().hash(relatedCareerIds),const DeepCollectionEquality().hash(entrySteps),nonStem,localTraditionalSkill);

@override
String toString() {
  return 'Career(id: $id, title: $title, summary: $summary, category: $category, educationPath: $educationPath, interestTags: $interestTags, relatedCareerIds: $relatedCareerIds, entrySteps: $entrySteps, nonStem: $nonStem, localTraditionalSkill: $localTraditionalSkill)';
}


}

/// @nodoc
abstract mixin class $CareerCopyWith<$Res>  {
  factory $CareerCopyWith(Career value, $Res Function(Career) _then) = _$CareerCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText title, LocalizedText summary, String category, List<String> educationPath, List<String> interestTags, List<String> relatedCareerIds, List<LocalizedText> entrySteps, bool nonStem, bool localTraditionalSkill
});


$LocalizedTextCopyWith<$Res> get title;$LocalizedTextCopyWith<$Res> get summary;

}
/// @nodoc
class _$CareerCopyWithImpl<$Res>
    implements $CareerCopyWith<$Res> {
  _$CareerCopyWithImpl(this._self, this._then);

  final Career _self;
  final $Res Function(Career) _then;

/// Create a copy of Career
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? category = null,Object? educationPath = null,Object? interestTags = null,Object? relatedCareerIds = null,Object? entrySteps = null,Object? nonStem = null,Object? localTraditionalSkill = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as LocalizedText,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,educationPath: null == educationPath ? _self.educationPath : educationPath // ignore: cast_nullable_to_non_nullable
as List<String>,interestTags: null == interestTags ? _self.interestTags : interestTags // ignore: cast_nullable_to_non_nullable
as List<String>,relatedCareerIds: null == relatedCareerIds ? _self.relatedCareerIds : relatedCareerIds // ignore: cast_nullable_to_non_nullable
as List<String>,entrySteps: null == entrySteps ? _self.entrySteps : entrySteps // ignore: cast_nullable_to_non_nullable
as List<LocalizedText>,nonStem: null == nonStem ? _self.nonStem : nonStem // ignore: cast_nullable_to_non_nullable
as bool,localTraditionalSkill: null == localTraditionalSkill ? _self.localTraditionalSkill : localTraditionalSkill // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Career
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get title {
  
  return $LocalizedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Career
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get summary {
  
  return $LocalizedTextCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [Career].
extension CareerPatterns on Career {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Career value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Career() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Career value)  $default,){
final _that = this;
switch (_that) {
case _Career():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Career value)?  $default,){
final _that = this;
switch (_that) {
case _Career() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText title,  LocalizedText summary,  String category,  List<String> educationPath,  List<String> interestTags,  List<String> relatedCareerIds,  List<LocalizedText> entrySteps,  bool nonStem,  bool localTraditionalSkill)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Career() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.category,_that.educationPath,_that.interestTags,_that.relatedCareerIds,_that.entrySteps,_that.nonStem,_that.localTraditionalSkill);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText title,  LocalizedText summary,  String category,  List<String> educationPath,  List<String> interestTags,  List<String> relatedCareerIds,  List<LocalizedText> entrySteps,  bool nonStem,  bool localTraditionalSkill)  $default,) {final _that = this;
switch (_that) {
case _Career():
return $default(_that.id,_that.title,_that.summary,_that.category,_that.educationPath,_that.interestTags,_that.relatedCareerIds,_that.entrySteps,_that.nonStem,_that.localTraditionalSkill);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText title,  LocalizedText summary,  String category,  List<String> educationPath,  List<String> interestTags,  List<String> relatedCareerIds,  List<LocalizedText> entrySteps,  bool nonStem,  bool localTraditionalSkill)?  $default,) {final _that = this;
switch (_that) {
case _Career() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.category,_that.educationPath,_that.interestTags,_that.relatedCareerIds,_that.entrySteps,_that.nonStem,_that.localTraditionalSkill);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Career implements Career {
  const _Career({required this.id, required this.title, required this.summary, required this.category, final  List<String> educationPath = const <String>[], final  List<String> interestTags = const <String>[], final  List<String> relatedCareerIds = const <String>[], final  List<LocalizedText> entrySteps = const <LocalizedText>[], required this.nonStem, required this.localTraditionalSkill}): _educationPath = educationPath,_interestTags = interestTags,_relatedCareerIds = relatedCareerIds,_entrySteps = entrySteps;
  factory _Career.fromJson(Map<String, dynamic> json) => _$CareerFromJson(json);

/// The stable identifier.
@override final  String id;
/// The career name.
@override final  LocalizedText title;
/// A one or two line description.
@override final  LocalizedText summary;
/// A broad grouping such as `agriculture`, `health`, `trades`, `digital`.
@override final  String category;
/// The education path that leads here, from the student's current stage.
 final  List<String> _educationPath;
/// The education path that leads here, from the student's current stage.
@override@JsonKey() List<String> get educationPath {
  if (_educationPath is EqualUnmodifiableListView) return _educationPath;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_educationPath);
}

/// Interest tags that make this career a good match.
 final  List<String> _interestTags;
/// Interest tags that make this career a good match.
@override@JsonKey() List<String> get interestTags {
  if (_interestTags is EqualUnmodifiableListView) return _interestTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interestTags);
}

/// Career ids that sit next to this one in a similar family of work.
 final  List<String> _relatedCareerIds;
/// Career ids that sit next to this one in a similar family of work.
@override@JsonKey() List<String> get relatedCareerIds {
  if (_relatedCareerIds is EqualUnmodifiableListView) return _relatedCareerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_relatedCareerIds);
}

/// The first concrete steps a student can take.
 final  List<LocalizedText> _entrySteps;
/// The first concrete steps a student can take.
@override@JsonKey() List<LocalizedText> get entrySteps {
  if (_entrySteps is EqualUnmodifiableListView) return _entrySteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entrySteps);
}

/// Whether this is a non-STEM path.
@override final  bool nonStem;
/// Whether this career builds on a local or traditional skill.
@override final  bool localTraditionalSkill;

/// Create a copy of Career
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CareerCopyWith<_Career> get copyWith => __$CareerCopyWithImpl<_Career>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CareerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Career&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._educationPath, _educationPath)&&const DeepCollectionEquality().equals(other._interestTags, _interestTags)&&const DeepCollectionEquality().equals(other._relatedCareerIds, _relatedCareerIds)&&const DeepCollectionEquality().equals(other._entrySteps, _entrySteps)&&(identical(other.nonStem, nonStem) || other.nonStem == nonStem)&&(identical(other.localTraditionalSkill, localTraditionalSkill) || other.localTraditionalSkill == localTraditionalSkill));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,category,const DeepCollectionEquality().hash(_educationPath),const DeepCollectionEquality().hash(_interestTags),const DeepCollectionEquality().hash(_relatedCareerIds),const DeepCollectionEquality().hash(_entrySteps),nonStem,localTraditionalSkill);

@override
String toString() {
  return 'Career(id: $id, title: $title, summary: $summary, category: $category, educationPath: $educationPath, interestTags: $interestTags, relatedCareerIds: $relatedCareerIds, entrySteps: $entrySteps, nonStem: $nonStem, localTraditionalSkill: $localTraditionalSkill)';
}


}

/// @nodoc
abstract mixin class _$CareerCopyWith<$Res> implements $CareerCopyWith<$Res> {
  factory _$CareerCopyWith(_Career value, $Res Function(_Career) _then) = __$CareerCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText title, LocalizedText summary, String category, List<String> educationPath, List<String> interestTags, List<String> relatedCareerIds, List<LocalizedText> entrySteps, bool nonStem, bool localTraditionalSkill
});


@override $LocalizedTextCopyWith<$Res> get title;@override $LocalizedTextCopyWith<$Res> get summary;

}
/// @nodoc
class __$CareerCopyWithImpl<$Res>
    implements _$CareerCopyWith<$Res> {
  __$CareerCopyWithImpl(this._self, this._then);

  final _Career _self;
  final $Res Function(_Career) _then;

/// Create a copy of Career
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? category = null,Object? educationPath = null,Object? interestTags = null,Object? relatedCareerIds = null,Object? entrySteps = null,Object? nonStem = null,Object? localTraditionalSkill = null,}) {
  return _then(_Career(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as LocalizedText,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,educationPath: null == educationPath ? _self._educationPath : educationPath // ignore: cast_nullable_to_non_nullable
as List<String>,interestTags: null == interestTags ? _self._interestTags : interestTags // ignore: cast_nullable_to_non_nullable
as List<String>,relatedCareerIds: null == relatedCareerIds ? _self._relatedCareerIds : relatedCareerIds // ignore: cast_nullable_to_non_nullable
as List<String>,entrySteps: null == entrySteps ? _self._entrySteps : entrySteps // ignore: cast_nullable_to_non_nullable
as List<LocalizedText>,nonStem: null == nonStem ? _self.nonStem : nonStem // ignore: cast_nullable_to_non_nullable
as bool,localTraditionalSkill: null == localTraditionalSkill ? _self.localTraditionalSkill : localTraditionalSkill // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Career
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get title {
  
  return $LocalizedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Career
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get summary {
  
  return $LocalizedTextCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
