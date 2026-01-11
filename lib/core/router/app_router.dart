// lib/core/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/shared/main_nav_shell.dart';

// Importa las nuevas páginas (debes crearlas o renombrar las existentes)
// Por ahora usaré placeholders para que no te de error
import 'package:agro/features/errors/presentation/errors_page.dart';
import 'package:agro/features/schedule/presentation/schedule_page.dart';
import 'package:agro/features/pricing/presentation/pricing_page.dart';
import 'package:agro/features/premium/presentation/premium_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    initialLocation: '/errors',
    navigatorKey: rootNavigatorKey,
    routes: [
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
            builder: (context, state) => const SchedulePage(),
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
