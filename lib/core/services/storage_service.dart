import 'dart:convert';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_service.g.dart';

const String kHiveBoxName = 'gk_quiz_box';
const String kProgressKey = 'progress';
const String kRewardsKey = 'rewards';

/// Thin wrapper around a single Hive box, storing JSON-encoded blobs.
/// Keeps Hive usage isolated so the rest of the app only deals with
/// plain Dart objects and freezed models.
///
/// Also supports an in-memory mode (no real Hive box) for widget/unit tests.
class HiveStorageService {
  HiveStorageService(Box<String> box) : _box = box, _memory = null;

  HiveStorageService.inMemory()
      : _box = null,
        _memory = <String, String>{};

  final Box<String>? _box;
  final Map<String, String>? _memory;

  Map<String, dynamic>? readJson(String key) {
    final raw = _box != null ? _box.get(key) : _memory![key];
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<void> writeJson(String key, Map<String, dynamic> value) async {
    final encoded = jsonEncode(value);
    if (_box != null) {
      await _box.put(key, encoded);
    } else {
      _memory![key] = encoded;
    }
  }

  Future<void> clearAll() async {
    if (_box != null) {
      await _box.clear();
    } else {
      _memory!.clear();
    }
  }
}

/// Must be initialised in `main()` before the app starts, and provided via
/// `ProviderScope(overrides: [...])`.
@Riverpod(keepAlive: true)
HiveStorageService hiveStorage(Ref ref) {
  throw UnimplementedError('hiveStorageProvider must be overridden in main()');
}

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError(
    'sharedPreferencesProvider must be overridden in main()',
  );
}

Future<Box<String>> openAppBox() async {
  return Hive.openBox<String>(kHiveBoxName);
}
