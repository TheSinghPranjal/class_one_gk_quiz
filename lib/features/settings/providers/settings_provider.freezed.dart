// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsData {

 bool get soundOn; bool get autoReadAloud; double get speechSpeed; bool get timerOn; int get questionsPerQuiz; bool get bookOnlyMode;
/// Create a copy of SettingsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsDataCopyWith<SettingsData> get copyWith => _$SettingsDataCopyWithImpl<SettingsData>(this as SettingsData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsData&&(identical(other.soundOn, soundOn) || other.soundOn == soundOn)&&(identical(other.autoReadAloud, autoReadAloud) || other.autoReadAloud == autoReadAloud)&&(identical(other.speechSpeed, speechSpeed) || other.speechSpeed == speechSpeed)&&(identical(other.timerOn, timerOn) || other.timerOn == timerOn)&&(identical(other.questionsPerQuiz, questionsPerQuiz) || other.questionsPerQuiz == questionsPerQuiz)&&(identical(other.bookOnlyMode, bookOnlyMode) || other.bookOnlyMode == bookOnlyMode));
}


@override
int get hashCode => Object.hash(runtimeType,soundOn,autoReadAloud,speechSpeed,timerOn,questionsPerQuiz,bookOnlyMode);

@override
String toString() {
  return 'SettingsData(soundOn: $soundOn, autoReadAloud: $autoReadAloud, speechSpeed: $speechSpeed, timerOn: $timerOn, questionsPerQuiz: $questionsPerQuiz, bookOnlyMode: $bookOnlyMode)';
}


}

/// @nodoc
abstract mixin class $SettingsDataCopyWith<$Res>  {
  factory $SettingsDataCopyWith(SettingsData value, $Res Function(SettingsData) _then) = _$SettingsDataCopyWithImpl;
@useResult
$Res call({
 bool soundOn, bool autoReadAloud, double speechSpeed, bool timerOn, int questionsPerQuiz, bool bookOnlyMode
});




}
/// @nodoc
class _$SettingsDataCopyWithImpl<$Res>
    implements $SettingsDataCopyWith<$Res> {
  _$SettingsDataCopyWithImpl(this._self, this._then);

  final SettingsData _self;
  final $Res Function(SettingsData) _then;

/// Create a copy of SettingsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? soundOn = null,Object? autoReadAloud = null,Object? speechSpeed = null,Object? timerOn = null,Object? questionsPerQuiz = null,Object? bookOnlyMode = null,}) {
  return _then(_self.copyWith(
soundOn: null == soundOn ? _self.soundOn : soundOn // ignore: cast_nullable_to_non_nullable
as bool,autoReadAloud: null == autoReadAloud ? _self.autoReadAloud : autoReadAloud // ignore: cast_nullable_to_non_nullable
as bool,speechSpeed: null == speechSpeed ? _self.speechSpeed : speechSpeed // ignore: cast_nullable_to_non_nullable
as double,timerOn: null == timerOn ? _self.timerOn : timerOn // ignore: cast_nullable_to_non_nullable
as bool,questionsPerQuiz: null == questionsPerQuiz ? _self.questionsPerQuiz : questionsPerQuiz // ignore: cast_nullable_to_non_nullable
as int,bookOnlyMode: null == bookOnlyMode ? _self.bookOnlyMode : bookOnlyMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsData].
extension SettingsDataPatterns on SettingsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsData value)  $default,){
final _that = this;
switch (_that) {
case _SettingsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsData value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool soundOn,  bool autoReadAloud,  double speechSpeed,  bool timerOn,  int questionsPerQuiz,  bool bookOnlyMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsData() when $default != null:
return $default(_that.soundOn,_that.autoReadAloud,_that.speechSpeed,_that.timerOn,_that.questionsPerQuiz,_that.bookOnlyMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool soundOn,  bool autoReadAloud,  double speechSpeed,  bool timerOn,  int questionsPerQuiz,  bool bookOnlyMode)  $default,) {final _that = this;
switch (_that) {
case _SettingsData():
return $default(_that.soundOn,_that.autoReadAloud,_that.speechSpeed,_that.timerOn,_that.questionsPerQuiz,_that.bookOnlyMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool soundOn,  bool autoReadAloud,  double speechSpeed,  bool timerOn,  int questionsPerQuiz,  bool bookOnlyMode)?  $default,) {final _that = this;
switch (_that) {
case _SettingsData() when $default != null:
return $default(_that.soundOn,_that.autoReadAloud,_that.speechSpeed,_that.timerOn,_that.questionsPerQuiz,_that.bookOnlyMode);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsData implements SettingsData {
  const _SettingsData({this.soundOn = true, this.autoReadAloud = false, this.speechSpeed = 0.45, this.timerOn = true, this.questionsPerQuiz = 10, this.bookOnlyMode = false});
  

@override@JsonKey() final  bool soundOn;
@override@JsonKey() final  bool autoReadAloud;
@override@JsonKey() final  double speechSpeed;
@override@JsonKey() final  bool timerOn;
@override@JsonKey() final  int questionsPerQuiz;
@override@JsonKey() final  bool bookOnlyMode;

/// Create a copy of SettingsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsDataCopyWith<_SettingsData> get copyWith => __$SettingsDataCopyWithImpl<_SettingsData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsData&&(identical(other.soundOn, soundOn) || other.soundOn == soundOn)&&(identical(other.autoReadAloud, autoReadAloud) || other.autoReadAloud == autoReadAloud)&&(identical(other.speechSpeed, speechSpeed) || other.speechSpeed == speechSpeed)&&(identical(other.timerOn, timerOn) || other.timerOn == timerOn)&&(identical(other.questionsPerQuiz, questionsPerQuiz) || other.questionsPerQuiz == questionsPerQuiz)&&(identical(other.bookOnlyMode, bookOnlyMode) || other.bookOnlyMode == bookOnlyMode));
}


@override
int get hashCode => Object.hash(runtimeType,soundOn,autoReadAloud,speechSpeed,timerOn,questionsPerQuiz,bookOnlyMode);

@override
String toString() {
  return 'SettingsData(soundOn: $soundOn, autoReadAloud: $autoReadAloud, speechSpeed: $speechSpeed, timerOn: $timerOn, questionsPerQuiz: $questionsPerQuiz, bookOnlyMode: $bookOnlyMode)';
}


}

/// @nodoc
abstract mixin class _$SettingsDataCopyWith<$Res> implements $SettingsDataCopyWith<$Res> {
  factory _$SettingsDataCopyWith(_SettingsData value, $Res Function(_SettingsData) _then) = __$SettingsDataCopyWithImpl;
@override @useResult
$Res call({
 bool soundOn, bool autoReadAloud, double speechSpeed, bool timerOn, int questionsPerQuiz, bool bookOnlyMode
});




}
/// @nodoc
class __$SettingsDataCopyWithImpl<$Res>
    implements _$SettingsDataCopyWith<$Res> {
  __$SettingsDataCopyWithImpl(this._self, this._then);

  final _SettingsData _self;
  final $Res Function(_SettingsData) _then;

/// Create a copy of SettingsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? soundOn = null,Object? autoReadAloud = null,Object? speechSpeed = null,Object? timerOn = null,Object? questionsPerQuiz = null,Object? bookOnlyMode = null,}) {
  return _then(_SettingsData(
soundOn: null == soundOn ? _self.soundOn : soundOn // ignore: cast_nullable_to_non_nullable
as bool,autoReadAloud: null == autoReadAloud ? _self.autoReadAloud : autoReadAloud // ignore: cast_nullable_to_non_nullable
as bool,speechSpeed: null == speechSpeed ? _self.speechSpeed : speechSpeed // ignore: cast_nullable_to_non_nullable
as double,timerOn: null == timerOn ? _self.timerOn : timerOn // ignore: cast_nullable_to_non_nullable
as bool,questionsPerQuiz: null == questionsPerQuiz ? _self.questionsPerQuiz : questionsPerQuiz // ignore: cast_nullable_to_non_nullable
as int,bookOnlyMode: null == bookOnlyMode ? _self.bookOnlyMode : bookOnlyMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
