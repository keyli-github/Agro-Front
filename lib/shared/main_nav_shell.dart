//lib/shared/main_nav_shell.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'widgets/agro_app_bar.dart';
import 'widgets/profile_icon.dart';
import 'package:agro/features/profile/presentation/profile_settings_page.dart';
import 'package:agro/core/providers/user_provider.dart';
import 'package:agro/core/router/app_router.dart';

class MainNavShell extends ConsumerWidget {
  final Widget child;
  const MainNavShell({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = _calculateSelectedIndex(context);
    final title = _getPageTitle(selectedIndex);
    final subtitle = _getPageSubtitle(selectedIndex);
    final userState = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F8),
      appBar: AgroAppBar(
        title: title,
        subtitle: subtitle,
        showProfile: true,
        onProfileTap: () => _showProfileModal(context, ref, userState),
        onNotificationTap: () => _showNotificationModal(context, ref),
      ),
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  context: context,
                  index: 0,
                  selectedIndex: selectedIndex,
                  icon: Icons.shield_outlined,
                  selectedIcon: Icons.shield,
                  label: 'Evitar errores',
                ),
                _buildNavItem(
                  context: context,
                  index: 1,
                  selectedIndex: selectedIndex,
                  icon: Icons.event_outlined,
                  selectedIcon: Icons.event,
                  label: 'Cuando aplicar',
                ),
                _buildNavItem(
                  context: context,
                  index: 2,
                  selectedIndex: selectedIndex,
                  icon: Icons.show_chart,
                  selectedIcon: Icons.show_chart,
                  label: 'Productos verificados',
                ),
                _buildNavItem(
                  context: context,
                  index: 3,
                  selectedIndex: selectedIndex,
                  icon: Icons.emoji_events_outlined,
                  selectedIcon: Icons.emoji_events,
                  label: 'Premium',
                  isPremium: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showProfileModal(
    BuildContext context,
    WidgetRef ref,
    UserState userState,
  ) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (ctx) => ProfileSettingsPage()),
    );
  }

  void _showNotificationModal(BuildContext context, WidgetRef ref) {
    // Open the rewards screen as a full-screen modal, covering the shell
    context.go('/rewards');
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required int selectedIndex,
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    bool isPremium = false,
  }) {
    final isSelected = selectedIndex == index;
    final color = isSelected
        ? (isPremium ? Colors.amber.shade700 : AppColors.primary)
        : Colors.grey.shade600;

    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index, context),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(isSelected ? selectedIcon : icon, color: color, size: 26),
              const SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: color,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/errors')) return 0;
    if (location.startsWith('/schedule')) return 1;
    if (location.startsWith('/pricing')) return 2;
    if (location.startsWith('/premium')) return 3;
    return 0;
  }

  String _getPageTitle(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return 'AGRO';
      case 1:
        return 'AGRO';
      case 2:
        return 'AGRO';
      case 3:
        return 'AGRO';
      default:
        return 'Agro';
    }
  }

  String _getPageSubtitle(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return 'Evita errores que cuestan dinero';
      case 1:
        return 'Plan de aplicación';
      case 2:
        return 'Presupuestos y productos';
      case 3:
        return 'Acceso a contenido premium';
      default:
        return '';
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed('errors');
        break;
      case 1:
        context.goNamed('schedule');
        break;
      case 2:
        context.goNamed('pricing');
        break;
      case 3:
        context.goNamed('premium');
        break;
    }
  }
}
