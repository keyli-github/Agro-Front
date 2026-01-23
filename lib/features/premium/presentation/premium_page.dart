import 'package:flutter/material.dart';
import 'package:agro/shared/widgets/agro_page_layout.dart';
import 'package:agro/core/theme/app_theme.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AgroPageLayout(
      title: 'Premium',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            const Text(
              'Lleva tu cafetal a nivel técnico.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Prueba 3 meses de Premium individual por PEN 0 con AgroCIC',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textLight,
              ),
            ),
            const SizedBox(height: 24),

            // Free trial section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.actionGreen, AppColors.actionGreen.withOpacity(0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.actionGreen.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Probar 3 meses por PEN 0',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '3 meses gratis para nuevos usuarios. Luego S/ 14.90 al mes.\nCancela cuando quieras. Los precios pueden variar según el método de pago, y la suscripción implica aceptar los Términos y Condiciones.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement free trial
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.actionGreen,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Probar 3 meses por PEN 0',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Plans section
            const Text(
              'Planes disponibles',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),

            // Individual Plan
            _buildPlanCard(
              isRecommended: false,
              title: 'Premium Individual',
              price: 'PEN 0 por 3 meses',
              subtitle: 'Después, PEN 14.90 por mes',
              features: [
                'Evita errores costosos',
                'Recomendaciones técnicas ajustadas',
                'Alertas inteligentes',
                'Control real del cultivo',
                'Preparado para análisis de suelo',
              ],
              description: 'La mayoría de productores que usan AgroCIC Premium individual pasan de "en riesgo" a "estable" en pocas semanas porque dejan de trabajar al tanteo.',
              buttonText: 'Probar 3 meses por PEN 0',
              paymentNote: 'Puedes pagar con Yape, Plin o mediante un técnico AgroCIC.',
            ),
            const SizedBox(height: 16),

            // Professional Plan
            _buildPlanCard(
              isRecommended: true,
              title: 'Premium AgroCIC Profesional',
              price: 'Servicio técnico especializado',
              subtitle: '',
              features: [
                'Incluye Premium Individual',
                'Interpretación técnica profesional',
                'Dosis exactas por hectárea y por planta',
                'Reporte técnico descargable',
                'Control real del cultivo',
                'Seguimiento anual',
              ],
              description: 'Productores que usan AgroCIC Premium profesional reducen errores técnicos desde las primeras semanas.',
              buttonText: 'Solicitar análisis de suelo',
              paymentNote: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required bool isRecommended,
    required String title,
    required String price,
    required String subtitle,
    required List<String> features,
    required String description,
    required String buttonText,
    required String paymentNote,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isRecommended
            ? Border.all(color: AppColors.actionGreen, width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with recommendation badge
          if (isRecommended) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.actionGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Recomendado',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],

          // Title and price
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isRecommended ? AppColors.actionGreen : AppColors.textDark,
            ),
          ),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textLight,
              ),
            ),
          ],
          const SizedBox(height: 16),

          // Features list
          ...features.map((feature) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppColors.actionGreen,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        feature,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ],
                ),
              )),

          const SizedBox(height: 16),

          // Description
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textLight,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 20),

          // Action button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement plan selection
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isRecommended ? AppColors.actionGreen : Colors.grey.shade300,
                foregroundColor: isRecommended ? Colors.white : AppColors.textDark,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isRecommended ? Colors.white : AppColors.textDark,
                ),
              ),
            ),
          ),

          // Payment note
          if (paymentNote.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              paymentNote,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.textLight,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
