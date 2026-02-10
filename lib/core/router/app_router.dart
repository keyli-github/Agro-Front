// lib/core/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/shared/main_nav_shell.dart';
import 'package:agro/features/welcome/presentation/welcome_screen.dart';
import 'package:agro/features/welcome/presentation/onboarding_screen.dart';

// Importa las nuevas páginas (debes crearlas o renombrar las existentes)
// Por ahora usaré placeholders para que no te de error
import 'package:agro/features/errors/presentation/errors_page.dart';
import 'package:agro/features/errors/presentation/fertilize_detail_page.dart';
import 'package:agro/features/errors/presentation/review_cafetal_detail_page.dart';
import 'package:agro/features/errors/presentation/fumigate_detail_page.dart';
import 'package:agro/features/errors/presentation/nothing_detail_page.dart';
import 'package:agro/features/errors/presentation/programs_detail_page.dart';
import 'package:agro/features/schedule/presentation/vivero_detail_page.dart';
import 'package:agro/features/schedule/presentation/application_detail_page.dart';
import 'package:agro/features/schedule/presentation/activity_detail_page.dart';
import 'package:agro/features/pricing/presentation/pricing_page.dart';
import 'package:agro/features/pricing/presentation/urea_verification_page.dart';
import 'package:agro/features/pricing/presentation/npk_verification_page.dart';
import 'package:agro/features/pricing/presentation/urea_history_page.dart';
import 'package:agro/features/pricing/presentation/urea_statistics_page.dart';
import 'package:agro/features/premium/presentation/premium_page.dart';
import 'package:agro/features/premium/presentation/rewards_page.dart';
import 'package:agro/features/premium/presentation/challenges_page.dart';
import 'package:agro/features/premium/presentation/centro_recompensas_page.dart';
import 'package:agro/features/premium/presentation/reward_detail_page.dart';
import 'package:agro/features/premium/presentation/how_rewards_work_page.dart';
import 'package:agro/features/schedule/presentation/when_to_apply_page.dart';
import 'package:agro/features/schedule/presentation/crop_advice_detail_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    initialLocation: '/welcome',
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        name: 'welcome',
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: 'rewards',
        path: '/rewards',
        builder: (context, state) => const RewardsPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'crop_advice_detail',
        path: '/crop_advice_detail',
        builder: (context, state) => const CropAdviceDetailPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'review_cafetal_detail',
        path: '/review_cafetal_detail',
        builder: (context, state) => const ReviewCafetalDetailPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'fumigate_detail',
        path: '/fumigate_detail',
        builder: (context, state) => const FumigateDetailPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'nothing_detail',
        path: '/nothing_detail',
        builder: (context, state) => const NothingDetailPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'programs_detail',
        path: '/programs_detail',
        builder: (context, state) => const ProgramsDetailPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'fertilize_detail',
        path: '/fertilize_detail',
        builder: (context, state) => const FertilizeDetailPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'challenges',
        path: '/challenges',
        builder: (context, state) => const ChallengesPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'centro_recompensas',
        path: '/centro_recompensas',
        builder: (context, state) => const CentroRecompensasPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'reward_detail',
        path: '/reward_detail/:level',
        builder: (context, state) {
          final level = int.parse(state.pathParameters['level'] ?? '0');
          final isUnlocked = state.uri.queryParameters['unlocked'] == 'true';
          return RewardDetailPage(
            level: level,
            isUnlocked: isUnlocked,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'how_rewards_work',
        path: '/how_rewards_work',
        builder: (context, state) => const HowRewardsWorkPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'vivero_detail',
        path: '/vivero_detail',
        builder: (context, state) => const ViveroDetailPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'application_detail',
        path: '/application_detail/:stage/:id',
        builder: (context, state) {
          final stage = state.pathParameters['stage'] ?? '';
          final id = int.parse(state.pathParameters['id'] ?? '1');
          // Hardcode data based on id
          final applications = [
            {'stage': 'Hojas a 1a horqueta', 'date': '26 de enero', 'application': 'Primera aplicacion'},
            {'stage': 'Hojas a 1a horqueta', 'date': '16 de febrero', 'application': 'Segunda aplicación'},
            {'stage': 'Hojas a 1a-4ª horqueta', 'date': '09 de marzo', 'application': 'Primera aplicacion'},
            {'stage': 'Hojas a 1a-4ª horqueta', 'date': '30 de marzo', 'application': 'Segunda aplicacion'},
            {'stage': 'Hojas a 1a-4ª horqueta', 'date': '20 de abril', 'application': 'Tercera aplicación'},
            {'stage': 'Pre-salida', 'date': '11 de mayo (opcional)', 'application': 'solo si extiende a 4 meses'},
          ];
          final app = applications[id - 1];
          return ApplicationDetailPage(
            stage: app['stage'] as String,
            date: app['date'] as String,
            application: app['application'] as String,
            id: id,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'activity_detail',
        path: '/activity_detail/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id'] ?? '1');
          final activities = [
            'Prepara el agua',
            'Pesa y disuelve',
            'Carga equipo',
            'Aplica temprano',
            'Limpia y riega',
          ];
          final title = activities[id - 1];
          return ActivityDetailPage(activityTitle: title);
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'urea_verification',
        path: '/urea_verification',
        builder: (context, state) => const UreaVerificationPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'npk_verification',
        path: '/npk_verification',
        builder: (context, state) => const NpkVerificationPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'urea_history',
        path: '/urea_history',
        builder: (context, state) => const UreaHistoryPage(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: 'urea_statistics',
        path: '/urea_statistics',
        builder: (context, state) => const UreaStatisticsPage(),
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => MainNavShell(child: child),
        routes: [
          GoRoute(
            name: 'errors',
            path: '/errors',
            builder: (context, state) => const ErrorsPage(),
          ),
          GoRoute(
            name: 'schedule',
            path: '/schedule',
            builder: (context, state) => const WhenToApplyPage(),
          ),
          GoRoute(
            name: 'pricing',
            path: '/pricing',
            builder: (context, state) => const PricingPage(),
          ),
          GoRoute(
            name: 'premium',
            path: '/premium',
            builder: (context, state) => const PremiumPage(),
          ),
        ],
      ),
    ],
  );
});
