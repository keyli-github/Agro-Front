import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/features/premium/presentation/level_challenges_page.dart';

class RewardDetailPage extends StatelessWidget {
  final int level;
  final bool isUnlocked;

  const RewardDetailPage({
    super.key,
    required this.level,
    required this.isUnlocked,
  });

  // Configuración de cada nivel
  Map<String, dynamic> _getLevelConfig(int level) {
    switch (level) {
      case 1:
        return {
          'title': 'Productor Inicial',
          'description': 'Buen trabajo desbloqueando tu recompensa.\n¡Cuánto más tengas, más preciso será!',
          'icon': Icons.eco,
          'iconColor': const Color(0xFF6B8E23),
          'borderColor': const Color(0xFFDAA520),
          'rewards': [
            {
              'title': 'Plan general por etapas',
              'description': 'Conoce qué hacer en cada etapa del cultivo sin improvisar.',
              'icon': Icons.calendar_month,
              'hasButton': true,
            },
            {
              'title': 'Consejos del cultivo',
              'description': 'Recomendaciones prácticas para evitar errores comunes.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': true,
            },
          ],
        };
      case 2:
        return {
          'title': 'Productor Básico',
          'description': 'Accedes a recomendaciones generales por etapa del cultivo y un calendario que te ayuda a fertilizar y manejar tu cafetal sin improvisar.',
          'icon': Icons.menu_book,
          'iconColor': const Color(0xFFD4A574),
          'borderColor': const Color(0xFFDAA520),
          'hasChallenge': true,
          'rewards': [
            {
              'title': 'Registro de actividades',
              'description': 'Guarda cada fertilización o fumigación realizada.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': true,
            },
            {
              'title': 'Alertas básicas',
              'description': 'Recordatorios simples según la etapa del cultivo.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': true,
            },
          ],
        };
      case 3:
        return {
          'title': 'Productor Técnico',
          'description': 'La app ajusta automáticamente las recomendaciones según datos de cultivo, ayudándote a aplicar fertilizantes y labores con mayor precisión y control.',
          'icon': Icons.trending_up,
          'iconColor': const Color(0xFF4A7BA7),
          'borderColor': const Color(0xFF4A7BA7),
          'hasChallenge': true,
          'rewards': [
            {
              'title': 'Plan ajustado automático',
              'description': 'La app ajusta dosis según edad y densidad del cafetal.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': false,
            },
            {
              'title': 'Objetivo productivo',
              'description': 'Elige si deseas mantener, recuperar o mejorar producción.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': false,
            },
            {
              'title': 'Alertas inteligentes',
              'description': 'Avisos según etapa fenológica y clima general.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': false,
            },
          ],
        };
      case 4:
        return {
          'title': 'Productor Analizado',
          'description': 'Con el análisis de suelo, Claude interpreta tus resultados y te muestra un plan de fertilización profesional, con dosis exactas y respaldo técnico real.',
          'icon': Icons.explore,
          'iconColor': const Color(0xFF8B5A8E),
          'borderColor': const Color(0xFFDAA520),
          'hasChallenge': true,
          'rewards': [
            {
              'title': 'Plan con análisis de suelo',
              'description': 'Dosis exactas basadas en los nutrientes de tu suelo.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': false,
            },
            {
              'title': 'Interpretación técnica clara',
              'description': 'Elige si deseas mantener, recuperar o mejorar producción.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': false,
            },
            {
              'title': 'Plan económico vs óptimo',
              'description': 'Elige entre máxima eficiencia o menor costo.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': false,
            },
          ],
        };
      case 5:
        return {
          'title': 'Productor Certificado',
          'description': 'Demuestras un manejo técnico responsable de tu cafetal, con historial, capacitación y respaldo digital, útil para programas, proyectos y apoyos institucionales.',
          'icon': Icons.workspace_premium,
          'iconColor': const Color(0xFFCD7F32),
          'borderColor': const Color(0xFFDAA520),
          'hasChallenge': true,
          'rewards': [
            {
              'title': 'Certificado digital de productor',
              'description': 'Acredita tu manejo técnico del cultivo.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': false,
            },
            {
              'title': 'Prioridad en capacitaciones',
              'description': 'Acceso preferente a cursos y eventos técnicos.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': false,
            },
          ],
        };
      case 6:
        return {
          'title': 'Productor Referente 🏆',
          'description': 'Eres reconocido como productor modelo en tu zona, con buenas prácticas, resultados y experiencia que pueden servir de referencia para otros agricultores.',
          'icon': Icons.emoji_events,
          'iconColor': const Color(0xFFDAA520),
          'borderColor': const Color(0xFFDAA520),
          'hasChallenge': true,
          'rewards': [
            {
              'title': 'Reconocimiento como productor modelo',
              'description': 'Tu finca es referencia técnica en la zona.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': false,
            },
            {
              'title': 'Invitación a proyectos piloto',
              'description': 'Participa en pruebas y nuevas iniciativas.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': false,
            },
            {
              'title': 'Beneficios especiales',
              'description': 'Descuentos, accesos anticipados y visibilidad.',
              'icon': Icons.wb_sunny_outlined,
              'hasButton': false,
            },
          ],
        };
      default:
        return {
          'title': 'Productor',
          'description': '',
          'icon': Icons.emoji_events,
          'iconColor': Colors.grey,
          'borderColor': Colors.grey,
          'rewards': [],
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = _getLevelConfig(level);
    
    return Scaffold(
      backgroundColor: AppColors.scaffoldBeige,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isUnlocked ? AppColors.actionGreen : Colors.grey.shade500,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isUnlocked ? Icons.lock_open : Icons.lock,
                    size: 14,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    isUnlocked ? 'desbloqueado' : 'bloqueado',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Medalla/Badge del nivel
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: config['iconColor'].withOpacity(0.2),
                  border: Border.all(
                    color: config['borderColor'],
                    width: 4,
                  ),
                ),
                child: Center(
                  child: Icon(
                    config['icon'],
                    size: 48,
                    color: config['iconColor'],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              
              // Nivel label
              Text(
                'NIVEL $level',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade400,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 12),
              
              // Título principal
              Text(
                config['title'],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              
              // Descripción
              Text(
                config['description'],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              
              // Información de expiración
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: const Color(0xFF0066CC),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Las recompensas se restablecen cada campaña',
                    style: TextStyle(
                      fontSize: 13,
                      color: const Color(0xFF0066CC),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Sección de recompensas obtenidas
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    const Icon(Icons.lock, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      config['hasChallenge'] == true 
                          ? 'Todos las recompensas' 
                          : 'Recompensas obtenidas',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
              
              if (config['hasChallenge'] == true) ...[
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Completa un desafío para completar el nivel y acceder a investigaciones',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
              
              const SizedBox(height: 16),
              
              // Lista de recompensas
              ...List.generate(config['rewards'].length, (index) {
                final reward = config['rewards'][index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildRewardItem(
                    title: reward['title'],
                    description: reward['description'],
                    icon: reward['icon'],
                    hasButton: reward['hasButton'] ?? false,
                  ),
                );
              }),
              
              // Botón de completar desafío
              if (config['hasChallenge'] == true) ...[
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => LevelChallengesPage(level: level))),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.actionGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Completar el desafío',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
              
              const SizedBox(height: 24),
              
              // Texto informativo
              Text(
                'Las recompensas porcentuales se calculan de forma mensual, se acumulan diariamente',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRewardItem({
    required String title,
    required String description,
    required IconData icon,
    required bool hasButton,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          // Icono
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 32,
                color: const Color(0xFF6B8E23),
              ),
            ),
          ),
          const SizedBox(width: 12),
          
          // Contenido
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    height: 1.3,
                  ),
                ),
                if (hasButton) ...[
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.actionGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        title.contains('Plan') ? 'VER PLAN' : 'VER',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          // Candado para items bloqueados
          if (!hasButton) ...[
            const SizedBox(width: 8),
            Icon(
              Icons.lock,
              size: 20,
              color: Colors.grey.shade400,
            ),
          ],
        ],
      ),
    );
  }
}