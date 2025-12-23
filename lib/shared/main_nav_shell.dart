//lib/shared/main_nav_shell.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavShell extends StatelessWidget {
  final Widget child;

  const MainNavShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (index) => _onItemTapped(index, context),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.explore), label: 'Descubre'),
          NavigationDestination(
            icon: Icon(Icons.inventory),
            label: 'Inventario',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            label: 'Plan',
          ),
          NavigationDestination(icon: Icon(Icons.store), label: 'Market'),
          NavigationDestination(icon: Icon(Icons.people), label: 'Comunidad'),
        ],
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    if (location.startsWith('/discover')) return 0;
    if (location.startsWith('/inventory')) return 1;
    if (location.startsWith('/plan')) return 2;
    if (location.startsWith('/market')) return 3;
    if (location.startsWith('/community')) return 4;

    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed('discover');
        break;
      case 1:
        context.goNamed('inventory');
        break;
      case 2:
        context.goNamed('plan');
        break;
      case 3:
        context.goNamed('market');
        break;
      case 4:
        context.goNamed('community');
        break;
    }
  }
}
