import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/core/providers/user_provider.dart';
import 'package:agro/features/profile/presentation/email_page.dart';
import 'package:agro/features/profile/presentation/registered_info_page.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta', style: TextStyle(color: AppColors.textDark)),
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            // 'Solicitar informes' moved to Settings page
            // const SizedBox(height: 12),
            _accountTile(context, ref, Icons.add_box, 'Agregar otro cultivo'),
            const SizedBox(height: 12),
            _accountTile(context, ref, Icons.email_outlined, 'Dirección de correo electrónico'),
            const SizedBox(height: 12),
            _accountTile(context, ref, Icons.lock_outline, 'Verificación en dos pasos'),
            const SizedBox(height: 12),
            _accountTile(context, ref, Icons.logout, 'Cerrar sesión'),
            const SizedBox(height: 12),
            _accountTile(context, ref, Icons.delete_outline, 'Eliminar mi cuenta'),
          ],
        ),
      ),
    );
  }

  Widget _accountTile(BuildContext context, WidgetRef ref, IconData icon, String title) {
    return InkWell(
      onTap: () {
        if (title == 'Agregar otro cultivo') {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            isScrollControlled: true,
            builder: (ctx) {
              return Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle, border: Border.all(color: Colors.grey.shade300)),
                            child: const Icon(Icons.person, color: Colors.grey, size: 30),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Neyver Terrones', style: TextStyle(fontWeight: FontWeight.w700)),
                                SizedBox(height: 6),
                                Text('Cultivo: cafetal', style: TextStyle(color: AppColors.textLight)),
                              ],
                            ),
                          ),
                          const Icon(Icons.check_circle, color: AppColors.actionGreen),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Divider(color: Colors.grey.shade200, thickness: 1),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          Navigator.of(ctx).pop();
                          // TODO: open add-crop flow
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.surfaceWhite, border: Border.all(color: Colors.grey.shade300)),
                              child: const Icon(Icons.add, color: AppColors.actionGreen),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(child: Text('Añadir otro cultivo', style: TextStyle(fontWeight: FontWeight.w600))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (title == 'Solicitar informes del cafetal') {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RegisteredInfoPage()));
        } else if (title == 'Dirección de correo electrónico') {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const EmailPage()));
        } else if (title == 'Cerrar sesión') {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              title: const Text('¿Confirmas que deseas cerrar sesión?', style: TextStyle(fontWeight: FontWeight.w800)),
              content: const Text('Si lo haces, se cerrará Agro'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('Cancelar', style: TextStyle(color: AppColors.actionGreen)),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(userProvider.notifier).state = UserState();
                    Navigator.of(ctx).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Aceptar', style: TextStyle(color: AppColors.actionGreen)),
                ),
              ],
            ),
          );
        } else {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(title, style: const TextStyle(color: AppColors.textDark)),
              backgroundColor: AppColors.surfaceWhite,
              elevation: 0,
              leading: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.textDark), onPressed: () => Navigator.of(context).pop()),
            ),
            body: Center(child: Text(title)),
          )));
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: AppTheme.cardDecoration().copyWith(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.textLight),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textDark))),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
