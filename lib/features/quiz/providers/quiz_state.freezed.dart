// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizState {

 QuizMode get mode; List<ShuffledQuestion> get questions; int get currentIndex; int? get selectedIndex; QuizAnswerStatus get status; Set<int> get eliminatedOptions; bool get hintUsedForQuestion; int get score; List<String> get wrongQuestionIds; int? get secondsLeft; List<String> get newlyUnlockedBadges;
/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizStateCopyWith<QuizState> get copyWith => _$QuizStateCopyWithImpl<QuizState>(this as QuizState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizState&&(identical(other.mode, mode) || other.mode == mode)&&const DeepCollectionEquality().equals(other.questions, questions)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.eliminatedOptions, eliminatedOptions)&&(identical(other.hintUsedForQuestion, hintUsedForQuestion) || other.hintUsedForQuestion == hintUsedForQuestion)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other.wrongQuestionIds, wrongQuestionIds)&&(identical(other.secondsLeft, secondsLeft) || other.secondsLeft == secondsLeft)&&const DeepCollectionEquality().equals(other.newlyUnlockedBadges, newlyUnlockedBadges));
}


@override
int get hashCode => Object.hash(runtimeType,mode,const DeepCollectionEquality().hash(questions),currentIndex,selectedIndex,status,const DeepCollectionEquality().hash(eliminatedOptions),hintUsedForQuestion,score,const DeepCollectionEquality().hash(wrongQuestionIds),secondsLeft,const DeepCollectionEquality().hash(newlyUnlockedBadges));

@override
String toString() {
  return 'QuizState(mode: $mode, questions: $questions, currentIndex: $currentIndex, selectedIndex: $selectedIndex, status: $status, eliminatedOptions: $eliminatedOptions, hintUsedForQuestion: $hintUsedForQuestion, score: $score, wrongQuestionIds: $wrongQuestionIds, secondsLeft: $secondsLeft, newlyUnlockedBadges: $newlyUnlockedBadges)';
}


}

/// @nodoc
abstract mixin class $QuizStateCopyWith<$Res>  {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) _then) = _$QuizStateCopyWithImpl;
@useResult
$Res call({
 QuizMode mode, List<ShuffledQuestion> questions, int currentIndex, int? selectedIndex, QuizAnswerStatus status, Set<int> eliminatedOptions, bool hintUsedForQuestion, int score, List<String> wrongQuestionIds, int? secondsLeft, List<String> newlyUnlockedBadges
});




}
/// @nodoc
class _$QuizStateCopyWithImpl<$Res>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._self, this._then);

  final QuizState _self;
  final $Res Function(QuizState) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? questions = null,Object? currentIndex = null,Object? selectedIndex = freezed,Object? status = null,Object? eliminatedOptions = null,Object? hintUsedForQuestion = null,Object? score = null,Object? wrongQuestionIds = null,Object? secondsLeft = freezed,Object? newlyUnlockedBadges = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as QuizMode,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<ShuffledQuestion>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,selectedIndex: freezed == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuizAnswerStatus,eliminatedOptions: null == eliminatedOptions ? _self.eliminatedOptions : eliminatedOptions // ignore: cast_nullable_to_non_nullable
as Set<int>,hintUsedForQuestion: null == hintUsedForQuestion ? _self.hintUsedForQuestion : hintUsedForQuestion // ignore: cast_nullable_to_non_nullable
as bool,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,wrongQuestionIds: null == wrongQuestionIds ? _self.wrongQuestionIds : wrongQuestionIds // ignore: cast_nullable_to_non_nullable
as List<String>,secondsLeft: freezed == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int?,newlyUnlockedBadges: null == newlyUnlockedBadges ? _self.newlyUnlockedBadges : newlyUnlockedBadges // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizState].
extension QuizStatePatterns on QuizState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizState value)  $default,){
final _that = this;
switch (_that) {
case _QuizState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizState value)?  $default,){
final _that = this;
switch (_that) {
case _QuizState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QuizMode mode,  List<ShuffledQuestion> questions,  int currentIndex,  int? selectedIndex,  QuizAnswerStatus status,  Set<int> eliminatedOptions,  bool hintUsedForQuestion,  int score,  List<String> wrongQuestionIds,  int? secondsLeft,  List<String> newlyUnlockedBadges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that.mode,_that.questions,_that.currentIndex,_that.selectedIndex,_that.status,_that.eliminatedOptions,_that.hintUsedForQuestion,_that.score,_that.wrongQuestionIds,_that.secondsLeft,_that.newlyUnlockedBadges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QuizMode mode,  List<ShuffledQuestion> questions,  int currentIndex,  int? selectedIndex,  QuizAnswerStatus status,  Set<int> eliminatedOptions,  bool hintUsedForQuestion,  int score,  List<String> wrongQuestionIds,  int? secondsLeft,  List<String> newlyUnlockedBadges)  $default,) {final _that = this;
switch (_that) {
case _QuizState():
return $default(_that.mode,_that.questions,_that.currentIndex,_that.selectedIndex,_that.status,_that.eliminatedOptions,_that.hintUsedForQuestion,_that.score,_that.wrongQuestionIds,_that.secondsLeft,_that.newlyUnlockedBadges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QuizMode mode,  List<ShuffledQuestion> questions,  int currentIndex,  int? selectedIndex,  QuizAnswerStatus status,  Set<int> eliminatedOptions,  bool hintUsedForQuestion,  int score,  List<String> wrongQuestionIds,  int? secondsLeft,  List<String> newlyUnlockedBadges)?  $default,) {final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that.mode,_that.questions,_that.currentIndex,_that.selectedIndex,_that.status,_that.eliminatedOptions,_that.hintUsedForQuestion,_that.score,_that.wrongQuestionIds,_that.secondsLeft,_that.newlyUnlockedBadges);case _:
  return null;

}
}

}

/// @nodoc


class _QuizState extends QuizState {
  const _QuizState({required this.mode, required final  List<ShuffledQuestion> questions, this.currentIndex = 0, this.selectedIndex, this.status = QuizAnswerStatus.answering, final  Set<int> eliminatedOptions = const <int>{}, this.hintUsedForQuestion = false, this.score = 0, final  List<String> wrongQuestionIds = const <String>[], this.secondsLeft, final  List<String> newlyUnlockedBadges = const <String>[]}): _questions = questions,_eliminatedOptions = eliminatedOptions,_wrongQuestionIds = wrongQuestionIds,_newlyUnlockedBadges = newlyUnlockedBadges,super._();
  

@override final  QuizMode mode;
 final  List<ShuffledQuestion> _questions;
@override List<ShuffledQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

@override@JsonKey() final  int currentIndex;
@override final  int? selectedIndex;
@override@JsonKey() final  QuizAnswerStatus status;
 final  Set<int> _eliminatedOptions;
@override@JsonKey() Set<int> get eliminatedOptions {
  if (_eliminatedOptions is EqualUnmodifiableSetView) return _eliminatedOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_eliminatedOptions);
}

@override@JsonKey() final  bool hintUsedForQuestion;
@override@JsonKey() final  int score;
 final  List<String> _wrongQuestionIds;
@override@JsonKey() List<String> get wrongQuestionIds {
  if (_wrongQuestionIds is EqualUnmodifiableListView) return _wrongQuestionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wrongQuestionIds);
}

@override final  int? secondsLeft;
 final  List<String> _newlyUnlockedBadges;
@override@JsonKey() List<String> get newlyUnlockedBadges {
  if (_newlyUnlockedBadges is EqualUnmodifiableListView) return _newlyUnlockedBadges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newlyUnlockedBadges);
}


/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizStateCopyWith<_QuizState> get copyWith => __$QuizStateCopyWithImpl<_QuizState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizState&&(identical(other.mode, mode) || other.mode == mode)&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._eliminatedOptions, _eliminatedOptions)&&(identical(other.hintUsedForQuestion, hintUsedForQuestion) || other.hintUsedForQuestion == hintUsedForQuestion)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other._wrongQuestionIds, _wrongQuestionIds)&&(identical(other.secondsLeft, secondsLeft) || other.secondsLeft == secondsLeft)&&const DeepCollectionEquality().equals(other._newlyUnlockedBadges, _newlyUnlockedBadges));
}


@override
int get hashCode => Object.hash(runtimeType,mode,const DeepCollectionEquality().hash(_questions),currentIndex,selectedIndex,status,const DeepCollectionEquality().hash(_eliminatedOptions),hintUsedForQuestion,score,const DeepCollectionEquality().hash(_wrongQuestionIds),secondsLeft,const DeepCollectionEquality().hash(_newlyUnlockedBadges));

@override
String toString() {
  return 'QuizState(mode: $mode, questions: $questions, currentIndex: $currentIndex, selectedIndex: $selectedIndex, status: $status, eliminatedOptions: $eliminatedOptions, hintUsedForQuestion: $hintUsedForQuestion, score: $score, wrongQuestionIds: $wrongQuestionIds, secondsLeft: $secondsLeft, newlyUnlockedBadges: $newlyUnlockedBadges)';
}


}

/// @nodoc
abstract mixin class _$QuizStateCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$QuizStateCopyWith(_QuizState value, $Res Function(_QuizState) _then) = __$QuizStateCopyWithImpl;
@override @useResult
$Res call({
 QuizMode mode, List<ShuffledQuestion> questions, int currentIndex, int? selectedIndex, QuizAnswerStatus status, Set<int> eliminatedOptions, bool hintUsedForQuestion, int score, List<String> wrongQuestionIds, int? secondsLeft, List<String> newlyUnlockedBadges
});




}
/// @nodoc
class __$QuizStateCopyWithImpl<$Res>
    implements _$QuizStateCopyWith<$Res> {
  __$QuizStateCopyWithImpl(this._self, this._then);

  final _QuizState _self;
  final $Res Function(_QuizState) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? questions = null,Object? currentIndex = null,Object? selectedIndex = freezed,Object? status = null,Object? eliminatedOptions = null,Object? hintUsedForQuestion = null,Object? score = null,Object? wrongQuestionIds = null,Object? secondsLeft = freezed,Object? newlyUnlockedBadges = null,}) {
  return _then(_QuizState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as QuizMode,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<ShuffledQuestion>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,selectedIndex: freezed == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuizAnswerStatus,eliminatedOptions: null == eliminatedOptions ? _self._eliminatedOptions : eliminatedOptions // ignore: cast_nullable_to_non_nullable
as Set<int>,hintUsedForQuestion: null == hintUsedForQuestion ? _self.hintUsedForQuestion : hintUsedForQuestion // ignore: cast_nullable_to_non_nullable
as bool,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,wrongQuestionIds: null == wrongQuestionIds ? _self._wrongQuestionIds : wrongQuestionIds // ignore: cast_nullable_to_non_nullable
as List<String>,secondsLeft: freezed == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int?,newlyUnlockedBadges: null == newlyUnlockedBadges ? _self._newlyUnlockedBadges : newlyUnlockedBadges // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
