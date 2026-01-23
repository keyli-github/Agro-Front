import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'basic_plan_page.dart';

class ProgramsDetailPage extends StatelessWidget {
  const ProgramsDetailPage({super.key});

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
              _buildProgramCard(
                title: 'Registro y acceso\nbásico',
                icon: Icons.app_registration,                programKey: 'Registro y acceso básico',                context: context,
              ),
              const SizedBox(height: 16),

              // Cofinanciamiento no reembolsable
              _buildProgramCard(
                title: 'Cofinanciamiento\nno reembolsable',
                icon: Icons.account_balance_wallet,
                programKey: 'Cofinanciamiento no reembolsable',
                context: context,
              ),
              const SizedBox(height: 16),

              // Seguros agrícolas
              _buildProgramCard(
                title: 'Seguros\nagrícolas',
                icon: Icons.security,
                programKey: 'Seguros agrícolas',
                context: context,
              ),
              const SizedBox(height: 16),

              // Créditos y financiamiento reembolsable
              _buildProgramCard(
                title: 'Créditos y\nfinanciamiento\nreembolsable',
                icon: Icons.credit_card,
                programKey: 'Créditos y financiamiento reembolsable',
                context: context,
              ),
              const SizedBox(height: 16),

              // Beneficios tributarios
              _buildProgramCard(
                title: 'Beneficios\ntributarios',
                icon: Icons.receipt,
                programKey: 'Beneficios tributarios',
                context: context,
              ),
              const SizedBox(height: 16),

              // Otros apoyos directos
              _buildProgramCard(
                title: 'Otros apoyos\ndirectos',
                icon: Icons.support,
                programKey: 'Otros apoyos directos',
                context: context,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgramCard({
    required String title,
    required IconData icon,
    required String programKey,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.actionGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: AppColors.actionGreen,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '• Semanas clave de aplicación,\nsegun estado de la planta.\n• Rango de dosis por planta\najustado a tu parcela, no al tanteo.',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textLight,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: AppColors.actionGreen),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Navigate to basic plan page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BasicPlanPage(selectedProgram: programKey),
                  ),
                );
              },
              child: const Text(
                'VER PLAN BÁSICO GRATIS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.actionGreen,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}