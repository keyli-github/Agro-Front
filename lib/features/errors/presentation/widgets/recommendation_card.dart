// lib/features/errors/presentation/widgets/recommendation_card.dart
import 'package:flutter/material.dart';
import 'package:agro/features/errors/domain/entities/recommendation.dart';
import 'package:go_router/go_router.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'progress_circle_indicator.dart';

class RecommendationCard extends StatelessWidget {
  final Recommendation recommendation;

  const RecommendationCard({
    super.key,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.push('/centro_recompensas'),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: AppTheme.cardDecoration(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left: progress circle
              ProgressCircleIndicator(
                currentLevel: recommendation.level,
                totalLevels: 3,
                size: 92,
              ),
              const SizedBox(width: 16),

              // Right: texts and button
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            recommendation.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1B1B1B),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Nivel ${recommendation.level}',
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF0F766E)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      recommendation.description,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => context.push('/centro_recompensas'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.actionGreen,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                        ),
                        child: const Text('Elige un desafío', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}