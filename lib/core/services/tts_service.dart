import 'package:flutter_tts/flutter_tts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/settings/providers/settings_provider.dart';

part 'tts_service.g.dart';

/// Wraps flutter_tts with an Indian-English voice where available, falling
/// back to the platform default otherwise.
class TtsService {
  TtsService() {
    _init();
  }

  final FlutterTts _tts = FlutterTts();
  bool _ready = false;

  /// Mirrors the parent's read-aloud setting; nothing is spoken while false.
  bool enabled = false;

  Future<void> _init() async {
    try {
      await _tts.setLanguage('en-IN');
    } catch (_) {
      await _tts.setLanguage('en-US');
    }
    await _tts.setPitch(1.05);
    await _tts.setSpeechRate(0.45);
    _ready = true;
  }

  Future<void> setSpeed(double rate) async {
    await _tts.setSpeechRate(rate);
  }

  Future<void> speak(String text) async {
    if (!enabled) return;
    if (!_ready) await _init();
    await _tts.stop();
    await _tts.speak(text);
  }

  Future<void> stop() => _tts.stop();
}

@Riverpod(keepAlive: true)
TtsService ttsService(Ref ref) {
  final service = TtsService()
    ..enabled = ref.read(settingsProvider).autoReadAloud;
  ref.listen(settingsProvider, (previous, next) {
    if (previous?.autoReadAloud == next.autoReadAloud) return;
    service.enabled = next.autoReadAloud;
    if (!next.autoReadAloud) service.stop();
  });
  ref.onDispose(service.stop);
  return service;
}
