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
      decoration: BoxDecoration(
        color: isSelected ? AppColors.actionGreen.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.actionGreen : const Color(0xFFE5E7EB),
          width: isSelected ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            // Área de imagen izquierda: Cielo y pasto
            SizedBox(
              width: 90,
              height: 90,
              child: Stack(
                children: [
                  // Cielo (azul claro) - Fondo completo
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFB8E6F5),
                          Color(0xFFD4F1F9),
                        ],
                      ),
                    ),
                  ),
                  
                  // Nube blanca
                  Positioned(
                    top: 8,
                    right: 15,
                    child: Container(
                      width: 40,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  
                  // Pasto (verde) - Con forma ondulada
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomPaint(
                      size: const Size(90, 35),
                      painter: _GrassWavePainter(),
                    ),
                  ),
                ],
              ),
            ),
            
            // Contenido derecho
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textDark,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: onTap,
                            child: const Text(
                              'Ver información relevante',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.actionGreen,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.actionGreen,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter para el pasto ondulado
class _GrassWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF7CB342),
          Color(0xFF689F38),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    
    // Empezar desde la esquina inferior izquierda
    path.moveTo(0, size.height);
    
    // Línea al borde inferior derecho
    path.lineTo(size.width, size.height);
    
    // Línea al borde derecho superior
    path.lineTo(size.width, size.height * 0.3);
    
    // Curva ondulada suave (forma de colina)
    path.quadraticBezierTo(
      size.width * 0.7, size.height * 0.1,
      size.width * 0.4, size.height * 0.25,
    );
    
    path.quadraticBezierTo(
      size.width * 0.2, size.height * 0.35,
      0, size.height * 0.4,
    );
    
    path.close();
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}