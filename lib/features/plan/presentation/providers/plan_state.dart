//lib/features/plan/presentation/providers/plan_state.dart
import 'package:agro/features/plan/domain/entities/plan_item.dart';

class PlanState {
  final bool loading;
  final List<PlanItem> plans;

  const PlanState({required this.loading, required this.plans});

  factory PlanState.initial() {
    return const PlanState(loading: true, plans: []);
  }

  PlanState copyWith({bool? loading, List<PlanItem>? plans}) {
    return PlanState(
      loading: loading ?? this.loading,
      plans: plans ?? this.plans,
    );
  }
}
