import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage_service.dart';

part 'settings_provider.freezed.dart';
part 'settings_provider.g.dart';

@freezed
abstract class SettingsData with _$SettingsData {
  const factory SettingsData({
    @Default(true) bool soundOn,
    @Default(false) bool autoReadAloud,
    @Default(0.45) double speechSpeed,
    @Default(true) bool timerOn,
    @Default(10) int questionsPerQuiz,
    @Default(false) bool bookOnlyMode,
  }) = _SettingsData;
}

const _kSoundOn = 'settings_sound_on';
const _kAutoReadAloud = 'settings_auto_read_aloud';
const _kSpeechSpeed = 'settings_speech_speed';
const _kTimerOn = 'settings_timer_on';
const _kQuestionsPerQuiz = 'settings_questions_per_quiz';
const _kBookOnlyMode = 'settings_book_only_mode';

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  @override
  SettingsData build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return SettingsData(
      soundOn: prefs.getBool(_kSoundOn) ?? true,
      autoReadAloud: prefs.getBool(_kAutoReadAloud) ?? false,
      speechSpeed: prefs.getDouble(_kSpeechSpeed) ?? 0.45,
      timerOn: prefs.getBool(_kTimerOn) ?? true,
      questionsPerQuiz: prefs.getInt(_kQuestionsPerQuiz) ?? 10,
      bookOnlyMode: prefs.getBool(_kBookOnlyMode) ?? false,
    );
  }

  void setSoundOn(bool value) {
    ref.read(sharedPreferencesProvider).setBool(_kSoundOn, value);
    state = state.copyWith(soundOn: value);
  }

  void setAutoReadAloud(bool value) {
    ref.read(sharedPreferencesProvider).setBool(_kAutoReadAloud, value);
    state = state.copyWith(autoReadAloud: value);
  }

  void setSpeechSpeed(double value) {
    ref.read(sharedPreferencesProvider).setDouble(_kSpeechSpeed, value);
    state = state.copyWith(speechSpeed: value);
  }

  void setTimerOn(bool value) {
    ref.read(sharedPreferencesProvider).setBool(_kTimerOn, value);
    state = state.copyWith(timerOn: value);
  }

  void setQuestionsPerQuiz(int value) {
    ref.read(sharedPreferencesProvider).setInt(_kQuestionsPerQuiz, value);
    state = state.copyWith(questionsPerQuiz: value);
  }

  void setBookOnlyMode(bool value) {
    ref.read(sharedPreferencesProvider).setBool(_kBookOnlyMode, value);
    state = state.copyWith(bookOnlyMode: value);
  }
}
