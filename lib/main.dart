import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/services/storage_service.dart';

Future<void> _lockOrientationForPhones() async {
  if (kIsWeb) return;
  final view = PlatformDispatcher.instance.views.first;
  final size = view.physicalSize / view.devicePixelRatio;
  final shortestSide = min(size.width, size.height);
  if (shortestSide < 600) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _lockOrientationForPhones();

  await Hive.initFlutter();
  final box = await openAppBox();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        hiveStorageProvider.overrideWithValue(HiveStorageService(box)),
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const App(),
    ),
  );
}
