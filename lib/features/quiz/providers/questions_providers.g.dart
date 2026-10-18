// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sections)
final sectionsProvider = SectionsProvider._();

final class SectionsProvider
    extends $FunctionalProvider<List<Section>, List<Section>, List<Section>>
    with $Provider<List<Section>> {
  SectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sectionsHash();

  @$internal
  @override
  $ProviderElement<List<Section>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Section> create(Ref ref) {
    return sections(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Section> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Section>>(value),
    );
  }
}

String _$sectionsHash() => r'e41bb5dabb8c85ef91dfece5af5044da93a86357';

@ProviderFor(questionRepository)
final questionRepositoryProvider = QuestionRepositoryProvider._();

final class QuestionRepositoryProvider
    extends
        $FunctionalProvider<
          QuestionRepository,
          QuestionRepository,
          QuestionRepository
        >
    with $Provider<QuestionRepository> {
  QuestionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'questionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$questionRepositoryHash();

  @$internal
  @override
  $ProviderElement<QuestionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  QuestionRepository create(Ref ref) {
    return questionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuestionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuestionRepository>(value),
    );
  }
}

String _$questionRepositoryHash() =>
    r'90f4528c5b83f01cdd1cc23710185a8c25b7c8b0';

@ProviderFor(allQuestions)
final allQuestionsProvider = AllQuestionsProvider._();

final class AllQuestionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Question>>,
          List<Question>,
          FutureOr<List<Question>>
        >
    with $FutureModifier<List<Question>>, $FutureProvider<List<Question>> {
  AllQuestionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allQuestionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allQuestionsHash();

  @$internal
  @override
  $FutureProviderElement<List<Question>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Question>> create(Ref ref) {
    return allQuestions(ref);
  }
}

String _$allQuestionsHash() => r'4b729f15fb97a76b303ccd89f2ca3d888d774549';

@ProviderFor(questionsBySection)
final questionsBySectionProvider = QuestionsBySectionFamily._();

final class QuestionsBySectionProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Question>>,
          List<Question>,
          FutureOr<List<Question>>
        >
    with $FutureModifier<List<Question>>, $FutureProvider<List<Question>> {
  QuestionsBySectionProvider._({
    required QuestionsBySectionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'questionsBySectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$questionsBySectionHash();

  @override
  String toString() {
    return r'questionsBySectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Question>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Question>> create(Ref ref) {
    final argument = this.argument as String;
    return questionsBySection(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionsBySectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$questionsBySectionHash() =>
    r'e3d455c51d11f100671cb626c18d8face8f88e20';

final class QuestionsBySectionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Question>>, String> {
  QuestionsBySectionFamily._()
    : super(
        retry: null,
        name: r'questionsBySectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QuestionsBySectionProvider call(String sectionId) =>
      QuestionsBySectionProvider._(argument: sectionId, from: this);

  @override
  String toString() => r'questionsBySectionProvider';
}

@ProviderFor(questionsBySectionBookOnly)
final questionsBySectionBookOnlyProvider = QuestionsBySectionBookOnlyFamily._();

final class QuestionsBySectionBookOnlyProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Question>>,
          List<Question>,
          FutureOr<List<Question>>
        >
    with $FutureModifier<List<Question>>, $FutureProvider<List<Question>> {
  QuestionsBySectionBookOnlyProvider._({
    required QuestionsBySectionBookOnlyFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'questionsBySectionBookOnlyProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$questionsBySectionBookOnlyHash();

  @override
  String toString() {
    return r'questionsBySectionBookOnlyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Question>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Question>> create(Ref ref) {
    final argument = this.argument as String;
    return questionsBySectionBookOnly(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionsBySectionBookOnlyProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$questionsBySectionBookOnlyHash() =>
    r'c3a1d522f010a7908e41e46172cd7d800af41e20';

final class QuestionsBySectionBookOnlyFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Question>>, String> {
  QuestionsBySectionBookOnlyFamily._()
    : super(
        retry: null,
        name: r'questionsBySectionBookOnlyProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QuestionsBySectionBookOnlyProvider call(String sectionId) =>
      QuestionsBySectionBookOnlyProvider._(argument: sectionId, from: this);

  @override
  String toString() => r'questionsBySectionBookOnlyProvider';
}

/// 5 questions chosen the same way for every player on a given calendar day.

@ProviderFor(dailyChallenge)
final dailyChallengeProvider = DailyChallengeProvider._();

/// 5 questions chosen the same way for every player on a given calendar day.

final class DailyChallengeProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Question>>,
          List<Question>,
          FutureOr<List<Question>>
        >
    with $FutureModifier<List<Question>>, $FutureProvider<List<Question>> {
  /// 5 questions chosen the same way for every player on a given calendar day.
  DailyChallengeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailyChallengeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailyChallengeHash();

  @$internal
  @override
  $FutureProviderElement<List<Question>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Question>> create(Ref ref) {
    return dailyChallenge(ref);
  }
}

String _$dailyChallengeHash() => r'8d0973b196c9d807172968612338f13ee4824e88';
