// lib/features/errors/presentation/widgets/action_buttons.dart
import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onRevise;
  final VoidCallback onFumigate;
  final VoidCallback onFertilize;
  final VoidCallback onNothing;

  const ActionButtons({
    super.key,
    required this.onRevise,
    required this.onFumigate,
    required this.onFertilize,
    required this.onNothing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '¿Qué vas a hacer hoy en tu cafetal?',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1B1B1B),
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 18),
          // Grid de botones
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  icon: Icons.search,
                  label: 'Revisar cafetal',
                  color: AppColors.actionGreen,
                  backgroundColor: AppColors.actionGreen.withOpacity(0.08),
                  onTap: onRevise,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActionButton(
                  icon: Icons.water_drop_outlined,
                  label: 'Fumigar',
                  color: AppColors.actionGreen,
                  backgroundColor: AppColors.actionGreen.withOpacity(0.08),
                  onTap: onFumigate,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  icon: Icons.eco_outlined,
                  label: 'Fertilizar',
                  color: AppColors.actionGreen,
                  backgroundColor: AppColors.actionGreen.withOpacity(0.08),
                  onTap: onFertilize,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActionButton(
                  icon: Icons.event_busy_outlined,
                  label: 'Nada hoy',
                  color: const Color(0xFF6B7280),
                  backgroundColor: const Color(0xFFF3F4F6),
                  onTap: onNothing,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: color.withOpacity(0.15),
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: color,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}