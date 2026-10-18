// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Profile)
final profileProvider = ProfileProvider._();

final class ProfileProvider extends $NotifierProvider<Profile, ProfileData> {
  ProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileHash();

  @$internal
  @override
  Profile create() => Profile();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileData>(value),
    );
  }
}

String _$profileHash() => r'a19c3aa66fa589e618329559bffcd9769f3f860d';

abstract class _$Profile extends $Notifier<ProfileData> {
  ProfileData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProfileData, ProfileData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileData, ProfileData>,
              ProfileData,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
