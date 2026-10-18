import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/home/presentation/section_map_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/onboarding/presentation/splash_screen.dart';
import '../../features/onboarding/providers/profile_provider.dart';
import '../../features/parent/presentation/parent_area_screen.dart';
import '../../features/quiz/presentation/quiz_screen.dart';
import '../../features/quiz/presentation/results_screen.dart';
import '../../features/quiz/presentation/section_intro_screen.dart';
import '../../features/quiz/providers/quiz_state.dart';
import '../../features/rewards/presentation/sticker_book_screen.dart';

part 'app_router.g.dart';

CustomTransitionPage<T> _fadeZoomPage<T>(Widget child) {
  return CustomTransitionPage<T>(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
      return FadeTransition(
        opacity: curved,
        child: ScaleTransition(
          scale: Tween(begin: 0.96, end: 1.0).animate(curved),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 320),
  );
}

QuizMode _parseMode(Object? raw) {
  final name = raw as String? ?? 'practice';
  return QuizMode.values.firstWhere(
    (m) => m.name == name,
    orElse: () => QuizMode.practice,
  );
}

/// Built once and reused for the app's lifetime. Watching [profileProvider]
/// directly here would recreate the whole GoRouter (and reset navigation)
/// every time the profile changes, so instead we mirror it into a
/// [ValueNotifier] and let go_router's `refreshListenable` re-run the
/// redirect for the *current* location.
@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final hasProfileNotifier = ValueNotifier(
    ref.read(profileProvider).hasProfile,
  );
  ref.listen(profileProvider, (previous, next) {
    hasProfileNotifier.value = next.hasProfile;
  });
  ref.onDispose(hasProfileNotifier.dispose);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: hasProfileNotifier,
    redirect: (context, state) {
      final onSplashOrOnboarding =
          state.matchedLocation == '/' || state.matchedLocation == '/onboarding';
      if (!hasProfileNotifier.value && !onSplashOrOnboarding) {
        return '/onboarding';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => _fadeZoomPage(const SplashScreen()),
      ),
      GoRoute(
        path: '/onboarding',
        pageBuilder: (context, state) => _fadeZoomPage(const OnboardingScreen()),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => _fadeZoomPage(const SectionMapScreen()),
      ),
      GoRoute(
        path: '/section/:sectionId',
        pageBuilder: (context, state) => _fadeZoomPage(
          SectionIntroScreen(sectionId: state.pathParameters['sectionId']!),
        ),
      ),
      GoRoute(
        path: '/quiz',
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return _fadeZoomPage(
            QuizScreen(
              sectionId: extra['sectionId'] as String? ?? 'mix',
              mode: _parseMode(extra['mode']),
              retryQuestionIds:
                  (extra['retryQuestionIds'] as List?)?.cast<String>(),
            ),
          );
        },
      ),
      GoRoute(
        path: '/results',
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return _fadeZoomPage(
            ResultsScreen(
              sectionId: extra['sectionId'] as String? ?? '',
              mode: _parseMode(extra['mode']),
              score: extra['score'] as int? ?? 0,
              total: extra['total'] as int? ?? 0,
              newBadges: (extra['newBadges'] as List?)?.cast<String>() ?? const [],
              wrongQuestionIds:
                  (extra['wrongQuestionIds'] as List?)?.cast<String>() ?? const [],
            ),
          );
        },
      ),
      GoRoute(
        path: '/rewards',
        pageBuilder: (context, state) => _fadeZoomPage(const StickerBookScreen()),
      ),
      GoRoute(
        path: '/parent',
        pageBuilder: (context, state) => _fadeZoomPage(const ParentAreaScreen()),
      ),
    ],
  );
}
