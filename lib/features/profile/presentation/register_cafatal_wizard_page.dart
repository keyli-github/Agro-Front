import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/features/errors/domain/entities/cafetal_profile.dart';
import 'package:agro/features/errors/presentation/providers/errors_providers.dart';
import 'wizard_steps/personal_info_step.dart';
import 'wizard_steps/location_step.dart';
import 'wizard_steps/cafatal_info_step.dart';
import 'wizard_steps/constancy_summary_step.dart';

class RegisterCafatalWizardPage extends ConsumerStatefulWidget {
  const RegisterCafatalWizardPage({super.key});

  @override
  ConsumerState<RegisterCafatalWizardPage> createState() => _RegisterCafatalWizardPageState();
}

class _RegisterCafatalWizardPageState extends ConsumerState<RegisterCafatalWizardPage> {
  int _currentStep = 0;

  late CafatalProfile _profileData;

  @override
  void initState() {
    super.initState();
    _profileData = ref.read(cafatalProfileProvider);
  }

  void _updateProfile(CafatalProfile updatedProfile) {
    setState(() {
      _profileData = updatedProfile;
    });
  }

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() => _currentStep++);
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  void _finishWizard() {
    ref.read(cafatalProfileProvider.notifier).state = _profileData;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perfil del cafetal registrado exitosamente')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registra tu cafetal y genera tu constancia', style: TextStyle(color: AppColors.textDark)),
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Indicador de progreso
              Row(
                children: List.generate(4, (index) {
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: EdgeInsets.symmetric(horizontal: index < 3 ? 4 : 0),
                      decoration: BoxDecoration(
                        color: _currentStep >= index ? AppColors.actionGreen : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),

              // Contenido del paso actual
              if (_currentStep == 0)
                PersonalInfoStep(
                  profile: _profileData,
                  onUpdate: _updateProfile,
                )
              else if (_currentStep == 1)
                LocationStep(
                  profile: _profileData,
                  onUpdate: _updateProfile,
                )
              else if (_currentStep == 2)
                CafatalInfoStep(
                  profile: _profileData,
                  onUpdate: _updateProfile,
                )
              else
                ConstancySummaryStep(profile: _profileData),

              const SizedBox(height: 32),

              // Botones de navegación
              Row(
                children: [
                  if (_currentStep > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _previousStep,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.actionGreen),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text('Atrás', style: TextStyle(color: AppColors.actionGreen)),
                      ),
                    ),
                  if (_currentStep > 0) const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _currentStep == 3 ? _finishWizard : _nextStep,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.actionGreen,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        _currentStep == 3 ? 'Generar constancia' : 'Siguiente',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
