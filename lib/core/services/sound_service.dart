import 'package:audioplayers/audioplayers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/settings/providers/settings_provider.dart';

part 'sound_service.g.dart';

enum SoundEffect {
  tapPop('sounds/tap_pop.wav'),
  correctChime('sounds/correct_chime.wav'),
  wrongBoing('sounds/wrong_boing.wav'),
  starSparkle('sounds/star_sparkle.wav'),
  levelUpFanfare('sounds/level_up_fanfare.wav');

  const SoundEffect(this.assetPath);
  final String assetPath;
}

/// Wraps a small pool of [AudioPlayer]s so short sound effects can overlap,
/// and respects the app-wide mute setting.
class SoundService {
  SoundService({this.muted = false})
      : _players = List.generate(4, (_) => AudioPlayer()..setReleaseMode(ReleaseMode.stop));

  bool muted;
  final List<AudioPlayer> _players;
  int _next = 0;

  Future<void> play(SoundEffect effect) async {
    if (muted) return;
    final player = _players[_next];
    _next = (_next + 1) % _players.length;
    try {
      await player.stop();
      await player.play(AssetSource(effect.assetPath), volume: 0.7);
    } catch (_) {
      // Sound is a nice-to-have; never let audio errors break the quiz flow.
    }
  }

  void dispose() {
    for (final p in _players) {
      p.dispose();
    }
  }
}

@Riverpod(keepAlive: true)
SoundService soundService(Ref ref) {
  final service = SoundService(muted: !ref.watch(settingsProvider).soundOn);
  ref.onDispose(service.dispose);
  return service;
}
