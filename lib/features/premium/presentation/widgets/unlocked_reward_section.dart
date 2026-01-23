import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/features/premium/presentation/providers/premium_providers.dart';

class UnlockedRewardSection extends ConsumerWidget {
  final VoidCallback? onChooseChallengePressed;

  const UnlockedRewardSection({
    super.key,
    this.onChooseChallengePressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(userRewardProgressProvider);
    final currentChallenge = ref.watch(currentChallengeProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Indicador de progreso circular
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Círculo de fondo
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.actionGreen.withOpacity(0.2),
                      width: 8,
                    ),
                  ),
                ),
                // Círculo de progreso (sin animación por ahora)
                SizedBox.expand(
                  child: CircularProgressIndicator(
                    value: progress.progressPercentage,
                    strokeWidth: 8,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      progress.canLevelUp
                          ? AppColors.actionGreen
                          : AppColors.actionGreen.withOpacity(0.5),
                    ),
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
                // Texto del nivel en el centro
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'NIVEL',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${progress.currentLevel}',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B1B1B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Información de recompensa desbloqueada
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.actionGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: AppColors.actionGreen,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Recompensa desbloqueada',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.actionGreen,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Mensaje de bienvenida al nivel
          Text(
            'Bienvenido/a al nivel ${progress.currentLevel}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B1B1B),
            ),
          ),
          const SizedBox(height: 12),

          // Descripción del siguiente paso
          Text(
            'Completa otro desafío para\npoder usar estas herramientas ...',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          // Botón primario: Elige un desafío
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onChooseChallengePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.actionGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Elige un desafío',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Información adicional
          if (currentChallenge.hasValue && currentChallenge.value != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Siguiente desafío',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          currentChallenge.value!.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1B1B1B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          else if (currentChallenge.isLoading)
            Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.actionGreen,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
