/// Entidad que representa el progreso de un usuario en el sistema de recompensas
class UserRewardProgress {
  final String userId;
  final int currentLevel;
  final int totalPointsEarned;
  final int pointsForNextLevel;
  final List<String> unlockedRewards;
  final DateTime lastRewardDate;

  const UserRewardProgress({
    required this.userId,
    required this.currentLevel,
    required this.totalPointsEarned,
    required this.pointsForNextLevel,
    required this.unlockedRewards,
    required this.lastRewardDate,
  });

  /// Calcula el porcentaje de progreso hacia el siguiente nivel
  double get progressPercentage {
    if (pointsForNextLevel == 0) return 1.0;
    return (totalPointsEarned / pointsForNextLevel).clamp(0.0, 1.0);
  }

  /// Verifica si el usuario puede subir de nivel
  bool get canLevelUp => totalPointsEarned >= pointsForNextLevel;

  UserRewardProgress copyWith({
    String? userId,
    int? currentLevel,
    int? totalPointsEarned,
    int? pointsForNextLevel,
    List<String>? unlockedRewards,
    DateTime? lastRewardDate,
  }) {
    return UserRewardProgress(
      userId: userId ?? this.userId,
      currentLevel: currentLevel ?? this.currentLevel,
      totalPointsEarned: totalPointsEarned ?? this.totalPointsEarned,
      pointsForNextLevel: pointsForNextLevel ?? this.pointsForNextLevel,
      unlockedRewards: unlockedRewards ?? this.unlockedRewards,
      lastRewardDate: lastRewardDate ?? this.lastRewardDate,
    );
  }

  @override
  String toString() => 'UserRewardProgress(userId: $userId, level: $currentLevel)';
}
