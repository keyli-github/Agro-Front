import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/features/premium/presentation/reward_detail_page.dart';

class RewardsInfoPage extends StatelessWidget {
  const RewardsInfoPage({super.key});

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
          'Recompensas',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Acepta divertidos desafíos para avanzar de nivel y ganar emocionantes recompensas cada mes.',
              style: TextStyle(fontSize: 15, height: 1.35, color: AppColors.textDark),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.info_outline, size: 16, color: Color(0xFF0066CC)),
                const SizedBox(width: 4),
                const Text(
                  'Las recompensas se restablecen cada campaña',
                  style: TextStyle(fontSize: 13, color: Color(0xFF0066CC)),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildRewardCard(
              level: 1,
              title: 'Productor Inicial',
              description: 'Estas empezando a manejar tu cafetal con criterio',
              icon: Icons.eco,
              iconColor: const Color(0xFF6B8E23),
              isUnlocked: true,
              buttonType: _ButtonType.access,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RewardDetailPage(level: 1, isUnlocked: true))),
            ),
            const SizedBox(height: 12),

            _buildRewardCard(
              level: 2,
              title: 'Productor Básico',
              description: 'Ya no improvisas, sigues un plan',
              icon: Icons.menu_book,
              iconColor: const Color(0xFFD4A574),
              isUnlocked: false,
              buttonType: _ButtonType.complete,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RewardDetailPage(level: 2, isUnlocked: false))),
            ),
            const SizedBox(height: 12),

            _buildRewardCard(
              level: 3,
              title: 'Productor Técnico',
              description: 'Tomas decisiones con lógica técnica',
              icon: Icons.trending_up,
              iconColor: const Color(0xFF4A7BA7),
              isUnlocked: false,
              buttonType: _ButtonType.none,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RewardDetailPage(level: 3, isUnlocked: false))),
            ),
            const SizedBox(height: 12),

            _buildRewardCard(
              level: 4,
              title: 'Productor Analizado',
              description: 'Tu cafetal tiene respaldo técnico profesional',
              icon: Icons.explore,
              iconColor: const Color(0xFF8B5A8E),
              isUnlocked: false,
              buttonType: _ButtonType.none,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RewardDetailPage(level: 4, isUnlocked: false))),
            ),
            const SizedBox(height: 12),

            _buildRewardCard(
              level: 5,
              title: 'Productor Certificado',
              description: 'Agricultor formal, listo para programas y proyectos',
              icon: Icons.workspace_premium,
              iconColor: const Color(0xFFCD7F32),
              isUnlocked: false,
              buttonType: _ButtonType.none,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RewardDetailPage(level: 5, isUnlocked: false))),
            ),
            const SizedBox(height: 12),

            _buildRewardCard(
              level: 6,
              title: 'Productor Referente',
              description: 'Modelo productivo de la zona',
              icon: Icons.emoji_events,
              iconColor: const Color(0xFFDAA520),
              isUnlocked: false,
              buttonType: _ButtonType.none,
              showTrophy: true,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RewardDetailPage(level: 6, isUnlocked: false))),
            ),

            const SizedBox(height: 20),
            const Text(
              'Las recompensas porcentuales se calculan de forma mensual, se acumulan diariamente',
              style: TextStyle(fontSize: 13, color: Color(0xFF6B7280), height: 1.4),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardCard({
    required int level,
    required String title,
    required String description,
    required IconData icon,
    required Color iconColor,
    required bool isUnlocked,
    required _ButtonType buttonType,
    bool showTrophy = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconColor.withOpacity(0.2),
                    border: Border.all(color: iconColor, width: 3),
                  ),
                  child: Center(
                    child: Icon(icon, color: iconColor, size: 30),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'NIVEL $level',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF6B7280),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          if (!isUnlocked)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF6B7280),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: const [
                                  Icon(Icons.lock, size: 12, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    'bloqueado',
                                    style: TextStyle(fontSize: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          else
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.actionGreen,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: const [
                                  Icon(Icons.check_circle, size: 12, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    'desbloqueado',
                                    style: TextStyle(fontSize: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark,
                              ),
                            ),
                          ),
                          if (showTrophy)
                            const Text('🏆', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280), height: 1.4),
            ),
            if (buttonType != _ButtonType.none) ...[
              const SizedBox(height: 12),
              if (buttonType == _ButtonType.access)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.actionGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      'Acceder a recompensa',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              else if (buttonType == _ButtonType.complete)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.actionGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      'Completar el desafío',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

enum _ButtonType { access, complete, none }