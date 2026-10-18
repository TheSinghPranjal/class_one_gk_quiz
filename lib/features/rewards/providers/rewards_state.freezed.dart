// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rewards_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RewardsData {

 int get totalStars; Set<String> get badges; Set<String> get unlockedAccessories; int get streakDays; String? get lastPlayedDate;
/// Create a copy of RewardsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardsDataCopyWith<RewardsData> get copyWith => _$RewardsDataCopyWithImpl<RewardsData>(this as RewardsData, _$identity);

  /// Serializes this RewardsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardsData&&(identical(other.totalStars, totalStars) || other.totalStars == totalStars)&&const DeepCollectionEquality().equals(other.badges, badges)&&const DeepCollectionEquality().equals(other.unlockedAccessories, unlockedAccessories)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.lastPlayedDate, lastPlayedDate) || other.lastPlayedDate == lastPlayedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalStars,const DeepCollectionEquality().hash(badges),const DeepCollectionEquality().hash(unlockedAccessories),streakDays,lastPlayedDate);

@override
String toString() {
  return 'RewardsData(totalStars: $totalStars, badges: $badges, unlockedAccessories: $unlockedAccessories, streakDays: $streakDays, lastPlayedDate: $lastPlayedDate)';
}


}

/// @nodoc
abstract mixin class $RewardsDataCopyWith<$Res>  {
  factory $RewardsDataCopyWith(RewardsData value, $Res Function(RewardsData) _then) = _$RewardsDataCopyWithImpl;
@useResult
$Res call({
 int totalStars, Set<String> badges, Set<String> unlockedAccessories, int streakDays, String? lastPlayedDate
});




}
/// @nodoc
class _$RewardsDataCopyWithImpl<$Res>
    implements $RewardsDataCopyWith<$Res> {
  _$RewardsDataCopyWithImpl(this._self, this._then);

  final RewardsData _self;
  final $Res Function(RewardsData) _then;

/// Create a copy of RewardsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalStars = null,Object? badges = null,Object? unlockedAccessories = null,Object? streakDays = null,Object? lastPlayedDate = freezed,}) {
  return _then(_self.copyWith(
totalStars: null == totalStars ? _self.totalStars : totalStars // ignore: cast_nullable_to_non_nullable
as int,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as Set<String>,unlockedAccessories: null == unlockedAccessories ? _self.unlockedAccessories : unlockedAccessories // ignore: cast_nullable_to_non_nullable
as Set<String>,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,lastPlayedDate: freezed == lastPlayedDate ? _self.lastPlayedDate : lastPlayedDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RewardsData].
extension RewardsDataPatterns on RewardsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RewardsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RewardsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RewardsData value)  $default,){
final _that = this;
switch (_that) {
case _RewardsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RewardsData value)?  $default,){
final _that = this;
switch (_that) {
case _RewardsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalStars,  Set<String> badges,  Set<String> unlockedAccessories,  int streakDays,  String? lastPlayedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RewardsData() when $default != null:
return $default(_that.totalStars,_that.badges,_that.unlockedAccessories,_that.streakDays,_that.lastPlayedDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalStars,  Set<String> badges,  Set<String> unlockedAccessories,  int streakDays,  String? lastPlayedDate)  $default,) {final _that = this;
switch (_that) {
case _RewardsData():
return $default(_that.totalStars,_that.badges,_that.unlockedAccessories,_that.streakDays,_that.lastPlayedDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalStars,  Set<String> badges,  Set<String> unlockedAccessories,  int streakDays,  String? lastPlayedDate)?  $default,) {final _that = this;
switch (_that) {
case _RewardsData() when $default != null:
return $default(_that.totalStars,_that.badges,_that.unlockedAccessories,_that.streakDays,_that.lastPlayedDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RewardsData implements RewardsData {
  const _RewardsData({this.totalStars = 0, final  Set<String> badges = const <String>{}, final  Set<String> unlockedAccessories = const <String>{}, this.streakDays = 0, this.lastPlayedDate}): _badges = badges,_unlockedAccessories = unlockedAccessories;
  factory _RewardsData.fromJson(Map<String, dynamic> json) => _$RewardsDataFromJson(json);

@override@JsonKey() final  int totalStars;
 final  Set<String> _badges;
@override@JsonKey() Set<String> get badges {
  if (_badges is EqualUnmodifiableSetView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_badges);
}

 final  Set<String> _unlockedAccessories;
@override@JsonKey() Set<String> get unlockedAccessories {
  if (_unlockedAccessories is EqualUnmodifiableSetView) return _unlockedAccessories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_unlockedAccessories);
}

@override@JsonKey() final  int streakDays;
@override final  String? lastPlayedDate;

/// Create a copy of RewardsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardsDataCopyWith<_RewardsData> get copyWith => __$RewardsDataCopyWithImpl<_RewardsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RewardsData&&(identical(other.totalStars, totalStars) || other.totalStars == totalStars)&&const DeepCollectionEquality().equals(other._badges, _badges)&&const DeepCollectionEquality().equals(other._unlockedAccessories, _unlockedAccessories)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.lastPlayedDate, lastPlayedDate) || other.lastPlayedDate == lastPlayedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalStars,const DeepCollectionEquality().hash(_badges),const DeepCollectionEquality().hash(_unlockedAccessories),streakDays,lastPlayedDate);

@override
String toString() {
  return 'RewardsData(totalStars: $totalStars, badges: $badges, unlockedAccessories: $unlockedAccessories, streakDays: $streakDays, lastPlayedDate: $lastPlayedDate)';
}


}

/// @nodoc
abstract mixin class _$RewardsDataCopyWith<$Res> implements $RewardsDataCopyWith<$Res> {
  factory _$RewardsDataCopyWith(_RewardsData value, $Res Function(_RewardsData) _then) = __$RewardsDataCopyWithImpl;
@override @useResult
$Res call({
 int totalStars, Set<String> badges, Set<String> unlockedAccessories, int streakDays, String? lastPlayedDate
});




}
/// @nodoc
class __$RewardsDataCopyWithImpl<$Res>
    implements _$RewardsDataCopyWith<$Res> {
  __$RewardsDataCopyWithImpl(this._self, this._then);

  final _RewardsData _self;
  final $Res Function(_RewardsData) _then;

/// Create a copy of RewardsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalStars = null,Object? badges = null,Object? unlockedAccessories = null,Object? streakDays = null,Object? lastPlayedDate = freezed,}) {
  return _then(_RewardsData(
totalStars: null == totalStars ? _self.totalStars : totalStars // ignore: cast_nullable_to_non_nullable
as int,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as Set<String>,unlockedAccessories: null == unlockedAccessories ? _self._unlockedAccessories : unlockedAccessories // ignore: cast_nullable_to_non_nullable
as Set<String>,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,lastPlayedDate: freezed == lastPlayedDate ? _self.lastPlayedDate : lastPlayedDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
