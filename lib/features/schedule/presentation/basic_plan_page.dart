import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:agro/core/theme/app_theme.dart';

class BasicPlanPage extends StatefulWidget {
  const BasicPlanPage({super.key});

  @override
  State<BasicPlanPage> createState() => _BasicPlanPageState();
}

class _BasicPlanPageState extends State<BasicPlanPage> {
  DateTime? _selectedDate;
  bool _showCultivationStages = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBeige,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () {
            if (_showCultivationStages) {
              setState(() {
                _showCultivationStages = false;
              });
            } else {
              GoRouter.of(context).pop();
            }
          },
        ),
        title: Text(
          _showCultivationStages ? 'Plan de fertilización' : 'Plan básico gratis',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!_showCultivationStages) ...[
              // Pantalla inicial con calendario
              const Text(
                '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Elija la fecha en que su siembra fue realizada o está planeada',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textDark,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              // Calendario simple
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Mes y año
                    const Text(
                      'ENERO 2026',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Días de la semana
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: ['D', 'L', 'M', 'M', 'J', 'V', 'S']
                          .map((day) => Text(
                                day,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textDark,
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 8),
                    // Días del mes (simplificado)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        childAspectRatio: 1,
                      ),
                      itemCount: 31,
                      itemBuilder: (context, index) {
                        final day = index + 1;
                        final isSelected = _selectedDate != null &&
                            _selectedDate!.day == day &&
                            _selectedDate!.month == 1 &&
                            _selectedDate!.year == 2026;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDate = DateTime(2026, 1, day);
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.actionGreen : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                day.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isSelected ? Colors.white : AppColors.textDark,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Botón de continuar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedDate != null
                      ? () {
                          setState(() {
                            _showCultivationStages = true;
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.actionGreen,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'AÑADA LA FECHA DE SIEMBRA PARA COMENZAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ] else ...[
              // Pantalla de etapas del cultivo
              const Text(
                'Tu plan de fertilización',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Base tecnica por etapa del cultivo',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textDark,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Etapas del cultivo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 16),
              // Etapas del cultivo
              _buildCultivationStage('Vivero\n(0-6 meses)', 0, 6),
              const SizedBox(height: 12),
              _buildCultivationStage('Establecimiento\n(0-18 meses)', 0, 18),
              const SizedBox(height: 12),
              _buildCultivationStage('Crecimiento\nvegetativo', 6, 12),
              const SizedBox(height: 12),
              _buildCultivationStage('Floración', 12, 18),
              const SizedBox(height: 12),
              _buildCultivationStage('Llenado de\ngrano', 18, 24),
              const SizedBox(height: 12),
              _buildCultivationStage('Postcosecha /\nRecuperación', 24, 30),
            ],
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCultivationStage(String title, int startMonth, int endMonth) {
    // Calcular si esta etapa está activa basada en la fecha seleccionada
    bool isActive = false;
    if (_selectedDate != null) {
      final monthsSincePlanting = DateTime.now().difference(_selectedDate!).inDays ~/ 30;
      isActive = monthsSincePlanting >= startMonth && monthsSincePlanting <= endMonth;
    }

    return GestureDetector(
      onTap: title.startsWith('Vivero') ? () => context.push('/vivero_detail') : null,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: isActive ? Border.all(color: AppColors.actionGreen, width: 2) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
            ),
            if (isActive) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.actionGreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'ACTIVO',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}