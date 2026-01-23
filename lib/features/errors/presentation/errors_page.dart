import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:agro/shared/widgets/agro_page_layout.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/features/errors/presentation/providers/errors_providers.dart';
import 'package:agro/features/errors/presentation/widgets/cafetal_profile_card.dart';
import 'package:agro/features/errors/presentation/widgets/action_buttons.dart';
import 'package:agro/features/errors/presentation/widgets/local_data_card.dart';
import 'package:agro/features/errors/presentation/widgets/advice_card.dart';
import 'package:agro/features/errors/presentation/widgets/recommendation_card.dart';
import 'package:agro/features/errors/presentation/widgets/advisor_card.dart';
import 'package:agro/features/profile/presentation/register_cafatal_wizard_page.dart';

class ErrorsPage extends ConsumerWidget {
  const ErrorsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cafatalProfile = ref.watch(cafatalProfileProvider);
    final recommendations = ref.watch(recommendationsProvider);
    final advisor = ref.watch(advisorProvider);
    final localData = ref.watch(localDataProvider);
    final advice = ref.watch(adviceProvider);

    return AgroPageLayout(
      title: 'Evitar errores',
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Perfil del cafetal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CafatalProfileCard(
                profile: cafatalProfile,
                onPersonalize: () {
                  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => const RegisterCafatalWizardPage()));
                },
              ),
            ),
            const SizedBox(height: 20),

            // Botones de acción
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ActionButtons(
                onRevise: () {
                  GoRouter.of(context).push('/review_cafetal_detail');
                },
                onFumigate: () {
                  GoRouter.of(context).push('/fumigate_detail');
                },
                onFertilize: () {
                  GoRouter.of(context).push('/fertilize_detail');
                },
                onNothing: () {
                  GoRouter.of(context).push('/nothing_detail');
                },
              ),
            ),
            const SizedBox(height: 20),

            // Datos locales
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LocalDataCard(data: localData),
            ),
            const SizedBox(height: 20),

            // Programas, bonos y proyectos
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push('/programs_detail');
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.actionGreen.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.home_outlined,
                          color: AppColors.actionGreen,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Programas, bonos y proyectos vigentes',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textDark,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Apoyos y beneficios\ndisponibles en tu\nzona',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textLight,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.actionGreen,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sección de consejos
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Consejos',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...advice.map((adv) => Column(
                    children: [
                      AdviceCard(
                        advice: adv,
                        onTap: () {
                          GoRouter.of(context).push('/crop_advice_detail');
                        },
                      ),
                      const SizedBox(height: 12),
                    ],
                  )),
                ],
              ),
            ),

            // Sección de recomendaciones
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recomendaciones',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...recommendations.map((rec) => Column(
                    children: [
                      RecommendationCard(recommendation: rec),
                      const SizedBox(height: 12),
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Asesor
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AdvisorCard(
                advisor: advisor,
                onContact: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Funcionalidad próximamente...')),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
