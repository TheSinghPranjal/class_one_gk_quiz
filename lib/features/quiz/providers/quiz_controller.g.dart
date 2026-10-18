// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizController)
final quizControllerProvider = QuizControllerProvider._();

final class QuizControllerProvider
    extends $NotifierProvider<QuizController, QuizState> {
  QuizControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizControllerHash();

  @$internal
  @override
  QuizController create() => QuizController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizState>(value),
    );
  }
}

String _$quizControllerHash() => r'5985407cdbfc4cfa2da6e23a138f3dc346c5565f';

abstract class _$QuizController extends $Notifier<QuizState> {
  QuizState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<QuizState, QuizState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<QuizState, QuizState>,
              QuizState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
