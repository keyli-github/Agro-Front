//lib/features/plan/data/repositories/plan_repository_impl.dart
import 'package:isar_community/isar.dart';
import '../../domain/entities/plan_item.dart';
import '../../domain/repositories/plan_repository.dart';

class PlanRepositoryImpl implements PlanRepository {
  final Isar _isar;
  PlanRepositoryImpl(this._isar);

  @override
  Stream<List<PlanItem>> watchPlans() {
    return _isar.planItems.where().watch(fireImmediately: true);
  }

  @override
  Future<void> addPlan(PlanItem plan) async {
    await _isar.writeTxn(() async {
      await _isar.planItems.put(plan);
    });
  }

  @override
  Future<void> syncPlans() async {}
}