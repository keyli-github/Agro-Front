import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class RewardCard extends StatelessWidget {
  // Colores coherentes con el diseño principal
  static const Color _primaryTeal = AppColors.actionGreen;
  static const Color _secondaryAmber = Color(0xFFF39C12);
  static const Color _dangerRed = Color(0xFFE74C3C);
  final String title;
  final String description;
  final int level;
  final bool isLocked;
  final String actionButtonLabel;
  final VoidCallback? onActionTap;

  const RewardCard({
    super.key,
    required this.title,
    required this.description,
    required this.level,
    this.isLocked = false,
    required this.actionButtonLabel,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppTheme.cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con título y badge de nivel
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(color: Colors.grey[600]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Badge del nivel en la esquina superior derecha
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _getLevelColor(level).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Nivel $level',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _getLevelColor(level),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Botón de acción centrado dentro de la tarjeta
          SizedBox(
            width: double.infinity,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.6,
                child: ElevatedButton(
                  onPressed: isLocked ? null : onActionTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isLocked ? Colors.grey[300] : AppColors.actionGreen,
                    foregroundColor: isLocked ? Colors.grey[600] : Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                  child: Text(
                    actionButtonLabel,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getLevelColor(int level) {
    switch (level) {
      case 1:
        return _primaryTeal;
      case 2:
        return _secondaryAmber;
      case 3:
        return _dangerRed;
      default:
        return Colors.grey;
    }
  }
}
