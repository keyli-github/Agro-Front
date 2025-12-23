// lib/features/plan/domain/repositories/plan_repository.dart
import '../entities/plan_item.dart';

abstract class PlanRepository {
  // Streams son mejores para UI instantánea (WhatsApp style)
  Stream<List<PlanItem>> watchPlans(); 
  Future<void> syncPlans(); // Se llama en el background
  Future<void> addPlan(PlanItem plan);
}