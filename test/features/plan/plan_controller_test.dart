// test/features/plan/plan_controller_test.dart
import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/features/plan/domain/entities/plan_item.dart';
import 'package:agro/features/plan/domain/repositories/plan_repository.dart';
import 'package:agro/features/plan/presentation/providers/plan_provider.dart';

class ImmediateFakePlanRepository implements PlanRepository {
  final List<PlanItem> _plans = [
    PlanItem(planId: '1', title: 'Parcela Cacao', crop: 'cacao'),
    PlanItem(planId: '2', title: 'Parcela Plátano', crop: 'platano'),
  ];

  final _controller = StreamController<List<PlanItem>>.broadcast();

  @override
  Stream<List<PlanItem>> watchPlans() {
    _controller.add(List.unmodifiable(_plans));
    return _controller.stream;
  }

  @override
  Future<void> addPlan(PlanItem plan) async {
    _plans.insert(0, plan);
    _controller.add(List.unmodifiable(_plans));
  }

  @override
  Future<void> syncPlans() async {}
}

void main() {
  test('PlanController agrega item y el StreamProvider reacciona correctamente', () async {
    final repo = ImmediateFakePlanRepository();
    final container = ProviderContainer(
      overrides: [
        planRepositoryProvider.overrideWithValue(repo),
      ],
    );

    // Escuchar para activar el provider
    container.listen(plansStreamProvider, (prev, next) {});

    // Act: Agregamos una parcela
    await container.read(planControllerProvider.notifier).addCacao();

    // Assert
    final state = container.read(plansStreamProvider);
    
    expect(state.value?.length, 3);
    expect(state.value?.first.crop, 'cacao');
  });
}