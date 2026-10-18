// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Question {

 String get id; String get sectionId; String get question; String? get emoji; List<String> get options; List<String>? get optionEmojis; int get correctIndex; String get funFact; int get difficulty; QuestionSource get source; int? get page;
/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionCopyWith<Question> get copyWith => _$QuestionCopyWithImpl<Question>(this as Question, _$identity);

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Question&&(identical(other.id, id) || other.id == id)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.question, question) || other.question == question)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.optionEmojis, optionEmojis)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex)&&(identical(other.funFact, funFact) || other.funFact == funFact)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.source, source) || other.source == source)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sectionId,question,emoji,const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(optionEmojis),correctIndex,funFact,difficulty,source,page);

@override
String toString() {
  return 'Question(id: $id, sectionId: $sectionId, question: $question, emoji: $emoji, options: $options, optionEmojis: $optionEmojis, correctIndex: $correctIndex, funFact: $funFact, difficulty: $difficulty, source: $source, page: $page)';
}


}

/// @nodoc
abstract mixin class $QuestionCopyWith<$Res>  {
  factory $QuestionCopyWith(Question value, $Res Function(Question) _then) = _$QuestionCopyWithImpl;
@useResult
$Res call({
 String id, String sectionId, String question, String? emoji, List<String> options, List<String>? optionEmojis, int correctIndex, String funFact, int difficulty, QuestionSource source, int? page
});




}
/// @nodoc
class _$QuestionCopyWithImpl<$Res>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._self, this._then);

  final Question _self;
  final $Res Function(Question) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sectionId = null,Object? question = null,Object? emoji = freezed,Object? options = null,Object? optionEmojis = freezed,Object? correctIndex = null,Object? funFact = null,Object? difficulty = null,Object? source = null,Object? page = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,optionEmojis: freezed == optionEmojis ? _self.optionEmojis : optionEmojis // ignore: cast_nullable_to_non_nullable
as List<String>?,correctIndex: null == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,funFact: null == funFact ? _self.funFact : funFact // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as QuestionSource,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Question].
extension QuestionPatterns on Question {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Question value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Question() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Question value)  $default,){
final _that = this;
switch (_that) {
case _Question():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Question value)?  $default,){
final _that = this;
switch (_that) {
case _Question() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sectionId,  String question,  String? emoji,  List<String> options,  List<String>? optionEmojis,  int correctIndex,  String funFact,  int difficulty,  QuestionSource source,  int? page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that.id,_that.sectionId,_that.question,_that.emoji,_that.options,_that.optionEmojis,_that.correctIndex,_that.funFact,_that.difficulty,_that.source,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sectionId,  String question,  String? emoji,  List<String> options,  List<String>? optionEmojis,  int correctIndex,  String funFact,  int difficulty,  QuestionSource source,  int? page)  $default,) {final _that = this;
switch (_that) {
case _Question():
return $default(_that.id,_that.sectionId,_that.question,_that.emoji,_that.options,_that.optionEmojis,_that.correctIndex,_that.funFact,_that.difficulty,_that.source,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sectionId,  String question,  String? emoji,  List<String> options,  List<String>? optionEmojis,  int correctIndex,  String funFact,  int difficulty,  QuestionSource source,  int? page)?  $default,) {final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that.id,_that.sectionId,_that.question,_that.emoji,_that.options,_that.optionEmojis,_that.correctIndex,_that.funFact,_that.difficulty,_that.source,_that.page);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Question implements Question {
  const _Question({required this.id, required this.sectionId, required this.question, this.emoji, required final  List<String> options, final  List<String>? optionEmojis, required this.correctIndex, required this.funFact, required this.difficulty, required this.source, this.page}): _options = options,_optionEmojis = optionEmojis;
  factory _Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

@override final  String id;
@override final  String sectionId;
@override final  String question;
@override final  String? emoji;
 final  List<String> _options;
@override List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

 final  List<String>? _optionEmojis;
@override List<String>? get optionEmojis {
  final value = _optionEmojis;
  if (value == null) return null;
  if (_optionEmojis is EqualUnmodifiableListView) return _optionEmojis;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int correctIndex;
@override final  String funFact;
@override final  int difficulty;
@override final  QuestionSource source;
@override final  int? page;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionCopyWith<_Question> get copyWith => __$QuestionCopyWithImpl<_Question>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Question&&(identical(other.id, id) || other.id == id)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.question, question) || other.question == question)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other._optionEmojis, _optionEmojis)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex)&&(identical(other.funFact, funFact) || other.funFact == funFact)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.source, source) || other.source == source)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sectionId,question,emoji,const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(_optionEmojis),correctIndex,funFact,difficulty,source,page);

@override
String toString() {
  return 'Question(id: $id, sectionId: $sectionId, question: $question, emoji: $emoji, options: $options, optionEmojis: $optionEmojis, correctIndex: $correctIndex, funFact: $funFact, difficulty: $difficulty, source: $source, page: $page)';
}


}

/// @nodoc
abstract mixin class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) _then) = __$QuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String sectionId, String question, String? emoji, List<String> options, List<String>? optionEmojis, int correctIndex, String funFact, int difficulty, QuestionSource source, int? page
});




}
/// @nodoc
class __$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(this._self, this._then);

  final _Question _self;
  final $Res Function(_Question) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sectionId = null,Object? question = null,Object? emoji = freezed,Object? options = null,Object? optionEmojis = freezed,Object? correctIndex = null,Object? funFact = null,Object? difficulty = null,Object? source = null,Object? page = freezed,}) {
  return _then(_Question(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,optionEmojis: freezed == optionEmojis ? _self._optionEmojis : optionEmojis // ignore: cast_nullable_to_non_nullable
as List<String>?,correctIndex: null == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,funFact: null == funFact ? _self.funFact : funFact // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as QuestionSource,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$ShuffledQuestion {

 Question get question; List<String> get shuffledOptions; List<String>? get shuffledOptionEmojis; int get correctIndex;
/// Create a copy of ShuffledQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShuffledQuestionCopyWith<ShuffledQuestion> get copyWith => _$ShuffledQuestionCopyWithImpl<ShuffledQuestion>(this as ShuffledQuestion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShuffledQuestion&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.shuffledOptions, shuffledOptions)&&const DeepCollectionEquality().equals(other.shuffledOptionEmojis, shuffledOptionEmojis)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex));
}


@override
int get hashCode => Object.hash(runtimeType,question,const DeepCollectionEquality().hash(shuffledOptions),const DeepCollectionEquality().hash(shuffledOptionEmojis),correctIndex);

@override
String toString() {
  return 'ShuffledQuestion(question: $question, shuffledOptions: $shuffledOptions, shuffledOptionEmojis: $shuffledOptionEmojis, correctIndex: $correctIndex)';
}


}

/// @nodoc
abstract mixin class $ShuffledQuestionCopyWith<$Res>  {
  factory $ShuffledQuestionCopyWith(ShuffledQuestion value, $Res Function(ShuffledQuestion) _then) = _$ShuffledQuestionCopyWithImpl;
@useResult
$Res call({
 Question question, List<String> shuffledOptions, List<String>? shuffledOptionEmojis, int correctIndex
});


$QuestionCopyWith<$Res> get question;

}
/// @nodoc
class _$ShuffledQuestionCopyWithImpl<$Res>
    implements $ShuffledQuestionCopyWith<$Res> {
  _$ShuffledQuestionCopyWithImpl(this._self, this._then);

  final ShuffledQuestion _self;
  final $Res Function(ShuffledQuestion) _then;

/// Create a copy of ShuffledQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? shuffledOptions = null,Object? shuffledOptionEmojis = freezed,Object? correctIndex = null,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Question,shuffledOptions: null == shuffledOptions ? _self.shuffledOptions : shuffledOptions // ignore: cast_nullable_to_non_nullable
as List<String>,shuffledOptionEmojis: freezed == shuffledOptionEmojis ? _self.shuffledOptionEmojis : shuffledOptionEmojis // ignore: cast_nullable_to_non_nullable
as List<String>?,correctIndex: null == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ShuffledQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res> get question {
  
  return $QuestionCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShuffledQuestion].
extension ShuffledQuestionPatterns on ShuffledQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShuffledQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShuffledQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShuffledQuestion value)  $default,){
final _that = this;
switch (_that) {
case _ShuffledQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShuffledQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _ShuffledQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Question question,  List<String> shuffledOptions,  List<String>? shuffledOptionEmojis,  int correctIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShuffledQuestion() when $default != null:
return $default(_that.question,_that.shuffledOptions,_that.shuffledOptionEmojis,_that.correctIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Question question,  List<String> shuffledOptions,  List<String>? shuffledOptionEmojis,  int correctIndex)  $default,) {final _that = this;
switch (_that) {
case _ShuffledQuestion():
return $default(_that.question,_that.shuffledOptions,_that.shuffledOptionEmojis,_that.correctIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Question question,  List<String> shuffledOptions,  List<String>? shuffledOptionEmojis,  int correctIndex)?  $default,) {final _that = this;
switch (_that) {
case _ShuffledQuestion() when $default != null:
return $default(_that.question,_that.shuffledOptions,_that.shuffledOptionEmojis,_that.correctIndex);case _:
  return null;

}
}

}

/// @nodoc


class _ShuffledQuestion implements ShuffledQuestion {
  const _ShuffledQuestion({required this.question, required final  List<String> shuffledOptions, final  List<String>? shuffledOptionEmojis, required this.correctIndex}): _shuffledOptions = shuffledOptions,_shuffledOptionEmojis = shuffledOptionEmojis;
  

@override final  Question question;
 final  List<String> _shuffledOptions;
@override List<String> get shuffledOptions {
  if (_shuffledOptions is EqualUnmodifiableListView) return _shuffledOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shuffledOptions);
}

 final  List<String>? _shuffledOptionEmojis;
@override List<String>? get shuffledOptionEmojis {
  final value = _shuffledOptionEmojis;
  if (value == null) return null;
  if (_shuffledOptionEmojis is EqualUnmodifiableListView) return _shuffledOptionEmojis;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int correctIndex;

/// Create a copy of ShuffledQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShuffledQuestionCopyWith<_ShuffledQuestion> get copyWith => __$ShuffledQuestionCopyWithImpl<_ShuffledQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShuffledQuestion&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._shuffledOptions, _shuffledOptions)&&const DeepCollectionEquality().equals(other._shuffledOptionEmojis, _shuffledOptionEmojis)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex));
}


@override
int get hashCode => Object.hash(runtimeType,question,const DeepCollectionEquality().hash(_shuffledOptions),const DeepCollectionEquality().hash(_shuffledOptionEmojis),correctIndex);

@override
String toString() {
  return 'ShuffledQuestion(question: $question, shuffledOptions: $shuffledOptions, shuffledOptionEmojis: $shuffledOptionEmojis, correctIndex: $correctIndex)';
}


}

/// @nodoc
abstract mixin class _$ShuffledQuestionCopyWith<$Res> implements $ShuffledQuestionCopyWith<$Res> {
  factory _$ShuffledQuestionCopyWith(_ShuffledQuestion value, $Res Function(_ShuffledQuestion) _then) = __$ShuffledQuestionCopyWithImpl;
@override @useResult
$Res call({
 Question question, List<String> shuffledOptions, List<String>? shuffledOptionEmojis, int correctIndex
});


@override $QuestionCopyWith<$Res> get question;

}
/// @nodoc
class __$ShuffledQuestionCopyWithImpl<$Res>
    implements _$ShuffledQuestionCopyWith<$Res> {
  __$ShuffledQuestionCopyWithImpl(this._self, this._then);

  final _ShuffledQuestion _self;
  final $Res Function(_ShuffledQuestion) _then;

/// Create a copy of ShuffledQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? shuffledOptions = null,Object? shuffledOptionEmojis = freezed,Object? correctIndex = null,}) {
  return _then(_ShuffledQuestion(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Question,shuffledOptions: null == shuffledOptions ? _self._shuffledOptions : shuffledOptions // ignore: cast_nullable_to_non_nullable
as List<String>,shuffledOptionEmojis: freezed == shuffledOptionEmojis ? _self._shuffledOptionEmojis : shuffledOptionEmojis // ignore: cast_nullable_to_non_nullable
as List<String>?,correctIndex: null == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ShuffledQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res> get question {
  
  return $QuestionCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}
}

// dart format on
