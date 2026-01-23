import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'certificate_detail_page.dart';

class AchievementsOverviewPage extends StatelessWidget {
  final double certificationProgress;

  const AchievementsOverviewPage({super.key, required this.certificationProgress});

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
        title: const Text('Logros', style: TextStyle(color: AppColors.textDark)),
        centerTitle: false,
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => CertificateDetailPage(progress: certificationProgress),
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CERTIFICADO DE PRODUCTOR',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${certificationProgress.toStringAsFixed(2)} % completa',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text('Capacitaciones presenciales', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              _buildTrainingChip('Nutrición y\nFertilización'),
              const SizedBox(height: 8),
              _buildTrainingChip('Manejo de\nsuelos y\nconservación'),
              const SizedBox(height: 8),
              _buildTrainingChip('Plagas y\nEnfermedades'),
              const SizedBox(height: 8),
              _buildTrainingChip('Sombra\nagroforestal'),
              const SizedBox(height: 20),

              const Text('Capacitaciones virtuales', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              _buildTrainingChip('Manejo de\nsuelos'),
              const SizedBox(height: 8),
              _buildTrainingChip('Nutrición y\nFertilización'),
              const SizedBox(height: 8),
              _buildTrainingChip('Nutrición y\nFertilización'),
              const SizedBox(height: 8),
              _buildTrainingChip('Nutrición y\nFertilización'),
              const SizedBox(height: 8),
              _buildTrainingChip('Nutrición y\nFertilización'),
              const SizedBox(height: 8),
              _buildTrainingChip('Nutrición y\nFertilización'),
              const SizedBox(height: 8),
              _buildTrainingChip('Nutrición y\nFertilización'),
              const SizedBox(height: 8),
              _buildTrainingChip('Nutrición y\nFertilización'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrainingChip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Text(title, style: const TextStyle(fontSize: 14, color: AppColors.textDark)),
    );
  }
}
