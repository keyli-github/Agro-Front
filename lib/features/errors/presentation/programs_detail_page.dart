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
                icon: Icons.app_registration,
                programKey: 'Registro y acceso básico',
                context: context,
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
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
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Contenido izquierdo
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.actionGreen,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              icon,
                              color: Colors.white,
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
                                height: 1.3,
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.actionGreen,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
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
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Área de imagen derecha: Cielo y pasto
              SizedBox(
                width: 120,
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
                      top: 10,
                      right: 20,
                      child: Container(
                        width: 50,
                        height: 20,
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
                        size: const Size(120, 80),
                        painter: _GrassWavePainter(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
      size.width * 0.7, size.height * 0.1,  // Punto de control
      size.width * 0.4, size.height * 0.25,  // Punto final
    );
    
    path.quadraticBezierTo(
      size.width * 0.2, size.height * 0.35,  // Punto de control
      0, size.height * 0.4,  // Punto final en el borde izquierdo
    );
    
    path.close();
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}