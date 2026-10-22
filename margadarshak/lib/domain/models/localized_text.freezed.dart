// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localized_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalizedText {

/// The English text, always present.
 String get en;/// The Hindi text.
 String? get hi;/// The Marathi text.
 String? get mr;
/// Create a copy of LocalizedText
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<LocalizedText> get copyWith => _$LocalizedTextCopyWithImpl<LocalizedText>(this as LocalizedText, _$identity);

  /// Serializes this LocalizedText to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizedText&&(identical(other.en, en) || other.en == en)&&(identical(other.hi, hi) || other.hi == hi)&&(identical(other.mr, mr) || other.mr == mr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,en,hi,mr);

@override
String toString() {
  return 'LocalizedText(en: $en, hi: $hi, mr: $mr)';
}


}

/// @nodoc
abstract mixin class $LocalizedTextCopyWith<$Res>  {
  factory $LocalizedTextCopyWith(LocalizedText value, $Res Function(LocalizedText) _then) = _$LocalizedTextCopyWithImpl;
@useResult
$Res call({
 String en, String? hi, String? mr
});




}
/// @nodoc
class _$LocalizedTextCopyWithImpl<$Res>
    implements $LocalizedTextCopyWith<$Res> {
  _$LocalizedTextCopyWithImpl(this._self, this._then);

  final LocalizedText _self;
  final $Res Function(LocalizedText) _then;

/// Create a copy of LocalizedText
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? en = null,Object? hi = freezed,Object? mr = freezed,}) {
  return _then(_self.copyWith(
en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,hi: freezed == hi ? _self.hi : hi // ignore: cast_nullable_to_non_nullable
as String?,mr: freezed == mr ? _self.mr : mr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalizedText].
extension LocalizedTextPatterns on LocalizedText {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalizedText value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalizedText() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalizedText value)  $default,){
final _that = this;
switch (_that) {
case _LocalizedText():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalizedText value)?  $default,){
final _that = this;
switch (_that) {
case _LocalizedText() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String en,  String? hi,  String? mr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalizedText() when $default != null:
return $default(_that.en,_that.hi,_that.mr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String en,  String? hi,  String? mr)  $default,) {final _that = this;
switch (_that) {
case _LocalizedText():
return $default(_that.en,_that.hi,_that.mr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String en,  String? hi,  String? mr)?  $default,) {final _that = this;
switch (_that) {
case _LocalizedText() when $default != null:
return $default(_that.en,_that.hi,_that.mr);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalizedText implements LocalizedText {
  const _LocalizedText({required this.en, this.hi, this.mr});
  factory _LocalizedText.fromJson(Map<String, dynamic> json) => _$LocalizedTextFromJson(json);

/// The English text, always present.
@override final  String en;
/// The Hindi text.
@override final  String? hi;
/// The Marathi text.
@override final  String? mr;

/// Create a copy of LocalizedText
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizedTextCopyWith<_LocalizedText> get copyWith => __$LocalizedTextCopyWithImpl<_LocalizedText>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalizedTextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizedText&&(identical(other.en, en) || other.en == en)&&(identical(other.hi, hi) || other.hi == hi)&&(identical(other.mr, mr) || other.mr == mr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,en,hi,mr);

@override
String toString() {
  return 'LocalizedText(en: $en, hi: $hi, mr: $mr)';
}


}

/// @nodoc
abstract mixin class _$LocalizedTextCopyWith<$Res> implements $LocalizedTextCopyWith<$Res> {
  factory _$LocalizedTextCopyWith(_LocalizedText value, $Res Function(_LocalizedText) _then) = __$LocalizedTextCopyWithImpl;
@override @useResult
$Res call({
 String en, String? hi, String? mr
});




}
/// @nodoc
class __$LocalizedTextCopyWithImpl<$Res>
    implements _$LocalizedTextCopyWith<$Res> {
  __$LocalizedTextCopyWithImpl(this._self, this._then);

  final _LocalizedText _self;
  final $Res Function(_LocalizedText) _then;

/// Create a copy of LocalizedText
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? en = null,Object? hi = freezed,Object? mr = freezed,}) {
  return _then(_LocalizedText(
en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,hi: freezed == hi ? _self.hi : hi // ignore: cast_nullable_to_non_nullable
as String?,mr: freezed == mr ? _self.mr : mr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
