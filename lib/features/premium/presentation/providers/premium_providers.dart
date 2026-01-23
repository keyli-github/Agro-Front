import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/features/premium/domain/entities/challenge.dart';
import 'package:agro/features/premium/domain/entities/user_reward_progress.dart';

/// Provider que maneja la lista de desafíos disponibles
/// En el futuro, esto vendrá de una base de datos o API
final challengesProvider = StateProvider<List<Challenge>>((ref) {
  return [
    Challenge(
      id: '1',
      level: 1,
      title: 'Ficha registrada',
      description: '¡Bien hecho! Al personalizar la ficha técnica, has completado este desafío.',
      isCompleted: true,
      completedAt: DateTime.now(),
      reward: 'recomendaciones según tus datos',
    ),
    Challenge(
      id: '2',
      level: 2,
      title: 'recomendación nutricional básica',
      description: 'Disfruta de recomendaciones específicas según tu ubicación, y tu condiciones de tu cafetal',
      isCompleted: false,
      reward: 'análisis nutricional',
    ),
    Challenge(
      id: '3',
      level: 3,
      title: 'certificado de productor tecnificado y perfil destacado.',
      description: 'Disfruta de recomendaciones específicas según tu ubicación, y tu condiciones de tu cafetal',
      isCompleted: false,
      reward: 'certificación profesional',
    ),
  ];
});

/// Provider que maneja el progreso del usuario en el sistema de recompensas
final userRewardProgressProvider = StateProvider<UserRewardProgress>((ref) {
  return UserRewardProgress(
    userId: 'user_001',
    currentLevel: 1,
    totalPointsEarned: 100,
    pointsForNextLevel: 200,
    unlockedRewards: ['recomendaciones según tus datos'],
    lastRewardDate: DateTime.now(),
  );
});

/// Provider que retorna el desafío actual basado en el nivel del usuario
final currentChallengeProvider = FutureProvider<Challenge?>((ref) async {
  final progress = ref.watch(userRewardProgressProvider);
  final challenges = ref.watch(challengesProvider);

  try {
    // Simular un pequeño delay para asemejar una llamada a BD
    await Future.delayed(const Duration(milliseconds: 100));

    // Encontrar el desafío actual
    final currentChallenge = challenges.where(
      (c) => c.level == progress.currentLevel + 1,
    ).firstOrNull;

    return currentChallenge;
  } catch (e) {
    throw Exception('Error al obtener el desafío actual: $e');
  }
});

/// Provider que retorna los desafíos completados
final completedChallengesProvider = Provider<List<Challenge>>((ref) {
  final challenges = ref.watch(challengesProvider);
  return challenges.where((c) => c.isCompleted).toList();
});

/// Provider que retorna los desafíos disponibles
final availableChallengesProvider = Provider<List<Challenge>>((ref) {
  final challenges = ref.watch(challengesProvider);
  return challenges.where((c) => !c.isCompleted).toList();
});
