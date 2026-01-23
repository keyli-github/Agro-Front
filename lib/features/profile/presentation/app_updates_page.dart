import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class AppUpdatesPage extends StatefulWidget {
  const AppUpdatesPage({super.key});

  @override
  State<AppUpdatesPage> createState() => _AppUpdatesPageState();
}

class _AppUpdatesPageState extends State<AppUpdatesPage> {
  bool _wifi = true;
  bool _mobile = false;
  bool _notify = true;

  Widget _settingCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: AppTheme.cardDecoration().copyWith(borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizaciones de apps', style: TextStyle(color: AppColors.textDark)),
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _settingCard(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Actualizar automáticamente Agro', style: TextStyle(fontWeight: FontWeight.w700)),
                        SizedBox(height: 6),
                        Text('Actualiza la app automáticamente mediante wifi.', style: TextStyle(color: AppColors.textLight)),
                      ],
                    ),
                  ),
                  Switch(value: _wifi, onChanged: (v) => setState(() => _wifi = v), activeColor: AppColors.actionGreen),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _settingCard(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Actualizar Agro mediante datos móviles', style: TextStyle(fontWeight: FontWeight.w700)),
                        SizedBox(height: 6),
                        Text('Actualiza la app automáticamente mediante datos del celular.', style: TextStyle(color: AppColors.textLight)),
                      ],
                    ),
                  ),
                  Switch(value: _mobile, onChanged: (v) => setState(() => _mobile = v), activeColor: AppColors.actionGreen),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const Text('Notificaciones', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            _settingCard(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Hay una actualización para Agro', style: TextStyle(fontWeight: FontWeight.w700)),
                        SizedBox(height: 6),
                        Text('Recibe notificaciones cuando haya actualizaciones.', style: TextStyle(color: AppColors.textLight)),
                      ],
                    ),
                  ),
                  Switch(value: _notify, onChanged: (v) => setState(() => _notify = v), activeColor: AppColors.actionGreen),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
