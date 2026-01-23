import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class LevelChallengesPage extends StatelessWidget {
  final int level;

  const LevelChallengesPage({
    super.key,
    required this.level,
  });

  // Configuración de desafíos por nivel
  List<Map<String, dynamic>> _getChallengesForLevel(int level) {
    switch (level) {
      case 2:
        return [
          {
            'title': 'Conoce tu cafetal',
            'description': '¡Bien hecho! Al visitar la aplicación, has completado este desafío.',
            'isCompleted': true,
            'hasButton': false,
          },
          {
            'title': 'Registra tu cafetal',
            'description': 'Completa la información clave de tu cafetal para que la app pueda darte recomendaciones adecuadas a tu realidad.',
            'isCompleted': false,
            'buttonText': 'Registrarme ahora',
            'hasButton': true,
          },
          {
            'title': 'Explora el plan de fertilización',
            'requirements': [
              'Ingresar al menos 10 días al plan',
              'Revisar el calendario',
            ],
            'isCompleted': false,
            'buttonText': 'Explorar plan',
            'hasButton': true,
          },
        ];
      case 3:
        return [
          {
            'title': 'Comienza a llevar control de tu manejo',
            'requirements': [
              'Registrar 1 actividad: fertilización, fumigación o revisión',
            ],
            'isCompleted': false,
            'buttonText': 'Registrar ahora',
            'hasButton': true,
          },
          {
            'title': 'Acceder a recomendaciones técnicas',
            'requirements': [
              'Activar un Plan PREMIUM',
            ],
            'isCompleted': false,
            'buttonText': 'Subir de categoría ahora',
            'hasButton': true,
          },
          {
            'title': 'Sigue el calendario',
            'requirements': [
              'Cumplir al menos 3 aplicación dentro de la fecha recomendada (±7 días)',
            ],
            'isCompleted': false,
            'buttonText': 'Explorar plan',
            'hasButton': true,
          },
        ];
      case 4:
        return [
          {
            'title': 'Constancia registrando diferentes labores',
            'requirements': [
              'Registrar 25 actividades distintas (ej: fertilizar, revisar, fumigar)',
            ],
            'isCompleted': false,
            'buttonText': 'Registrar ahora',
            'hasButton': true,
          },
          {
            'title': 'Interpretación aplicada',
            'requirements': [
              'Activar plan ajustado por análisis',
            ],
            'isCompleted': false,
            'buttonText': 'Subir de categoría ahora',
            'hasButton': true,
          },
          {
            'title': 'Primera aplicación técnica',
            'requirements': [
              'Registrar 1 aplicación basada en el análisis',
            ],
            'isCompleted': false,
            'buttonText': 'Explorar plan',
            'hasButton': true,
          },
        ];
      case 5:
        return [
          {
            'title': 'Capacitación técnica',
            'requirements': [
              'Completar 1 capacitación (video o charla)',
            ],
            'isCompleted': false,
            'buttonText': 'Capacitarme ahora',
            'hasButton': true,
          },
          {
            'title': 'Uso constante',
            'requirements': [
              'Usar la app durante 3 meses consecutivos',
            ],
            'isCompleted': false,
            'buttonText': '[33.33 % completa]',
            'hasButton': true,
            'progressButton': true,
          },
          {
            'title': 'Buen historial',
            'requirements': [
              '≥70% de actividades registradas oportunamente',
            ],
            'isCompleted': false,
            'buttonText': 'Registrar ahora',
            'hasButton': true,
          },
          {
            'title': 'Plan activo y ordenado',
            'requirements': [
              'Plan PREMIUM o análisis activo',
            ],
            'isCompleted': false,
            'buttonText': 'Registrar ahora',
            'hasButton': true,
          },
        ];
      case 6:
        return [
          {
            'title': 'Uso sostenido',
            'description': 'Demuestra constancia y compromiso a largo plazo.',
            'requirements': [
              '6 meses activos en la app',
            ],
            'isCompleted': false,
            'buttonText': '[33.33 % completa]',
            'hasButton': true,
            'progressButton': true,
          },
          {
            'title': 'Buen estado del cafetal',
            'requirements': [
              'Estado 🟢 estable durante 2 campañas',
            ],
            'isCompleted': false,
            'buttonText': '[00.00 % completa]',
            'hasButton': true,
            'progressButton': true,
          },
          {
            'title': 'Compartir experiencia',
            'description': 'Inspira a otros productores compartiendo tu experiencia.',
            'requirements': [
              'Publicar 1 logro o práctica en Novedades',
            ],
            'isCompleted': false,
            'buttonText': 'Compartir ahora',
            'hasButton': true,
          },
          {
            'title': 'Resultados',
            'description': 'Registra mejores productivas para evidenciar tu progreso.',
            'requirements': [
              'Registrar mejora productiva (estimada o real)',
            ],
            'isCompleted': false,
            'buttonText': 'Registrar ahora',
            'hasButton': true,
          },
          {
            'title': 'Validación técnica',
            'description': 'Un asesor valida tu manejo como productor referente.',
            'isCompleted': false,
            'buttonText': 'Solicitar asesor',
            'hasButton': true,
          },
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final challenges = _getChallengesForLevel(level);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBeige,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Desafío $level',
          style: const TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Elige uno para subir de nivel y desbloquear más recompensas.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.info_outline, size: 16, color: Color(0xFF0066CC)),
                  const SizedBox(width: 4),
                  const Text(
                    'Las recompensas se restablecen cada campaña',
                    style: TextStyle(fontSize: 13, color: Color(0xFF0066CC)),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Lista de desafíos
              ...List.generate(challenges.length, (index) {
                final challenge = challenges[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildChallengeCard(
                    title: challenge['title'],
                    description: challenge['description'],
                    requirements: challenge['requirements'],
                    isCompleted: challenge['isCompleted'],
                    buttonText: challenge['buttonText'],
                    hasButton: challenge['hasButton'],
                    progressButton: challenge['progressButton'] ?? false,
                  ),
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChallengeCard({
    required String title,
    String? description,
    List<String>? requirements,
    required bool isCompleted,
    String? buttonText,
    required bool hasButton,
    bool progressButton = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Badge de estado arriba a la derecha
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: isCompleted ? AppColors.actionGreen : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isCompleted ? Icons.check_circle : Icons.lock,
                    size: 14,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    isCompleted ? 'Completado' : 'Incompleto',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Imagen centrada
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFE3F2FD), Color(0xFFFFFFFF)],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  left: 0,
                  right: 0,
                  child: Icon(
                    Icons.wb_cloudy,
                    color: Colors.blue.shade100,
                    size: 30,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 25,
                    decoration: const BoxDecoration(
                      color: Color(0xFF8BC34A),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Título centrado
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          
          // Descripción o requisitos
          if (description != null) ...[
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 13,
                color: isCompleted ? Colors.grey.shade400 : Colors.grey.shade600,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          
          if (requirements != null) ...[
            const SizedBox(height: 8),
            ...requirements.map((req) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      req,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )),
          ],
          
          // Botón
          if (hasButton && buttonText != null) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isCompleted ? null : () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.actionGreen,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  disabledForegroundColor: Colors.grey.shade500,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}