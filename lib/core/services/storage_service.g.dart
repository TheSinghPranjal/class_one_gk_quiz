// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Must be initialised in `main()` before the app starts, and provided via
/// `ProviderScope(overrides: [...])`.

@ProviderFor(hiveStorage)
final hiveStorageProvider = HiveStorageProvider._();

/// Must be initialised in `main()` before the app starts, and provided via
/// `ProviderScope(overrides: [...])`.

final class HiveStorageProvider
    extends
        $FunctionalProvider<
          HiveStorageService,
          HiveStorageService,
          HiveStorageService
        >
    with $Provider<HiveStorageService> {
  /// Must be initialised in `main()` before the app starts, and provided via
  /// `ProviderScope(overrides: [...])`.
  HiveStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hiveStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hiveStorageHash();

  @$internal
  @override
  $ProviderElement<HiveStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HiveStorageService create(Ref ref) {
    return hiveStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HiveStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HiveStorageService>(value),
    );
  }
}

String _$hiveStorageHash() => r'fc0063c35babcd1b76f55e440fe791223c4d8241';

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'd8a123f8131dddc25218cf0b7e15eff43b58543c';
