import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool tones = true;
  bool reminders = true;
  bool tone = true;
  bool vibration = true;
  bool highPriority = true;

  Widget _tile(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: AppTheme.cardDecoration().copyWith(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.textDark)),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(subtitle, style: const TextStyle(color: AppColors.textLight)),
                ]
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged, activeColor: AppColors.actionGreen),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones', style: TextStyle(color: AppColors.textDark)),
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
            _tile('Tonos de conversación', 'Reproducir sonidos para los mensajes entrantes y salientes', tones, (v) => setState(() => tones = v)),
            _tile('Recordatorios', 'Recibe recordatorios ocasionales sobre mensajes, llamadas o estados', reminders, (v) => setState(() => reminders = v)),
            _tile('Tono de notificación', 'Predeterminado', tone, (v) => setState(() => tone = v)),
            _tile('Vibración', 'Predeterminada', vibration, (v) => setState(() => vibration = v)),
            _tile('Notificaciones de alta prioridad', 'Muestra vistas previas de notificaciones en la parte de la pantalla', highPriority, (v) => setState(() => highPriority = v)),
          ],
        ),
      ),
    );
  }
}
