//lib/features/plan/presentation/plan_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/core/constants/app_constants.dart';
import 'package:agro/features/plan/domain/entities/plan_item.dart';
import 'package:agro/features/plan/presentation/providers/plan_provider.dart';
import 'package:agro/shared/widgets/primary_button.dart';
import 'package:agro/shared/widgets/app_card.dart';

class PlanPage extends ConsumerWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 👇 Stream offline-first
    final plansAsync = ref.watch(plansStreamProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Column(
                  children: [
                    // ================= HEADER =================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Plan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                              onPressed: () => _showOptionsMenu(context),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () => _showSearchDialog(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),

                    // ================= LISTA =================
                    Expanded(
                      child: plansAsync.when(
                        data: (plans) {
                          if (plans.isEmpty) {
                            return const Center(
                              child: Text(
                                'No hay parcelas registradas',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }

                          return ListView.builder(
                            padding: const EdgeInsets.only(bottom: 12),
                            itemCount: plans.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: AppCard(
                                  padding: const EdgeInsets.all(12),
                                  child: _PlanCardContent(
                                    plan: plans[index],
                                  ),
                                ),
                              );
                            },
                          );
                        },

                        // ⚠️ Offline-first → no bloquear UI
                        loading: () => const SizedBox(),

                        error: (e, _) => const Center(
                          child: Text(
                            'Error al cargar los planes',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ================= BOTÓN =================
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 10, 28, 28),
              child: PrimaryButton(
                onPressed: () =>
                    ref.read(planControllerProvider.notifier).addCacao(),
                child: const Text(
                  '+ Cacao',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= MODALS =================

  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.backgroundBeige,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          ListTile(
            leading: Icon(Icons.filter_list),
            title: Text('Filtrar parcelas'),
          ),
          ListTile(
            leading: Icon(Icons.sort),
            title: Text('Ordenar'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuración'),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.backgroundBeige,
        title: const Text('Buscar parcela'),
        content: TextField(
          decoration: InputDecoration(
            hintText: 'Nombre de la parcela...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(AppSizes.borderRadius),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Buscar'),
          ),
        ],
      ),
    );
  }
}

// ================= CARD =================

class _PlanCardContent extends StatelessWidget {
  final PlanItem plan;

  const _PlanCardContent({required this.plan});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              plan.crop == 'cacao'
                  ? AppAssets.cacao
                  : AppAssets.platano,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 5,
            child: Text(
              plan.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.3,
                color: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
