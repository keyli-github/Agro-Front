import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/core/providers/user_provider.dart';
import 'package:agro/features/profile/presentation/account_page.dart';
import 'package:agro/features/profile/presentation/notifications_page.dart';
import 'package:agro/features/profile/presentation/registered_info_page.dart';
import 'package:agro/features/profile/presentation/app_updates_page.dart';
import 'package:agro/features/profile/presentation/profile_page.dart';

class ProfileSettingsPage extends ConsumerWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes', style: TextStyle(color: AppColors.textDark)),
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Center(child: Icon(Icons.person, size: 36, color: Colors.grey)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                userState.isLoggedIn ? (userState.username ?? 'Usuario') : 'No registrado',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceWhite,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: const Center(child: Icon(Icons.qr_code, size: 18, color: AppColors.textDark)),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: AppColors.surfaceWhite,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: AppColors.actionGreen),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.add, color: AppColors.actionGreen, size: 18),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        if (userState.email != null && userState.email!.isNotEmpty)
                          Text(
                            userState.email!,
                            style: const TextStyle(fontSize: 13, color: AppColors.textLight),
                          ),
                      ],
                    ),
                  ),
                  // 'Editar perfil' centered under the name/email
                  const SizedBox(width: 12),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                child: SizedBox(
                  width: 160,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProfilePage())),
                    child: const Text('Editar perfil'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.surfaceWhite,
                      side: const BorderSide(color: AppColors.actionGreen),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildSettingTile(
                'Cuenta',
                'Notificaciones de seguridad, cerrar sesión',
                Icons.vpn_key,
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AccountPage())),
              ),
              const SizedBox(height: 12),
              _buildSettingTile(
                'Notificaciones',
                'Activa alertas y novedades',
                Icons.notifications,
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const NotificationsPage())),
              ),
              const SizedBox(height: 12),
              _buildSettingTile(
                'Solicitar información',
                'Crea un informe de todos tus registros',
                Icons.description,
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RegisteredInfoPage())),
              ),
              const SizedBox(height: 12),
              _buildSettingTile('Ayuda y comentarios', 'Centro de ayuda y privacidad', Icons.help_outline),
              const SizedBox(height: 12),
              _buildSettingTile(
                'Invitar amigos',
                '',
                Icons.person_add_alt,
                onTap: () => _shareInvitation(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingTile(String title, String subtitle, IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.actionGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.actionGreen, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDark),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 13, color: AppColors.textLight),
                    ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textLight),
          ],
        ),
      ),
    );
  }

  void _shareInvitation(BuildContext context) {
    Share.share(
      '¡Únete a AGRO! Descarga la app y mejora tus cultivos: [enlace de descarga]',
      subject: 'Invitación a AGRO',
    );
  }
}