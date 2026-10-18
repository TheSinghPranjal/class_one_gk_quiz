// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Settings)
final settingsProvider = SettingsProvider._();

final class SettingsProvider extends $NotifierProvider<Settings, SettingsData> {
  SettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsHash();

  @$internal
  @override
  Settings create() => Settings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsData>(value),
    );
  }
}

String _$settingsHash() => r'd6e0a791be6ac8d664b93b98a6b4deb924ea514e';

abstract class _$Settings extends $Notifier<SettingsData> {
  SettingsData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SettingsData, SettingsData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SettingsData, SettingsData>,
              SettingsData,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
