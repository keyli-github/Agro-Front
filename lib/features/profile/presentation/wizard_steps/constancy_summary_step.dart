import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/features/errors/domain/entities/cafetal_profile.dart';
import 'package:agro/core/services/download_service.dart';

class ConstancySummaryStep extends StatefulWidget {
  final CafatalProfile profile;

  const ConstancySummaryStep({
    super.key,
    required this.profile,
  });

  @override
  State<ConstancySummaryStep> createState() => _ConstancySummaryStepState();
}

class _ConstancySummaryStepState extends State<ConstancySummaryStep> {
  double _downloadProgress = 0.0;
  bool _isDownloading = false;

  void _downloadConstancy() {
    print('=== DESCARGA INICIADA ===');
    setState(() {
      _isDownloading = true;
      _downloadProgress = 0.0;
    });

    print('Estado actualizado: _isDownloading = $_isDownloading');

    final downloadService = DownloadService();
    
    downloadService.generateAndDownloadPDF(
      fileName: 'Constancia_${widget.profile.ownerName}.pdf',
      onProgress: (progress) {
        print('Progreso: ${(progress * 100).toStringAsFixed(0)}%');
        if (mounted) {
          setState(() {
            _downloadProgress = progress;
          });
        }
      },
      onComplete: (filePath) {
        print('Completado: $filePath');
        if (mounted) {
          setState(() {
            _isDownloading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('✓ Constancia guardada'),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      onError: (error) {
        print('Error: $error');
        if (mounted) {
          setState(() {
            _isDownloading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('✗ Error: $error'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Resumen de tu constancia',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.textDark),
        ),
        const SizedBox(height: 20),
        // Card con constancia
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.actionGreen,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'CONSTANCIA TÉCNICA PRODUCTIVA',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.emoji_events, color: Colors.amber, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'AGRO',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        const Text(
                          'CONSTANCIA DE PRODUCTOR CAFETALERO',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Productor', widget.profile.ownerName),
                    const SizedBox(height: 10),
                    _buildInfoRow('DNI', widget.profile.dni ?? '-'),
                    const SizedBox(height: 10),
                    _buildInfoRow('Ubicación', '${widget.profile.location}, ${widget.profile.region}'),
                    const SizedBox(height: 10),
                    _buildInfoRow('Altitud', widget.profile.altitude ?? '-'),
                    const SizedBox(height: 10),
                    _buildInfoRow('Variedad', widget.profile.variety ?? '-'),
                    const SizedBox(height: 10),
                    _buildInfoRow('Área (ha)', widget.profile.area ?? '-'),
                    const SizedBox(height: 10),
                    _buildInfoRow('Experiencia', '${widget.profile.experience ?? '-'} años'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.actionGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.actionGreen.withOpacity(0.3)),
                ),
                child: const Text(
                  '[100.00 % completa] 1/12 meses en AGRO',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.actionGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade200),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline, color: Colors.blue, size: 20),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Esta presente constancia se expide a solicitud del interesado para los fines que considere pertinentes.',
                  style: TextStyle(fontSize: 12, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Mostrar progreso si está descargando
        if (_isDownloading) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Descargando...', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                  Text('${(_downloadProgress * 100).toStringAsFixed(0)}%', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: _downloadProgress,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.actionGreen),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ],
        GestureDetector(
          onTap: _isDownloading ? null : () {
            print('🔴 BOTÓN PRESIONADO - GestureDetector');
            debugPrint('🔴 BOTÓN PRESIONADO - debugPrint');
            debugPrintStack();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('✓ Generando constancia...'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
            _downloadConstancy();
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: _isDownloading ? Colors.grey.shade400 : AppColors.actionGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                _isDownloading ? 'Descargando...' : 'Generar constancia.pdf',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        Text(value, style: const TextStyle(fontSize: 12, color: AppColors.textLight)),
      ],
    );
  }
}
