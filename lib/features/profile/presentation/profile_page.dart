import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/core/providers/user_provider.dart';
import 'package:agro/features/errors/presentation/providers/errors_providers.dart';
import 'certificate_page.dart';
import 'trainings_page.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    final profile = ref.watch(cafatalProfileProvider);
    
    // Datos de ejemplo - puedes conectarlos con tu provider real
    const int soilAnalysisCount = 0;
    const int trainingsCount = 0;
    const double certificationProgress = 12.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil', style: TextStyle(color: AppColors.textDark)),
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: AppColors.textDark),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.textDark),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header con foto de perfil
              Container(
                color: AppColors.surfaceWhite,
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300, width: 2),
                          ),
                          child: const Center(
                            child: Icon(Icons.person, size: 60, color: Colors.grey),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: AppColors.actionGreen,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.surfaceWhite, width: 2),
                            ),
                            child: const Icon(Icons.add, color: AppColors.surfaceWhite, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),

              // Información del usuario
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nombre y Username
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: AppTheme.cardDecoration().copyWith(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userState.username ?? profile.ownerName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '@${userState.username?.toLowerCase() ?? 'Ney5263'} • se unió el enero del 2026',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textLight,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Productor de ${profile.variety ?? 'café'}, ${profile.area ?? '0'} ha en ${profile.location}.',
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Cultivo y Nivel de Productor
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            'Cultivo:',
                            profile.variety ?? 'Café',
                            Icons.local_cafe,
                            AppColors.actionGreen,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildInfoCard(
                            'Productor',
                            'Inicial',
                            Icons.eco,
                            Color(0xFF7CB342),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Resumen de tu campaña
                    const Text(
                      'Resumen de tu campaña',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            'Análisis de suelo realizados',
                            soilAnalysisCount.toString(),
                            Icons.science,
                            Color(0xFF7E57C2),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildStatCard(
                            'Días desde la última fertilización',
                            '?',
                            Icons.help_outline,
                            AppColors.textLight,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Estado técnico
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: AppTheme.cardDecoration().copyWith(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Estado técnico:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: AppColors.actionGreen,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Estable',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Logros',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CertificatePage()));
                            },
                            child: _buildAchievementCard(
                              'Certificado de productor',
                              certificationProgress,
                              Icons.workspace_premium,
                              Color(0xFFFFB74D),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TrainingsPage()));
                            },
                            child: _buildAchievementCard(
                              'Capacitaciones',
                              trainingsCount.toDouble(),
                              Icons.school,
                              Color(0xFFFFD54F),
                              isCount: true,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: AppTheme.cardDecoration().copyWith(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: AppTheme.cardDecoration().copyWith(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textDark,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(String label, double value, IconData icon, Color iconColor, {bool isCount = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: AppTheme.cardDecoration().copyWith(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textDark,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 32),
            ),
          ),
          const SizedBox(height: 12),
          if (!isCount)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.actionGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${value.toStringAsFixed(2)} % completa',
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.surfaceWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          else
            Center(
              child: Text(
                value.toInt().toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
            ),
        ],
      ),
    );
  }
}