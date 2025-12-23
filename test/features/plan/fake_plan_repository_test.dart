// lib/test/features/plan/fake_plan_repository_test.dart
import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:agro/features/plan/domain/entities/plan_item.dart';
import 'package:agro/features/plan/domain/repositories/plan_repository.dart';

// Usamos un Fake porque el real necesita una base de datos Isar abierta
class FakePlanRepository implements PlanRepository {
  final _controller = StreamController<List<PlanItem>>.broadcast();
  final List<PlanItem> _items = [
    PlanItem(planId: '1', title: 'Parcela 1', crop: 'cacao'),
    PlanItem(planId: '2', title: 'Parcela 2', crop: 'platano'),
  ];

  @override
  Stream<List<PlanItem>> watchPlans() async* {
    yield _items;
    yield* _controller.stream;
  }

  @override
  Future<void> addPlan(PlanItem plan) async {
    _items.insert(0, plan);
    _controller.add(_items);
  }

  @override
  Future<void> syncPlans() async {}
}

void main() {
  group('PlanRepository Fake Test', () {
    test('watchPlans emite estado inicial y reacciona a nuevos items', () async {
      final repo = FakePlanRepository();
      // CORRECCIÓN: planId en lugar de id, y sin 'const'
      final newItem = PlanItem(planId: '3', title: 'Nueva Parcela', crop: 'cacao');

      expectLater(
        repo.watchPlans(),
        emitsInOrder([
          predicate<List<PlanItem>>((list) => list.length == 2),
          predicate<List<PlanItem>>((list) => list.length == 3 && list.first.planId == '3'),
        ]),
      );

      await repo.addPlan(newItem);
    });
  });
}