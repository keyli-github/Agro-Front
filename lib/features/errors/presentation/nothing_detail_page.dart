import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class NothingDetailPage extends StatelessWidget {
  const NothingDetailPage({super.key});

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
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.actionGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.event_busy_outlined,
                color: AppColors.actionGreen,
                size: 18,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Nada - Hoy (Fecha)',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              
              // Card con ilustración y mensaje
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surfaceWhite,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Ilustración de campo con cielo
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFB3E5FC), // Cielo azul claro
                            Color(0xFFE1F5FE), // Cielo más claro
                            Color(0xFFFFFDE7), // Transición a tierra
                          ],
                          stops: [0.0, 0.5, 0.8],
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Nubes
                          Positioned(
                            top: 20,
                            left: 30,
                            child: _buildCloud(40, 25),
                          ),
                          Positioned(
                            top: 30,
                            right: 50,
                            child: _buildCloud(50, 30),
                          ),
                          Positioned(
                            top: 50,
                            left: 100,
                            child: _buildCloud(35, 22),
                          ),
                          // Campo/colinas verdes
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: CustomPaint(
                              size: const Size(double.infinity, 80),
                              painter: _FieldPainter(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Mensaje
                    const Text(
                      'Tómate un descanso: un campo\nque ha descansado da una\ncosecha generosa',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),

              // Botón de acción
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.actionGreen,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Actividad registrada'),
                        duration: const Duration(milliseconds: 1500),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppColors.actionGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'REGISTRAR LA ACTIVIDAD DE HOY',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 14),
              
              // Info badge
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF90CAF9), width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2196F3),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Esta decisión quedará registrada en tu historial técnico',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF1565C0),
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloud(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(height / 2),
      ),
    );
  }
}

// Painter para dibujar las colinas verdes
class _FieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = const Color(0xFF7CB342)
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = const Color(0xFF8BC34A)
      ..style = PaintingStyle.fill;

    final paint3 = Paint()
      ..color = const Color(0xFF689F38)
      ..style = PaintingStyle.fill;

    // Primera colina (izquierda)
    final path1 = Path();
    path1.moveTo(0, size.height);
    path1.quadraticBezierTo(
      size.width * 0.15,
      size.height * 0.3,
      size.width * 0.35,
      size.height * 0.5,
    );
    path1.lineTo(0, size.height * 0.5);
    path1.close();
    canvas.drawPath(path1, paint1);

    // Segunda colina (centro)
    final path2 = Path();
    path2.moveTo(size.width * 0.25, size.height);
    path2.quadraticBezierTo(
      size.width * 0.45,
      size.height * 0.2,
      size.width * 0.7,
      size.height * 0.6,
    );
    path2.lineTo(size.width * 0.25, size.height * 0.6);
    path2.close();
    canvas.drawPath(path2, paint2);

    // Tercera colina (derecha)
    final path3 = Path();
    path3.moveTo(size.width * 0.6, size.height);
    path3.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.25,
      size.width,
      size.height * 0.5,
    );
    path3.lineTo(size.width, size.height);
    path3.close();
    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
