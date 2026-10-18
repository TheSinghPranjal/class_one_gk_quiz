// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Built once and reused for the app's lifetime. Watching [profileProvider]
/// directly here would recreate the whole GoRouter (and reset navigation)
/// every time the profile changes, so instead we mirror it into a
/// [ValueNotifier] and let go_router's `refreshListenable` re-run the
/// redirect for the *current* location.

@ProviderFor(router)
final routerProvider = RouterProvider._();

/// Built once and reused for the app's lifetime. Watching [profileProvider]
/// directly here would recreate the whole GoRouter (and reset navigation)
/// every time the profile changes, so instead we mirror it into a
/// [ValueNotifier] and let go_router's `refreshListenable` re-run the
/// redirect for the *current* location.

final class RouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Built once and reused for the app's lifetime. Watching [profileProvider]
  /// directly here would recreate the whole GoRouter (and reset navigation)
  /// every time the profile changes, so instead we mirror it into a
  /// [ValueNotifier] and let go_router's `refreshListenable` re-run the
  /// redirect for the *current* location.
  RouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return router(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$routerHash() => r'a23424f770e82e27e8d406c41ada728e925202cb';
