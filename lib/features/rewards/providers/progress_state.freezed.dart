// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SectionProgress {

 Set<String> get masteredQuestionIds; int get correctCount; int get attemptCount; int get bestStars;
/// Create a copy of SectionProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionProgressCopyWith<SectionProgress> get copyWith => _$SectionProgressCopyWithImpl<SectionProgress>(this as SectionProgress, _$identity);

  /// Serializes this SectionProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionProgress&&const DeepCollectionEquality().equals(other.masteredQuestionIds, masteredQuestionIds)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.attemptCount, attemptCount) || other.attemptCount == attemptCount)&&(identical(other.bestStars, bestStars) || other.bestStars == bestStars));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(masteredQuestionIds),correctCount,attemptCount,bestStars);

@override
String toString() {
  return 'SectionProgress(masteredQuestionIds: $masteredQuestionIds, correctCount: $correctCount, attemptCount: $attemptCount, bestStars: $bestStars)';
}


}

/// @nodoc
abstract mixin class $SectionProgressCopyWith<$Res>  {
  factory $SectionProgressCopyWith(SectionProgress value, $Res Function(SectionProgress) _then) = _$SectionProgressCopyWithImpl;
@useResult
$Res call({
 Set<String> masteredQuestionIds, int correctCount, int attemptCount, int bestStars
});




}
/// @nodoc
class _$SectionProgressCopyWithImpl<$Res>
    implements $SectionProgressCopyWith<$Res> {
  _$SectionProgressCopyWithImpl(this._self, this._then);

  final SectionProgress _self;
  final $Res Function(SectionProgress) _then;

/// Create a copy of SectionProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? masteredQuestionIds = null,Object? correctCount = null,Object? attemptCount = null,Object? bestStars = null,}) {
  return _then(_self.copyWith(
masteredQuestionIds: null == masteredQuestionIds ? _self.masteredQuestionIds : masteredQuestionIds // ignore: cast_nullable_to_non_nullable
as Set<String>,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,attemptCount: null == attemptCount ? _self.attemptCount : attemptCount // ignore: cast_nullable_to_non_nullable
as int,bestStars: null == bestStars ? _self.bestStars : bestStars // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SectionProgress].
extension SectionProgressPatterns on SectionProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionProgress value)  $default,){
final _that = this;
switch (_that) {
case _SectionProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionProgress value)?  $default,){
final _that = this;
switch (_that) {
case _SectionProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<String> masteredQuestionIds,  int correctCount,  int attemptCount,  int bestStars)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionProgress() when $default != null:
return $default(_that.masteredQuestionIds,_that.correctCount,_that.attemptCount,_that.bestStars);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<String> masteredQuestionIds,  int correctCount,  int attemptCount,  int bestStars)  $default,) {final _that = this;
switch (_that) {
case _SectionProgress():
return $default(_that.masteredQuestionIds,_that.correctCount,_that.attemptCount,_that.bestStars);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<String> masteredQuestionIds,  int correctCount,  int attemptCount,  int bestStars)?  $default,) {final _that = this;
switch (_that) {
case _SectionProgress() when $default != null:
return $default(_that.masteredQuestionIds,_that.correctCount,_that.attemptCount,_that.bestStars);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SectionProgress implements SectionProgress {
  const _SectionProgress({final  Set<String> masteredQuestionIds = const <String>{}, this.correctCount = 0, this.attemptCount = 0, this.bestStars = 0}): _masteredQuestionIds = masteredQuestionIds;
  factory _SectionProgress.fromJson(Map<String, dynamic> json) => _$SectionProgressFromJson(json);

 final  Set<String> _masteredQuestionIds;
@override@JsonKey() Set<String> get masteredQuestionIds {
  if (_masteredQuestionIds is EqualUnmodifiableSetView) return _masteredQuestionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_masteredQuestionIds);
}

@override@JsonKey() final  int correctCount;
@override@JsonKey() final  int attemptCount;
@override@JsonKey() final  int bestStars;

/// Create a copy of SectionProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionProgressCopyWith<_SectionProgress> get copyWith => __$SectionProgressCopyWithImpl<_SectionProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectionProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionProgress&&const DeepCollectionEquality().equals(other._masteredQuestionIds, _masteredQuestionIds)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.attemptCount, attemptCount) || other.attemptCount == attemptCount)&&(identical(other.bestStars, bestStars) || other.bestStars == bestStars));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_masteredQuestionIds),correctCount,attemptCount,bestStars);

@override
String toString() {
  return 'SectionProgress(masteredQuestionIds: $masteredQuestionIds, correctCount: $correctCount, attemptCount: $attemptCount, bestStars: $bestStars)';
}


}

/// @nodoc
abstract mixin class _$SectionProgressCopyWith<$Res> implements $SectionProgressCopyWith<$Res> {
  factory _$SectionProgressCopyWith(_SectionProgress value, $Res Function(_SectionProgress) _then) = __$SectionProgressCopyWithImpl;
@override @useResult
$Res call({
 Set<String> masteredQuestionIds, int correctCount, int attemptCount, int bestStars
});




}
/// @nodoc
class __$SectionProgressCopyWithImpl<$Res>
    implements _$SectionProgressCopyWith<$Res> {
  __$SectionProgressCopyWithImpl(this._self, this._then);

  final _SectionProgress _self;
  final $Res Function(_SectionProgress) _then;

/// Create a copy of SectionProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? masteredQuestionIds = null,Object? correctCount = null,Object? attemptCount = null,Object? bestStars = null,}) {
  return _then(_SectionProgress(
masteredQuestionIds: null == masteredQuestionIds ? _self._masteredQuestionIds : masteredQuestionIds // ignore: cast_nullable_to_non_nullable
as Set<String>,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,attemptCount: null == attemptCount ? _self.attemptCount : attemptCount // ignore: cast_nullable_to_non_nullable
as int,bestStars: null == bestStars ? _self.bestStars : bestStars // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WrongAnswerEntry {

 String get questionId; String get sectionId; int get timesWrong;
/// Create a copy of WrongAnswerEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WrongAnswerEntryCopyWith<WrongAnswerEntry> get copyWith => _$WrongAnswerEntryCopyWithImpl<WrongAnswerEntry>(this as WrongAnswerEntry, _$identity);

  /// Serializes this WrongAnswerEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WrongAnswerEntry&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.timesWrong, timesWrong) || other.timesWrong == timesWrong));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,sectionId,timesWrong);

@override
String toString() {
  return 'WrongAnswerEntry(questionId: $questionId, sectionId: $sectionId, timesWrong: $timesWrong)';
}


}

/// @nodoc
abstract mixin class $WrongAnswerEntryCopyWith<$Res>  {
  factory $WrongAnswerEntryCopyWith(WrongAnswerEntry value, $Res Function(WrongAnswerEntry) _then) = _$WrongAnswerEntryCopyWithImpl;
@useResult
$Res call({
 String questionId, String sectionId, int timesWrong
});




}
/// @nodoc
class _$WrongAnswerEntryCopyWithImpl<$Res>
    implements $WrongAnswerEntryCopyWith<$Res> {
  _$WrongAnswerEntryCopyWithImpl(this._self, this._then);

  final WrongAnswerEntry _self;
  final $Res Function(WrongAnswerEntry) _then;

/// Create a copy of WrongAnswerEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? sectionId = null,Object? timesWrong = null,}) {
  return _then(_self.copyWith(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,timesWrong: null == timesWrong ? _self.timesWrong : timesWrong // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WrongAnswerEntry].
extension WrongAnswerEntryPatterns on WrongAnswerEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WrongAnswerEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WrongAnswerEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WrongAnswerEntry value)  $default,){
final _that = this;
switch (_that) {
case _WrongAnswerEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WrongAnswerEntry value)?  $default,){
final _that = this;
switch (_that) {
case _WrongAnswerEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String questionId,  String sectionId,  int timesWrong)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WrongAnswerEntry() when $default != null:
return $default(_that.questionId,_that.sectionId,_that.timesWrong);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String questionId,  String sectionId,  int timesWrong)  $default,) {final _that = this;
switch (_that) {
case _WrongAnswerEntry():
return $default(_that.questionId,_that.sectionId,_that.timesWrong);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String questionId,  String sectionId,  int timesWrong)?  $default,) {final _that = this;
switch (_that) {
case _WrongAnswerEntry() when $default != null:
return $default(_that.questionId,_that.sectionId,_that.timesWrong);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WrongAnswerEntry implements WrongAnswerEntry {
  const _WrongAnswerEntry({required this.questionId, required this.sectionId, this.timesWrong = 0});
  factory _WrongAnswerEntry.fromJson(Map<String, dynamic> json) => _$WrongAnswerEntryFromJson(json);

@override final  String questionId;
@override final  String sectionId;
@override@JsonKey() final  int timesWrong;

/// Create a copy of WrongAnswerEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WrongAnswerEntryCopyWith<_WrongAnswerEntry> get copyWith => __$WrongAnswerEntryCopyWithImpl<_WrongAnswerEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WrongAnswerEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WrongAnswerEntry&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.timesWrong, timesWrong) || other.timesWrong == timesWrong));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,sectionId,timesWrong);

@override
String toString() {
  return 'WrongAnswerEntry(questionId: $questionId, sectionId: $sectionId, timesWrong: $timesWrong)';
}


}

/// @nodoc
abstract mixin class _$WrongAnswerEntryCopyWith<$Res> implements $WrongAnswerEntryCopyWith<$Res> {
  factory _$WrongAnswerEntryCopyWith(_WrongAnswerEntry value, $Res Function(_WrongAnswerEntry) _then) = __$WrongAnswerEntryCopyWithImpl;
@override @useResult
$Res call({
 String questionId, String sectionId, int timesWrong
});




}
/// @nodoc
class __$WrongAnswerEntryCopyWithImpl<$Res>
    implements _$WrongAnswerEntryCopyWith<$Res> {
  __$WrongAnswerEntryCopyWithImpl(this._self, this._then);

  final _WrongAnswerEntry _self;
  final $Res Function(_WrongAnswerEntry) _then;

/// Create a copy of WrongAnswerEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionId = null,Object? sectionId = null,Object? timesWrong = null,}) {
  return _then(_WrongAnswerEntry(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,timesWrong: null == timesWrong ? _self.timesWrong : timesWrong // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ProgressData {

 Map<String, SectionProgress> get bySection; Map<String, WrongAnswerEntry> get wrongAnswers;
/// Create a copy of ProgressData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressDataCopyWith<ProgressData> get copyWith => _$ProgressDataCopyWithImpl<ProgressData>(this as ProgressData, _$identity);

  /// Serializes this ProgressData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressData&&const DeepCollectionEquality().equals(other.bySection, bySection)&&const DeepCollectionEquality().equals(other.wrongAnswers, wrongAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bySection),const DeepCollectionEquality().hash(wrongAnswers));

@override
String toString() {
  return 'ProgressData(bySection: $bySection, wrongAnswers: $wrongAnswers)';
}


}

/// @nodoc
abstract mixin class $ProgressDataCopyWith<$Res>  {
  factory $ProgressDataCopyWith(ProgressData value, $Res Function(ProgressData) _then) = _$ProgressDataCopyWithImpl;
@useResult
$Res call({
 Map<String, SectionProgress> bySection, Map<String, WrongAnswerEntry> wrongAnswers
});




}
/// @nodoc
class _$ProgressDataCopyWithImpl<$Res>
    implements $ProgressDataCopyWith<$Res> {
  _$ProgressDataCopyWithImpl(this._self, this._then);

  final ProgressData _self;
  final $Res Function(ProgressData) _then;

/// Create a copy of ProgressData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bySection = null,Object? wrongAnswers = null,}) {
  return _then(_self.copyWith(
bySection: null == bySection ? _self.bySection : bySection // ignore: cast_nullable_to_non_nullable
as Map<String, SectionProgress>,wrongAnswers: null == wrongAnswers ? _self.wrongAnswers : wrongAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, WrongAnswerEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressData].
extension ProgressDataPatterns on ProgressData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressData value)  $default,){
final _that = this;
switch (_that) {
case _ProgressData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressData value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, SectionProgress> bySection,  Map<String, WrongAnswerEntry> wrongAnswers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressData() when $default != null:
return $default(_that.bySection,_that.wrongAnswers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, SectionProgress> bySection,  Map<String, WrongAnswerEntry> wrongAnswers)  $default,) {final _that = this;
switch (_that) {
case _ProgressData():
return $default(_that.bySection,_that.wrongAnswers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, SectionProgress> bySection,  Map<String, WrongAnswerEntry> wrongAnswers)?  $default,) {final _that = this;
switch (_that) {
case _ProgressData() when $default != null:
return $default(_that.bySection,_that.wrongAnswers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgressData extends ProgressData {
  const _ProgressData({final  Map<String, SectionProgress> bySection = const <String, SectionProgress>{}, final  Map<String, WrongAnswerEntry> wrongAnswers = const <String, WrongAnswerEntry>{}}): _bySection = bySection,_wrongAnswers = wrongAnswers,super._();
  factory _ProgressData.fromJson(Map<String, dynamic> json) => _$ProgressDataFromJson(json);

 final  Map<String, SectionProgress> _bySection;
@override@JsonKey() Map<String, SectionProgress> get bySection {
  if (_bySection is EqualUnmodifiableMapView) return _bySection;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_bySection);
}

 final  Map<String, WrongAnswerEntry> _wrongAnswers;
@override@JsonKey() Map<String, WrongAnswerEntry> get wrongAnswers {
  if (_wrongAnswers is EqualUnmodifiableMapView) return _wrongAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_wrongAnswers);
}


/// Create a copy of ProgressData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressDataCopyWith<_ProgressData> get copyWith => __$ProgressDataCopyWithImpl<_ProgressData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressData&&const DeepCollectionEquality().equals(other._bySection, _bySection)&&const DeepCollectionEquality().equals(other._wrongAnswers, _wrongAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bySection),const DeepCollectionEquality().hash(_wrongAnswers));

@override
String toString() {
  return 'ProgressData(bySection: $bySection, wrongAnswers: $wrongAnswers)';
}


}

/// @nodoc
abstract mixin class _$ProgressDataCopyWith<$Res> implements $ProgressDataCopyWith<$Res> {
  factory _$ProgressDataCopyWith(_ProgressData value, $Res Function(_ProgressData) _then) = __$ProgressDataCopyWithImpl;
@override @useResult
$Res call({
 Map<String, SectionProgress> bySection, Map<String, WrongAnswerEntry> wrongAnswers
});




}
/// @nodoc
class __$ProgressDataCopyWithImpl<$Res>
    implements _$ProgressDataCopyWith<$Res> {
  __$ProgressDataCopyWithImpl(this._self, this._then);

  final _ProgressData _self;
  final $Res Function(_ProgressData) _then;

/// Create a copy of ProgressData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bySection = null,Object? wrongAnswers = null,}) {
  return _then(_ProgressData(
bySection: null == bySection ? _self._bySection : bySection // ignore: cast_nullable_to_non_nullable
as Map<String, SectionProgress>,wrongAnswers: null == wrongAnswers ? _self._wrongAnswers : wrongAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, WrongAnswerEntry>,
  ));
}


}

// dart format on
