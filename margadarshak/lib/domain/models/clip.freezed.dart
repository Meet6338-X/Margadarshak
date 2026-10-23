// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Clip {

/// The stable identifier.
 String get id;/// The clip title.
 LocalizedText get title;/// A one line summary of what the clip covers.
 LocalizedText get summary;/// How long the clip runs, in seconds.
 int get durationSeconds;/// The language code the clip is spoken in, `mr` or `hi`.
 String get language;/// The text of each slide, shown next to the voice.
 List<String> get slides;/// Tags used to pick clips that match the student's interests.
 List<String> get tags;/// Career ids this clip is about.
 List<String> get careerIds;/// The stable position of this clip inside the whole catalogue.
 int get order;
/// Create a copy of Clip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClipCopyWith<Clip> get copyWith => _$ClipCopyWithImpl<Clip>(this as Clip, _$identity);

  /// Serializes this Clip to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Clip&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other.slides, slides)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.careerIds, careerIds)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,durationSeconds,language,const DeepCollectionEquality().hash(slides),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(careerIds),order);

@override
String toString() {
  return 'Clip(id: $id, title: $title, summary: $summary, durationSeconds: $durationSeconds, language: $language, slides: $slides, tags: $tags, careerIds: $careerIds, order: $order)';
}


}

/// @nodoc
abstract mixin class $ClipCopyWith<$Res>  {
  factory $ClipCopyWith(Clip value, $Res Function(Clip) _then) = _$ClipCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText title, LocalizedText summary, int durationSeconds, String language, List<String> slides, List<String> tags, List<String> careerIds, int order
});


$LocalizedTextCopyWith<$Res> get title;$LocalizedTextCopyWith<$Res> get summary;

}
/// @nodoc
class _$ClipCopyWithImpl<$Res>
    implements $ClipCopyWith<$Res> {
  _$ClipCopyWithImpl(this._self, this._then);

  final Clip _self;
  final $Res Function(Clip) _then;

/// Create a copy of Clip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? durationSeconds = null,Object? language = null,Object? slides = null,Object? tags = null,Object? careerIds = null,Object? order = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as LocalizedText,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,slides: null == slides ? _self.slides : slides // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,careerIds: null == careerIds ? _self.careerIds : careerIds // ignore: cast_nullable_to_non_nullable
as List<String>,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Clip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get title {
  
  return $LocalizedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Clip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get summary {
  
  return $LocalizedTextCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [Clip].
extension ClipPatterns on Clip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Clip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Clip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Clip value)  $default,){
final _that = this;
switch (_that) {
case _Clip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Clip value)?  $default,){
final _that = this;
switch (_that) {
case _Clip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText title,  LocalizedText summary,  int durationSeconds,  String language,  List<String> slides,  List<String> tags,  List<String> careerIds,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Clip() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.durationSeconds,_that.language,_that.slides,_that.tags,_that.careerIds,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText title,  LocalizedText summary,  int durationSeconds,  String language,  List<String> slides,  List<String> tags,  List<String> careerIds,  int order)  $default,) {final _that = this;
switch (_that) {
case _Clip():
return $default(_that.id,_that.title,_that.summary,_that.durationSeconds,_that.language,_that.slides,_that.tags,_that.careerIds,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText title,  LocalizedText summary,  int durationSeconds,  String language,  List<String> slides,  List<String> tags,  List<String> careerIds,  int order)?  $default,) {final _that = this;
switch (_that) {
case _Clip() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.durationSeconds,_that.language,_that.slides,_that.tags,_that.careerIds,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Clip implements Clip {
  const _Clip({required this.id, required this.title, required this.summary, required this.durationSeconds, required this.language, final  List<String> slides = const <String>[], final  List<String> tags = const <String>[], final  List<String> careerIds = const <String>[], required this.order}): _slides = slides,_tags = tags,_careerIds = careerIds;
  factory _Clip.fromJson(Map<String, dynamic> json) => _$ClipFromJson(json);

/// The stable identifier.
@override final  String id;
/// The clip title.
@override final  LocalizedText title;
/// A one line summary of what the clip covers.
@override final  LocalizedText summary;
/// How long the clip runs, in seconds.
@override final  int durationSeconds;
/// The language code the clip is spoken in, `mr` or `hi`.
@override final  String language;
/// The text of each slide, shown next to the voice.
 final  List<String> _slides;
/// The text of each slide, shown next to the voice.
@override@JsonKey() List<String> get slides {
  if (_slides is EqualUnmodifiableListView) return _slides;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slides);
}

/// Tags used to pick clips that match the student's interests.
 final  List<String> _tags;
/// Tags used to pick clips that match the student's interests.
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

/// Career ids this clip is about.
 final  List<String> _careerIds;
/// Career ids this clip is about.
@override@JsonKey() List<String> get careerIds {
  if (_careerIds is EqualUnmodifiableListView) return _careerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_careerIds);
}

/// The stable position of this clip inside the whole catalogue.
@override final  int order;

/// Create a copy of Clip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClipCopyWith<_Clip> get copyWith => __$ClipCopyWithImpl<_Clip>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClipToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Clip&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other._slides, _slides)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._careerIds, _careerIds)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,durationSeconds,language,const DeepCollectionEquality().hash(_slides),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_careerIds),order);

@override
String toString() {
  return 'Clip(id: $id, title: $title, summary: $summary, durationSeconds: $durationSeconds, language: $language, slides: $slides, tags: $tags, careerIds: $careerIds, order: $order)';
}


}

/// @nodoc
abstract mixin class _$ClipCopyWith<$Res> implements $ClipCopyWith<$Res> {
  factory _$ClipCopyWith(_Clip value, $Res Function(_Clip) _then) = __$ClipCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText title, LocalizedText summary, int durationSeconds, String language, List<String> slides, List<String> tags, List<String> careerIds, int order
});


@override $LocalizedTextCopyWith<$Res> get title;@override $LocalizedTextCopyWith<$Res> get summary;

}
/// @nodoc
class __$ClipCopyWithImpl<$Res>
    implements _$ClipCopyWith<$Res> {
  __$ClipCopyWithImpl(this._self, this._then);

  final _Clip _self;
  final $Res Function(_Clip) _then;

/// Create a copy of Clip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? durationSeconds = null,Object? language = null,Object? slides = null,Object? tags = null,Object? careerIds = null,Object? order = null,}) {
  return _then(_Clip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as LocalizedText,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,slides: null == slides ? _self._slides : slides // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,careerIds: null == careerIds ? _self._careerIds : careerIds // ignore: cast_nullable_to_non_nullable
as List<String>,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Clip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get title {
  
  return $LocalizedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Clip
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
