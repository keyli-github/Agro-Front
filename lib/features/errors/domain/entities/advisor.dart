// lib/features/errors/domain/entities/advisor.dart

class Advisor {
  final String id;
  final String name;
  final String image;
  final double rating;
  final int reviewsCount;

  Advisor({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.reviewsCount,
  });
}
