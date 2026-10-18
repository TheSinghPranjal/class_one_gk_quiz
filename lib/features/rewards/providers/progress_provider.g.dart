// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Progress)
final progressProvider = ProgressProvider._();

final class ProgressProvider
    extends $AsyncNotifierProvider<Progress, ProgressData> {
  ProgressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'progressProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$progressHash();

  @$internal
  @override
  Progress create() => Progress();
}

String _$progressHash() => r'8cf8285b7fd48dacd5812f344f5e3af6bff13f5c';

abstract class _$Progress extends $AsyncNotifier<ProgressData> {
  FutureOr<ProgressData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ProgressData>, ProgressData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProgressData>, ProgressData>,
              AsyncValue<ProgressData>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
