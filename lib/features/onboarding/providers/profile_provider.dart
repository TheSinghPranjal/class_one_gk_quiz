import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage_service.dart';

part 'profile_provider.freezed.dart';
part 'profile_provider.g.dart';

const List<String> kAvatarEmojis = [
  '🦁',
  '🐼',
  '🐵',
  '🦊',
  '🐰',
  '🐶',
  '🐱',
  '🐯',
];

@freezed
abstract class ProfileData with _$ProfileData {
  const factory ProfileData({
    @Default('') String name,
    @Default('') String avatarEmoji,
  }) = _ProfileData;

  const ProfileData._();

  bool get hasProfile => name.isNotEmpty && avatarEmoji.isNotEmpty;
}

const _kName = 'profile_name';
const _kAvatar = 'profile_avatar';

@Riverpod(keepAlive: true)
class Profile extends _$Profile {
  @override
  ProfileData build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return ProfileData(
      name: prefs.getString(_kName) ?? '',
      avatarEmoji: prefs.getString(_kAvatar) ?? '',
    );
  }

  void save({required String name, required String avatarEmoji}) {
    final prefs = ref.read(sharedPreferencesProvider);
    prefs.setString(_kName, name);
    prefs.setString(_kAvatar, avatarEmoji);
    state = ProfileData(name: name, avatarEmoji: avatarEmoji);
  }
}
