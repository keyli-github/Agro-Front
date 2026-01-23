// lib/features/errors/presentation/widgets/cafetal_profile_card.dart
import 'package:flutter/material.dart';
import 'package:agro/features/errors/domain/entities/cafetal_profile.dart';
import 'package:agro/core/theme/app_theme.dart';

class CafatalProfileCard extends StatelessWidget {
  final CafatalProfile profile;
  final VoidCallback onPersonalize;

  const CafatalProfileCard({
    super.key,
    required this.profile,
    required this.onPersonalize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.cardDecoration(),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con avatar y nombre
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.actionGreen.withOpacity(0.15),
                      AppColors.actionGreen.withOpacity(0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.actionGreen.withOpacity(0.2),
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  Icons.person_outline,
                  color: AppColors.actionGreen,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Perfil técnico del cafetal',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1B1B1B),
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      profile.ownerName,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6B7280),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Información técnica
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _buildInfoRow('Ubicación', profile.location),
                const SizedBox(height: 10),
                _buildInfoRow('Altitud aprox.', profile.altitude ?? '-'),
                const SizedBox(height: 10),
                _buildInfoRow('Variedad', profile.variety ?? '-'),
                const SizedBox(height: 10),
                _buildInfoRow('Etapa', 'floración'),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Botón Personalizar
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onPersonalize,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.actionGreen,
                foregroundColor: Colors.white,
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Personalizar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Checkbox info
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.actionGreen.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.actionGreen.withOpacity(0.2),
                width: 1.5,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 18,
                  height: 18,
                  margin: const EdgeInsets.only(top: 1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: AppColors.actionGreen,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 12,
                    color: AppColors.actionGreen,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: const Text(
                    'Completa el perfil para poder usar estas herramientas básicas',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF166534),
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• $label:',
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF1B1B1B),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}