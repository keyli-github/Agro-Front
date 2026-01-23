// lib/features/errors/domain/entities/recommendation.dart

class Recommendation {
  final String id;
  final String title;
  final String description;
  final int level; // 1-5 para prioridad
  final String badge;

  Recommendation({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.badge,
  });
}
