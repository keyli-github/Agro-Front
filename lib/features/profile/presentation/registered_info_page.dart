import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/core/theme/app_theme.dart';

final reportRequestProvider = StateProvider<DateTime?>((ref) => null);

class RegisteredInfoPage extends ConsumerWidget {
  const RegisteredInfoPage({super.key});

  String _formatDate(DateTime d) {
    const months = [
      'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio',
      'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'
    ];
    return '${d.day} de ${months[d.month - 1]} de ${d.year}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime? readyDate = ref.watch(reportRequestProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('información registrada', style: TextStyle(color: AppColors.textDark)),
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Controla tus datos y tus informes\n técnicos', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: AppTheme.cardDecoration().copyWith(borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey.shade100),
                    child: Icon(readyDate == null ? Icons.description_outlined : Icons.access_time, color: AppColors.textLight),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          readyDate == null ? 'Solicitar informes del cafetal' : 'Solicitud enviada',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          readyDate == null ? 'Crea un informe con el resumen técnico de tu cafetal: decisiones, ventanas de fertilización y constancias generadas.' : 'Estará listo el ${_formatDate(readyDate!)}',
                          style: const TextStyle(color: AppColors.textLight),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 12),
            if (readyDate == null) ...[
              const Text(
                'Crea un informe con el resumen técnico\nde tu cafetal: decisiones, ventanas de\nfertilización y constancias generadas. Lo\npuedes descargar o compartir con tu\nbanco o ingeniero.',
                style: TextStyle(color: AppColors.textDark),
              ),
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.actionGreen),
                  onPressed: () {
                    final DateTime computed = DateTime.now().add(const Duration(days: 3));
                    ref.read(reportRequestProvider.notifier).state = computed;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Solicitud enviada')));
                  },
                  child: const Text('Solicitar informe'),
                ),
              ),
            ] else ...[
              const SizedBox(height: 8),
              const Text(
                'El informe estará listo aproximadamente\nen 3 días. cuando este disponible tendrás\nuna semana para descargarle',
                style: TextStyle(color: AppColors.textDark),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
