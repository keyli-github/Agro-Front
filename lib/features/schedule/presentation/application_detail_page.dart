import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:agro/core/theme/app_theme.dart';

class ApplicationDetailPage extends StatelessWidget {
  final String stage;
  final String date;
  final String application;
  final int id;

  const ApplicationDetailPage({
    super.key,
    required this.stage,
    required this.date,
    required this.application,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBeige,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: Text(
          date,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: id == 1 ? _buildDetailedContent(context) : _buildPlaceholderContent(),
      ),
    );
  }

  Widget _buildDetailedContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$stage\n$application',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Esta dosis cubre ~1000-2000 plantas según tamaño.\nA Dosis referencial para viveros promedio, sin ajustes y sin analisis de suelo.',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textDark,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Con AgroCIC premium, podras ajustar la dosis para la cantidad de tus plantulas y mucho más.',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textDark,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // TODO: Navigate to premium
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.actionGreen,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Sube de categoria ahora',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Materiales',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Fertilizantes',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '. 5.9 kg fertilizante soluble 20-20-20 (ej. Yaramila o genérico).',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textDark,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Equipos',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '. 200 L agua limpia (tanque o barril).\n. Mochila aspersora (20 L) o sistema fertirriego/microaspersores.\n. Balanza, balde grande, colador fino.\n. Guantes, mascarilla (seguridad).',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textDark,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Actividades',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),
        _buildActivityButton('Prepara el agua\nNo clorada si es posible', () => context.push('/activity_detail/1')),
        const SizedBox(height: 12),
        _buildActivityButton('Pesa y disuelve\nCuela si hay grumos', () => context.push('/activity_detail/2')),
        const SizedBox(height: 12),
        _buildActivityButton('Carga equipo\nBombea bien', () => context.push('/activity_detail/3')),
        const SizedBox(height: 12),
        _buildActivityButton('Aplica temprano\nUsa fina niebla para no quemar', () => context.push('/activity_detail/4')),
        const SizedBox(height: 12),
        _buildActivityButton('Limpia y riega\nEnjuaga equipo', () => context.push('/activity_detail/5')),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const Text(
                '0/5',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Register activity
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.actionGreen,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'REGISTAR LA ACTIVIDAD DE HOY',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholderContent() {
    return Center(
      child: Text(
        'Esta es la pantalla de $stage $date $application',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildActivityButton(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textDark,
                  height: 1.4,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.textDark,
            ),
          ],
        ),
      ),
    );
  }
}