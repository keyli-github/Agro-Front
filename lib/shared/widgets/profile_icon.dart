// lib/shared/widgets/profile_icon.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/core/providers/user_provider.dart';

class ProfileIcon extends ConsumerWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);

    return GestureDetector(
      onTap: () => _showProfileModal(context, ref, userState),
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.15),
        child: const Icon(Icons.person_outline, color: Colors.white, size: 20),
      ),
    );
  }

  void _showProfileModal(
    BuildContext context,
    WidgetRef ref,
    UserState userState,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            const CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              userState.isLoggedIn
                  ? userState.username ?? 'Usuario'
                  : 'No registrado',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              userState.isLoggedIn ? userState.email ?? '' : 'Inicia sesión',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  if (userState.isLoggedIn) {
                    ref.read(userProvider.notifier).state = UserState();
                  } else {
                    ref.read(userProvider.notifier).state = UserState(
                      isLoggedIn: true,
                      username: 'Juan',
                      email: 'juan@example.com',
                    );
                  }
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  userState.isLoggedIn ? 'Cerrar sesión' : 'Iniciar sesión',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
