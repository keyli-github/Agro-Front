/// Entidad que representa un desafío en el sistema de recompensas
class Challenge {
  final String id;
  final int level;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime? completedAt;
  final String? reward;

  const Challenge({
    required this.id,
    required this.level,
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.completedAt,
    this.reward,
  });

  /// Crea una copia del Challenge con los parámetros opcionales reemplazados
  Challenge copyWith({
    String? id,
    int? level,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? completedAt,
    String? reward,
  }) {
    return Challenge(
      id: id ?? this.id,
      level: level ?? this.level,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      completedAt: completedAt ?? this.completedAt,
      reward: reward ?? this.reward,
    );
  }

  @override
  String toString() => 'Challenge(id: $id, level: $level, title: $title)';
}
