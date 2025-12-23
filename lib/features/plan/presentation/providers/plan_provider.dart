//lib/features/plan/presentation/providers/plan_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/main.dart'; 
import '../../domain/entities/plan_item.dart';
import '../../data/repositories/plan_repository_impl.dart';
import '../../domain/repositories/plan_repository.dart';

final planRepositoryProvider = Provider<PlanRepository>((ref) {
  return PlanRepositoryImpl(isar);
});

final plansStreamProvider = StreamProvider<List<PlanItem>>((ref) {
  return ref.watch(planRepositoryProvider).watchPlans();
});

class PlanController extends StateNotifier<AsyncValue<void>> {
  final PlanRepository _repo;
  PlanController(this._repo) : super(const AsyncData(null));

  Future<void> addCacao() async {
    // CORRECCIÓN: El parámetro es planId, no id.
    final newItem = PlanItem(
      planId: DateTime.now().toIso8601String(),
      title: 'Parcela Cacao ${DateTime.now().second}',
      crop: 'cacao',
    );
    await _repo.addPlan(newItem);
  }
}

final planControllerProvider = StateNotifierProvider<PlanController, AsyncValue<void>>((ref) {
  return PlanController(ref.watch(planRepositoryProvider));
});