// lib/core/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agro/shared/main_nav_shell.dart';

// FEATURES
import 'package:agro/features/discover/presentation/discover_page.dart';
import 'package:agro/features/inventory/presentation/inventory_page.dart';
import 'package:agro/features/plan/presentation/plan_page.dart';
import 'package:agro/features/community/presentation/community_screen.dart';
import 'package:agro/features/market/presentation/market_page.dart';

/// Provider manual del router (reemplaza el @riverpod generado)
final routerProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    initialLocation: '/discover',
    navigatorKey: rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return MainNavShell(child: child);
        },
        routes: [
          GoRoute(
            name: 'discover',
            path: '/discover',
            builder: (context, state) => const DiscoverPage(),
          ),
          GoRoute(
            name: 'inventory',
            path: '/inventory',
            builder: (context, state) => const InventoryPage(),
          ),
          GoRoute(
            name: 'plan',
            path: '/plan',
            builder: (context, state) => const PlanPage(),
          ),
          GoRoute(
            name: 'market',
            path: '/market',
            builder: (context, state) => const MarketPage(),
          ),
          GoRoute(
            name: 'community',
            path: '/community',
            builder: (context, state) => const CommunityScreen(),
          ),
        ],
      ),
    ],
  );
});
