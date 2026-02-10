import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class CertificateDetailPage extends StatelessWidget {
  final double progress;

  const CertificateDetailPage({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'CERTIFICADO DE PRODUCTOR',
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              
              // Medalla/Badge del certificado
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surfaceWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Círculo exterior decorativo
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFD0C4A8),
                          width: 8,
                        ),
                      ),
                    ),
                    // Contenido del certificado
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Ícono de planta/café
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8E0D0),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.eco,
                            size: 40,
                            color: Color(0xFF9E8B6F),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Texto "Productor Cafetero"
                        const Text(
                          'PRODUCTOR',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF9E8B6F),
                            letterSpacing: 1.5,
                          ),
                        ),
                        const Text(
                          'CAFETERO',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF9E8B6F),
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Año
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8E0D0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '2026',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF9E8B6F),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Texto "No fertilizante"
                        const Text(
                          'NO FERTILIZANTE',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF9E8B6F),
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),

              // Capacitaciones presenciales
              const Align(
              alignment: Alignment.centerLeft,
              child: Text('Capacitaciones presenciales', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 12),
              _buildStaticTrainingItem('Nutrición y\nFertilización'),
              const SizedBox(height: 8),
              _buildStaticTrainingItem('Manejo de\nsuelos y\nconservación'),
              const SizedBox(height: 8),
              _buildStaticTrainingItem('Plagas y\nEnfermedades'),
              const SizedBox(height: 8),
              _buildStaticTrainingItem('Sombra\nagroforestal'),
              const SizedBox(height: 20),

              // Capacitaciones virtuales
              const Align(
              alignment: Alignment.centerLeft,
              child: Text('Capacitaciones virtuales', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 12),
              _buildStaticTrainingItem('Manejo de\nsuelos'),
              const SizedBox(height: 8),
              _buildStaticTrainingItem('Nutrición y\nFertilización'),
              const SizedBox(height: 8),
              _buildStaticTrainingItem('Nutrición y'),
              const SizedBox(height: 24),
              
              // Título del certificado
              const Text(
                'CERTIFICADO DE PRODUCTOR',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9E8B6F),
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              // Card de progreso
              Container(
                padding: const EdgeInsets.all(20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Alcanza el 100% para obtener este logro',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Barra de progreso con badge
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Barra de progreso
                        Container(
                          height: 12,
                          decoration: BoxDecoration(
                            color: AppColors.actionGreen.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: (progress / 100).clamp(0.0, 1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.actionGreen,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        // Badge de porcentaje
                        if (progress > 5)
                          Positioned(
                            left: ((progress / 100) * MediaQuery.of(context).size.width * 0.85) - 30,
                            top: -8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.actionGreen,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.actionGreen.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                '${progress.toStringAsFixed(2)}%',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Información de progreso
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.actionGreen.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '[${progress.toStringAsFixed(2)} % completa]  1/12 meses en AGRO',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.actionGreen,
                            ),
                          ),
                        ],
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
}

Widget _buildStaticTrainingItem(String title) {
  return SizedBox(
    height: 50,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textDark,
            height: 1.0,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}