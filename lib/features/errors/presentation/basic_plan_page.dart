import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class BasicPlanPage extends StatelessWidget {
  final String? selectedProgram;

  const BasicPlanPage({super.key, this.selectedProgram});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Apoyos y beneficios disponibles',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Programas, bonos y proyectos vigentes',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 20),

              // Registro y acceso básico
              _buildProgramItem(
                title: 'Registro y acceso',
                subtitle: 'básico',
                isSelected: selectedProgram == 'Registro y acceso básico',
                onTap: () {},
              ),
              const SizedBox(height: 16),

              // Cofinanciamiento no reembolsable
              _buildProgramItem(
                title: 'Cofinanciamiento',
                subtitle: 'no reembolsable',
                isSelected: selectedProgram == 'Cofinanciamiento no reembolsable',
                onTap: () {},
              ),
              const SizedBox(height: 16),

              // Seguros agrícolas
              _buildProgramItem(
                title: 'Seguros',
                subtitle: 'agrícolas',
                isSelected: selectedProgram == 'Seguros agrícolas',
                onTap: () {},
              ),
              const SizedBox(height: 16),

              // Créditos y financiamiento reembolsable
              _buildProgramItem(
                title: 'Créditos y',
                subtitle: 'financiamiento reembolsable',
                isSelected: selectedProgram == 'Créditos y financiamiento reembolsable',
                onTap: () {},
              ),
              const SizedBox(height: 16),

              // Beneficios tributarios
              _buildProgramItem(
                title: 'Beneficios',
                subtitle: 'tributarios',
                isSelected: selectedProgram == 'Beneficios tributarios',
                onTap: () {},
              ),
              const SizedBox(height: 16),

              // Otros apoyos directos
              _buildProgramItem(
                title: 'Otros apoyos',
                subtitle: 'directos',
                isSelected: selectedProgram == 'Otros apoyos directos',
                onTap: () {},
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgramItem({
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.actionGreen.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.textLight,
            size: 16,
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: onTap,
            child: const Text(
              'Ver información relevante',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.actionGreen,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}