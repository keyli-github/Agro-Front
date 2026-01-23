import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class CropAdviceDetailPage extends StatefulWidget {
  final String? adviceType; // 'por_tarea' or 'por_etapa'

  const CropAdviceDetailPage({super.key, this.adviceType});

  @override
  State<CropAdviceDetailPage> createState() => _CropAdviceDetailPageState();
}

class _CropAdviceDetailPageState extends State<CropAdviceDetailPage> {
  late String _selectedTab;
  DateTimeRange? _selectedRange;
  bool _showStageDateSelector = false;

  final List<Map<String, String>> _taskAdvice = [
    {
      'icon': '🌾',
      'title': 'Corrección de suelos',
      'description': 'Mejora la calidad del terreno'
    },
    {
      'icon': '🌱',
      'title': 'Selección de semillas',
      'description': 'Elige la mejor variedad'
    },
    {
      'icon': '🌿',
      'title': 'Etapa de vivero',
      'description': 'Cuidado de plántulas'
    },
    {
      'icon': '📍',
      'title': 'Diseño de siembra',
      'description': 'Planificación del cultivo'
    },
    {
      'icon': '🌱',
      'title': 'Siembra',
      'description': 'Proceso de siembra'
    },
    {
      'icon': '👁️',
      'title': 'Monitoreo',
      'description': 'Seguimiento del cultivo'
    },
    {
      'icon': '👨‍🌾',
      'title': 'Preparación de campo',
      'description': 'Preparativos antes de siembra'
    },
    {
      'icon': '🛡️',
      'title': 'Control de malezas',
      'description': 'Gestión de maleza'
    },
    {
      'icon': '☀️',
      'title': 'Manejo de sombra',
      'description': 'Control de luz solar'
    },
    {
      'icon': '💧',
      'title': 'Riego',
      'description': 'Sistema de riego'
    },
    {
      'icon': '🥗',
      'title': 'Fertilización',
      'description': 'Nutrición del cultivo'
    },
    {
      'icon': '🦠',
      'title': 'Control de plagas y enfermedades',
      'description': 'Protección del cultivo'
    },
    {
      'icon': '🌾',
      'title': 'Cosecha',
      'description': 'Recolección de frutos'
    },
    {
      'icon': '📦',
      'title': 'Post cosecha',
      'description': 'Después de la cosecha'
    },
    {
      'icon': '✂️',
      'title': 'Podas',
      'description': 'Poda y mantenimiento'
    },
  ];

  final List<Map<String, String>> _stageAdvice = [
    {
      'number': '1',
      'duration': 'DURACIÓN: 45-60 DÍAS',
      'title': 'Germinación',
      'details': '• Desde la siembra de la semilla\n• Hasta la emergencia',
      'image': ''
    },
    {
      'number': '2',
      'duration': '1-2 MESES',
      'title': 'Plántula',
      'details': '• Desde armada los cotiledones\n• Etapa crítica',
      'image': ''
    },
    {
      'number': '3',
      'duration': '4-6 MESES',
      'title': 'Desarrollo vegetativo inicial (Vivero)',
      'details': '• Plántula + plantón listo para campo\n• Crecimiento a campo',
      'image': ''
    },
    {
      'number': '4',
      'duration': '3-6 MESES',
      'title': 'Establecimiento en campo',
      'details': '• Transplante hasta adaptación\n• Establecimiento de manejo bien',
      'image': ''
    },
    {
      'number': '5',
      'duration': '6-8 MESES',
      'title': 'Crecimiento vegetativo',
      'details': '• Crecimiento inicial de la planta\n• No producción mineral',
      'image': ''
    },
    {
      'number': '6',
      'duration': 'SEMANAS PREVIAS A FLORACIÓN',
      'title': 'Floración',
      'details': '• Preparación para floración\n• Etapa invisible pero decisiva',
      'image': ''
    },
    {
      'number': '7',
      'duration': '30-45 DÍAS',
      'title': 'Inducción floral',
      'details': '• Aparición de flores blancas\n• Puede haber varias floraciones al año',
      'image': ''
    },
    {
      'number': '8',
      'duration': '30-45 DÍAS',
      'title': 'Cuaje de frutos',
      'details': '• Por cuajos iniciales\n• Muy sensible a estrés',
      'image': ''
    },
    {
      'number': '9',
      'duration': '4-6 MESES',
      'title': 'Desarrollo del fruto (Grano verde)',
      'details': '• Crecimiento del café\n• Alta demanda nutricional',
      'image': ''
    },
    {
      'number': '10',
      'duration': '2-3 MESES',
      'title': 'Maduración del fruto',
      'details': '• Grano verde → cerezas rojas\n• Definir calidad del café',
      'image': ''
    },
    {
      'number': '11',
      'duration': 'DESDE 8 AÑOS CON PODAS',
      'title': 'Senescencia productiva',
      'details': '• Envejecimiento fisiológico',
      'image': ''
    },
    {
      'number': '12',
      'duration': 'DESDE 8 AÑOS',
      'title': 'Renovación / Rejuvenecimiento',
      'details': '• Poda para renovar\n• No es muerte del cultivo, es rescate técnico',
      'image': ''
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.adviceType ?? 'por_tarea';
  }

  // Approximate min/max durations (days) for each stage, in the same order
  // as `_stageAdvice`. These are used to compute rough stage date ranges.
  final List<List<int>> _stageDurationsDays = [
    [45, 60], // Germinación
    [30, 60], // Plántula
    [120, 180], // Desarrollo vegetativo inicial (Vivero)
    [90, 180], // Establecimiento en campo
    [180, 240], // Crecimiento vegetativo
    [30, 60], // Floración (aprox semanas previas)
    [30, 45], // Inducción floral
    [30, 45], // Cuaje de frutos
    [120, 180], // Desarrollo del fruto
    [60, 90], // Maduración del fruto
    [2920, 3650], // Senescencia productiva (~8 años)
    [2920, 3650], // Renovación / Rejuvenecimiento (~8 años)
  ];

  String _formatDate(DateTime d) {
    const monthNames = [
      'enero',
      'febrero',
      'marzo',
      'abril',
      'mayo',
      'junio',
      'julio',
      'agosto',
      'septiembre',
      'octubre',
      'noviembre',
      'diciembre'
    ];
    return '${d.day} de ${monthNames[d.month - 1]}';
  }

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
          'Consejos de cultivo',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: Column(
        children: [
          // Tabs
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTab = 'por_tarea'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: _selectedTab == 'por_tarea'
                            ? AppColors.actionGreen
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _selectedTab == 'por_tarea'
                              ? AppColors.actionGreen
                              : const Color(0xFFE5E7EB),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Por tarea',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _selectedTab == 'por_tarea'
                                ? Colors.white
                                : AppColors.textDark,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _selectedTab = 'por_etapa');
                      // Mostrar selector de rango si no se ha seleccionado
                      if (_selectedRange == null) {
                        _showPlantingRangeDialog();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: _selectedTab == 'por_etapa'
                            ? AppColors.actionGreen
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _selectedTab == 'por_etapa'
                              ? AppColors.actionGreen
                              : const Color(0xFFE5E7EB),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Por etapa',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _selectedTab == 'por_etapa'
                                ? Colors.white
                                : AppColors.textDark,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: _selectedTab == 'por_tarea'
                ? _buildTaskList()
                : (_selectedRange == null)
                    ? _buildDateSelector()
                    : _buildStageList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: _taskAdvice.length,
      itemBuilder: (context, index) {
        final item = _taskAdvice[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: ListTile(
            leading: Text(
              item['icon']!,
              style: const TextStyle(fontSize: 24),
            ),
            title: Text(
              item['title']!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
            subtitle: Text(
              item['description']!,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF9CA3AF),
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.actionGreen,
            ),
            onTap: () {},
          ),
        );
      },
    );
  }

  Widget _buildStageList() {
    // Build cumulative min/max day offsets for stages
    final List<int> cumMin = [];
    final List<int> cumMax = [];
    int accMin = 0;
    int accMax = 0;
    for (var d in _stageDurationsDays) {
      cumMin.add(accMin);
      cumMax.add(accMax + d[1]);
      accMin += d[0];
      accMax += d[1];
    }

    final planting = _selectedRange!.start;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Desde ${_formatDate(_selectedRange!.start)} hasta ${_formatDate(_selectedRange!.end)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
                softWrap: true,
              ),
              const SizedBox(height: 6),
              Text(
                '${((_selectedRange!.end.difference(_selectedRange!.start).inDays / 30).round())} meses aproximados',
                style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColors.actionGreen.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: _stageAdvice.length,
            itemBuilder: (context, index) {
              final item = _stageAdvice[index];

              final stageStart = planting.add(Duration(days: cumMin[index]));
              final stageEnd = planting.add(Duration(days: cumMax[index]));

              final intersects = !(stageEnd.isBefore(_selectedRange!.start) || stageStart.isAfter(_selectedRange!.end));

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: intersects ? AppColors.actionGreen.withOpacity(0.08) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: intersects ? AppColors.actionGreen : AppColors.actionGreen.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: intersects ? AppColors.actionGreen : AppColors.actionGreen,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        item['number']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: intersects ? Colors.white : AppColors.actionGreen,
                        ),
                      ),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['duration']!,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF9CA3AF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      item['details']!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9CA3AF),
                        height: 1.5,
                      ),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.actionGreen,
                  ),
                  isThreeLine: true,
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDateSelector() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.actionGreen.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.calendar_today,
                  color: AppColors.actionGreen,
                  size: 40,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Elija la fecha en que su siembra fue realizada o está planeada',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _showPlantingRangeDialog,
                  icon: const Icon(Icons.add),
                  label: const Text('Añada el rango de fechas de su interés'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.actionGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPlantingRangeDialog() {
    showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
      initialDateRange: DateTimeRange(
        start: DateTime.now().subtract(const Duration(days: 30)),
        end: DateTime.now().add(const Duration(days: 90)),
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.actionGreen,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    ).then((selectedRange) {
      if (selectedRange != null) {
        setState(() {
          _selectedRange = selectedRange;
        });
      }
    });
  }

}