import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class HowRewardsWorkPage extends StatelessWidget {
  const HowRewardsWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBeige,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Cómo funciona',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE5E7EB)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStep(
                  icon: Icons.card_giftcard_outlined,
                  title: 'completa un desafío',
                  description: 'Elige entre actividades como visitar la aplicación, completar tu perfil y muchas más.',
                  isFirst: true,
                ),
                const SizedBox(height: 24),
                _buildStep(
                  icon: Icons.trending_up,
                  title: 'Sube de nivel y desbloquea recompensas',
                  description: 'A medida que subes de nivel, desbloqueas diferentes recompensas, como recompensas en establecimientos, Informes Especiales Específicos y acceso Vip a las novedades',
                ),
                const SizedBox(height: 24),
                _buildStep(
                  icon: Icons.redeem_outlined,
                  title: 'Reclama tus recompensas antes de que caduquen',
                  description: 'Disfruta de tus recompensas antes que acabe el mes, porque el día uno volverán a estar bloqueadas.',
                ),
                const SizedBox(height: 24),
                _buildStep(
                  icon: Icons.notifications_outlined,
                  title: 'Activa las notificaciones',
                  description: 'Activa alertas para no perderte nunca de nuevas recompensas. Activa las notificaciones en ajustes.',
                  isLast: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStep({
    required IconData icon,
    required String title,
    required String description,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icono profesional
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 24,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        const SizedBox(width: 14),
        
        // Contenido
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}