import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:agro/shared/widgets/agro_page_layout.dart';
import 'package:agro/core/theme/app_theme.dart';

class PricingPage extends StatelessWidget {
  const PricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AgroPageLayout(
      title: 'Productos verificados',
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Compra segura - San Martín',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Evita pagar de mas y reduce el riesgo de comprar mal',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textLight,
              ),
            ),
            SizedBox(height: 24),

            // Search field
            _SearchField(),
            SizedBox(height: 24),

            // Recommendation note
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.actionGreen.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: AppColors.actionGreen, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Estos productos están alineados con las recomendaciones técnicas.',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Filters
            _FiltersSection(),
            SizedBox(height: 24),

            // Products list
            _ProductsList(),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar productos',
          hintStyle: TextStyle(
            color: AppColors.textLight,
            fontSize: 14,
          ),
          prefixIcon: Icon(Icons.search, color: AppColors.textLight),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}

class _FiltersSection extends StatelessWidget {
  const _FiltersSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _FilterChip(label: 'Tipo'),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _FilterChip(label: 'Etapa del cafetal: Floración'),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;

  const _FilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textDark,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.textLight),
        ],
      ),
    );
  }
}

class _ProductsList extends StatelessWidget {
  const _ProductsList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProductCard(
          name: 'Urea 46-0-0',
          description: 'Aporta nitrógeno para el desarrollo vegetativo del cafeto.',
          priceRange: 's/ 90 - 110',
          isRecommended: false,
          recommendationText: 'NO USAR AHORA\nAplicarlo ahora puede significar\ngasto sin respuesta del cultivo.',
          verificationRoute: '/urea_verification',
        ),
        SizedBox(height: 16),
        _ProductCard(
          name: 'NPK café',
          description: 'Aporta nitrógeno para el desarrollo vegetativo del cafeto.',
          priceRange: 's/ 140 - 160',
          isRecommended: true,
          recommendationText: 'RECOMENDADO AHORA\nUso en ventana adecuada reduce\ndesperdicio de fertilizante.',
          verificationRoute: '/npk_verification',
        ),
        SizedBox(height: 16),
        _ProductCard(
          name: 'Sulfato de Amonio',
          description: 'Aporta nitrógeno para el desarrollo vegetativo del cafeto.',
          priceRange: 's/ 120 - 140',
          isRecommended: false,
          recommendationText: 'NO USAR AHORA\nAplicarlo ahora puede significar\ngasto sin respuesta del cultivo.',
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String name;
  final String description;
  final String priceRange;
  final bool isRecommended;
  final String recommendationText;
  final String? verificationRoute;

  const _ProductCard({
    required this.name,
    required this.description,
    required this.priceRange,
    required this.isRecommended,
    required this.recommendationText,
    this.verificationRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with verification badge
          Row(
            children: [
              Icon(Icons.verified, color: AppColors.actionGreen, size: 20),
              SizedBox(width: 8),
              Text(
                'Producto verificado',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.actionGreen,
                ),
              ),
              Spacer(),
              Text(
                'Disponible en San Martin',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),

          // Product name
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(height: 4),

          // Description
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textLight,
            ),
          ),
          SizedBox(height: 16),

          // Price
          Text(
            'Precio referencial en San Martin',
            style: TextStyle(
              fontSize: 10,
              color: AppColors.textLight,
            ),
          ),
          Text(
            priceRange,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(height: 16),

          // Recommendation status
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isRecommended ? AppColors.actionGreen.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Icon(
                  isRecommended ? Icons.check_circle : Icons.warning,
                  color: isRecommended ? AppColors.actionGreen : Colors.orange,
                  size: 16,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    recommendationText,
                    style: TextStyle(
                      fontSize: 10,
                      color: isRecommended ? AppColors.actionGreen : Colors.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),

          // Action button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: verificationRoute != null
                  ? () => context.push(verificationRoute!)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.actionGreen,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Verificar producto y precio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Warning
          if (!isRecommended) ...[
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.red, size: 16),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Comprar fertilizantes adulterados o mal aplicados puede hacerte perder dinero sin mejorar tu producción.',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}