// lib/features/errors/domain/entities/advice.dart

class Advice {
  final String id;
  final String title;
  final String description;
  final String icon;
  final String? moreInfo;

  Advice({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    this.moreInfo,
  });
}
