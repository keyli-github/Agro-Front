import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/features/premium/presentation/providers/premium_providers.dart';
import 'package:agro/features/premium/presentation/reward_detail_page.dart';
import 'package:agro/features/premium/presentation/how_rewards_work_page.dart';
import 'package:agro/features/premium/presentation/rewards_info_page.dart';

class CentroRecompensasPage extends ConsumerStatefulWidget {
  const CentroRecompensasPage({super.key});

  @override
  ConsumerState<CentroRecompensasPage> createState() => _CentroRecompensasPageState();
}

class _CentroRecompensasPageState extends ConsumerState<CentroRecompensasPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _desafiosKey = GlobalKey();

  void _scrollToDesafios() {
    final context = _desafiosKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = ref.watch(userRewardProgressProvider);

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
          'Centro de recompensas',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Círculo de nivel con diseño de la imagen
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF8B6F47),
                      width: 8,
                    ),
                    gradient: const RadialGradient(
                      colors: [
                        Color(0xFF9ACD32),
                        Color(0xFF7CB342),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.emoji_nature,
                      size: 50,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Texto de caducidad
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 14,
                      color: Color(0xFF0066CC),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Las recompensas se restablecen cada campaña',
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color(0xFF0066CC),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Bienvenida al nivel
              Text(
                'Bienvenido/a al nivel ${progress.currentLevel}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '¡Buen trabajo! Completa otro desafío para desbloquear tu siguiente recompensa.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),

              // Botón principal
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _scrollToDesafios,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.actionGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Elige un desafío',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Header de Recompensas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recompensas',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const RewardsInfoPage()),
                      );
                    },
                    child: const Text(
                      'Más información',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.actionGreen,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Lista de Productores con diseño de la imagen
              _buildProducerItem(
                context: context,
                level: 1,
                icon: Icons.eco,
                iconColor: const Color(0xFF9ACD32),
                title: 'Productor\nInicial',
                isUnlocked: true,
              ),
              const SizedBox(height: 10),
              _buildProducerItem(
                context: context,
                level: 2,
                icon: Icons.emoji_events,
                iconColor: const Color(0xFFDAA520),
                title: 'Productor\nBásico',
                isUnlocked: false,
              ),
              const SizedBox(height: 10),
              _buildProducerItem(
                context: context,
                level: 3,
                icon: Icons.bar_chart,
                iconColor: const Color(0xFF4682B4),
                title: 'Productor\nTécnico',
                isUnlocked: false,
              ),
              const SizedBox(height: 10),
              _buildProducerItem(
                context: context,
                level: 4,
                icon: Icons.workspace_premium,
                iconColor: const Color(0xFF9370DB),
                title: 'Productor\nAvanzado',
                isUnlocked: false,
              ),
              const SizedBox(height: 10),
              _buildProducerItem(
                context: context,
                level: 5,
                icon: Icons.military_tech,
                iconColor: const Color(0xFFFF8C00),
                title: 'Productor\nCertificado',
                isUnlocked: false,
              ),
              const SizedBox(height: 10),
              _buildProducerItem(
                context: context,
                level: 6,
                icon: Icons.stars,
                iconColor: const Color(0xFFB8860B),
                title: 'Productor\nReferente',
                isUnlocked: false,
              ),
              const SizedBox(height: 32),

              // Sección Desafíos
              Container(
                key: _desafiosKey,
                child: const Text(
                  'Desafíos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              _buildChallengeCard(
                context: context,
                title: 'Conoce tu cafetal',
                description:
                    '¡Bien hecho! Al registrar tu cafetal, has completado este desafío.',
                isCompleted: true,
              ),
              const SizedBox(height: 12),
              _buildChallengeCard(
                context: context,
                title: 'Usa el plan',
                description:
                    '¡Bien hecho! Al usar el plan de fertilización has completado este desafío.',
                isCompleted: false,
              ),
              const SizedBox(height: 12),
              _buildChallengeCard(
                context: context,
                title: 'Registra una acción',
                description:
                    'Completa este desafío registrando la fertilización o aplicación de otros productos.',
                isCompleted: false,
              ),
              const SizedBox(height: 24),

              // Sección Cómo funciona
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HowRewardsWorkPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cómo funciona',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Aprende a subir de nivel y desbloquea tus recompensas',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF6B7280),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: AppColors.actionGreen,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Texto final con link
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Para más detalles sobre el programa de recompensas, consulta los ',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Abriendo términos y condiciones'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Text(
                      'términos y condiciones',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.actionGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget de productor con diseño de la imagen + navegación original
  Widget _buildProducerItem({
    required BuildContext context,
    required int level,
    required IconData icon,
    required Color iconColor,
    required String title,
    required bool isUnlocked,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          // Ícono circular
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor.withOpacity(0.2),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          // Título
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
                height: 1.3,
              ),
            ),
          ),
          // Badge de estado
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: isUnlocked
                  ? AppColors.actionGreen
                  : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              isUnlocked ? '✓ desbloqueado' : '🔒 bloqueado',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget de desafío con diseño de la imagen + navegación
  Widget _buildChallengeCard({
    required BuildContext context,
    required String title,
    required String description,
    required bool isCompleted,
  }) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Abriendo desafío: $title'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Column(
          children: [
            // Header con imagen
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: isCompleted
                    ? const Color(0xFFE8F5E9)
                    : const Color(0xFFF5F5F5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Icon(
                  isCompleted ? Icons.check_circle : Icons.pending,
                  size: 40,
                  color: isCompleted
                      ? AppColors.actionGreen
                      : Colors.grey.shade400,
                ),
              ),
            ),
            // Contenido
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.actionGreen,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isCompleted
                                  ? 'Desafío ya completado'
                                  : 'Completando desafío: $title',
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.actionGreen,
                        side: const BorderSide(color: AppColors.actionGreen),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        isCompleted ? 'Completado' : 'Completar',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}