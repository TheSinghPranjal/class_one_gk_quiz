// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Rewards)
final rewardsProvider = RewardsProvider._();

final class RewardsProvider extends $NotifierProvider<Rewards, RewardsData> {
  RewardsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rewardsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rewardsHash();

  @$internal
  @override
  Rewards create() => Rewards();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RewardsData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RewardsData>(value),
    );
  }
}

String _$rewardsHash() => r'5b244cf0ad9c6ae15f9253823b81c57795a89f24';

abstract class _$Rewards extends $Notifier<RewardsData> {
  RewardsData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<RewardsData, RewardsData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RewardsData, RewardsData>,
              RewardsData,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
