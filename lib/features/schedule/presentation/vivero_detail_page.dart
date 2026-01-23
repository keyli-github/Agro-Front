import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:agro/core/theme/app_theme.dart';

class ViveroDetailPage extends StatelessWidget {
  const ViveroDetailPage({super.key});

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
        title: const Text(
          'Tu plan de fertilización',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Base tecnica por etapa del cultivo',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textDark,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Vivero\n(0-6 meses)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '2-3 aplicaciones | General',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Objetivo de la etapa',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Lograr plantulas sanas y uniformes antes del trasplante.\nCon AgroCIC premium, podras ajustar tu objetivo, tu cantidad de plantas, 6 de sombra, variedad de cafe y mucho mas.',
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
                'Sube de categoría ahora',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'CALENDARIO',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),
            _buildApplicationCard(
              'Hojas a 1a horqueta',
              '26 de enero',
              'Primera aplicacion',
              () => context.push('/application_detail/vivero/1'),
            ),
            const SizedBox(height: 12),
            _buildApplicationCard(
              'Hojas a 1a horqueta',
              '16 de febrero',
              'Segunda aplicación',
              () => context.push('/application_detail/vivero/2'),
            ),
            const SizedBox(height: 12),
            _buildApplicationCard(
              'Hojas a 1a-4ª horqueta',
              '09 de marzo',
              'Primera aplicacion',
              () => context.push('/application_detail/vivero/3'),
            ),
            const SizedBox(height: 12),
            _buildApplicationCard(
              'Hojas a 1a-4ª horqueta',
              '30 de marzo',
              'Segunda aplicacion',
              () => context.push('/application_detail/vivero/4'),
            ),
            const SizedBox(height: 12),
            _buildApplicationCard(
              'Hojas a 1a-4ª horqueta',
              '20 de abril',
              'Tercera aplicación',
              () => context.push('/application_detail/vivero/5'),
            ),
            const SizedBox(height: 12),
            _buildApplicationCard(
              'Pre-salida',
              '11 de mayo (opcional)',
              'solo si extiende a 4 meses',
              () => context.push('/application_detail/vivero/6'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationCard(String stage, String date, String description, VoidCallback onTap) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stage,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}