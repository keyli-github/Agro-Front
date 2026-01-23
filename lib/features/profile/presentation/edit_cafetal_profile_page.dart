import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/features/errors/domain/entities/cafetal_profile.dart';
import 'package:agro/features/errors/presentation/providers/errors_providers.dart';

// Datos compartidos en forma de const para evitar recálculos
const Map<String, List<String>> _kRegions = {
  'San Martín': ['Moyobamba', 'Tarapoto', 'Picota'],
  'Amazonas': ['Chachapoyas', 'Bagua Grande', 'Utcubamba'],
  'Huancayo': ['Huancayo', 'Concepción', 'Satipo'],
};

const Map<String, List<String>> _kDistricts = {
  'Moyobamba': ['Moyobamba', 'Jepelacio', 'Tingo de Pólvora'],
  'Tarapoto': ['Tarapoto', 'San Antonio de Cumbaza', 'Morales'],
};

class EditCafatalProfilePage extends ConsumerStatefulWidget {
  const EditCafatalProfilePage({super.key});

  @override
  ConsumerState<EditCafatalProfilePage> createState() => _EditCafatalProfilePageState();
}

class _EditCafatalProfilePageState extends ConsumerState<EditCafatalProfilePage> {
  late PageController _pageController;
  int _currentStep = 0;

  late TextEditingController _nameController;
  late TextEditingController _dniController;
  late TextEditingController _phoneController;
  late TextEditingController _altitudeController;
  late TextEditingController _varietyController;

  String? _selectedRegion;
  String? _selectedProvince;
  String? _selectedDistrict;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    final currentProfile = ref.read(cafatalProfileProvider);
    _nameController = TextEditingController(text: currentProfile.ownerName);
    _dniController = TextEditingController();
    _phoneController = TextEditingController();
    _altitudeController = TextEditingController(text: currentProfile.altitude);
    _varietyController = TextEditingController(text: currentProfile.variety);
    _selectedRegion = 'San Martín';
    _selectedProvince = currentProfile.location;
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _dniController.dispose();
    _phoneController.dispose();
    _altitudeController.dispose();
    _varietyController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _saveProfile();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  void _saveProfile() {
    final updatedProfile = CafatalProfile(
      id: ref.read(cafatalProfileProvider).id,
      ownerName: _nameController.text,
      region: _selectedRegion ?? 'San Martín',
      location: _selectedProvince ?? 'Moyobamba',
      altitude: _altitudeController.text,
      variety: _varietyController.text,
    );

    ref.read(cafatalProfileProvider.notifier).state = updatedProfile;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perfil actualizado correctamente')),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil del cafetal', style: TextStyle(color: AppColors.textDark)),
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: _previousStep,
        ),
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: Column(
        children: [
          // Progress indicator with smooth animation
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Row(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic,
                    height: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: index <= _currentStep
                          ? AppColors.actionGreen
                          : const Color(0xFFE5E7EB),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // PageView with smooth transitions
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentStep = index);
              },
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                _EditPersonalInfoStep(
                  nameController: _nameController,
                  dniController: _dniController,
                  phoneController: _phoneController,
                ),
                _EditLocationStep(
                  selectedRegion: _selectedRegion,
                  selectedProvince: _selectedProvince,
                  selectedDistrict: _selectedDistrict,
                  onRegionChanged: (value) => setState(() {
                    _selectedRegion = value;
                    _selectedProvince = null;
                    _selectedDistrict = null;
                  }),
                  onProvinceChanged: (value) => setState(() {
                    _selectedProvince = value;
                    _selectedDistrict = null;
                  }),
                  onDistrictChanged: (value) => setState(() {
                    _selectedDistrict = value;
                  }),
                ),
                _EditTechnicalInfoStep(
                  varietyController: _varietyController,
                  altitudeController: _altitudeController,
                ),
              ],
            ),
          ),
          // Buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.actionGreen,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  _currentStep < 2 ? 'Siguiente' : 'Guardar cambios',
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
      ),
    );
  }
}

class _EditPersonalInfoStep extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController dniController;
  final TextEditingController phoneController;

  const _EditPersonalInfoStep({
    required this.nameController,
    required this.dniController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return _StepContainer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Información personal',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Nombre completo',
              hint: 'Tal como figura en tu DNI',
              controller: nameController,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'DNI',
              hint: '8 dígitos',
              controller: dniController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Teléfono celular',
              hint: 'WhatsApp activo',
              controller: phoneController,
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.actionGreen, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ],
    );
  }
}

class _EditLocationStep extends StatelessWidget {
  final String? selectedRegion;
  final String? selectedProvince;
  final String? selectedDistrict;
  final Function(String?) onRegionChanged;
  final Function(String?) onProvinceChanged;
  final Function(String?) onDistrictChanged;

  const _EditLocationStep({
    required this.selectedRegion,
    required this.selectedProvince,
    required this.selectedDistrict,
    required this.onRegionChanged,
    required this.onProvinceChanged,
    required this.onDistrictChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _StepContainer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ubicación',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildDropdown(
              label: 'Región',
              value: selectedRegion,
              items: _kRegions.keys.toList(),
              onChanged: onRegionChanged,
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              label: 'Provincia',
              value: selectedProvince,
              items: selectedRegion != null ? _kRegions[selectedRegion]! : [],
              onChanged: onProvinceChanged,
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              label: 'Distrito',
              value: selectedDistrict,
              items: selectedProvince != null && _kDistricts.containsKey(selectedProvince)
                  ? _kDistricts[selectedProvince]!
                  : [],
              onChanged: onDistrictChanged,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: value,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.actionGreen, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _EditTechnicalInfoStep extends StatelessWidget {
  final TextEditingController varietyController;
  final TextEditingController altitudeController;

  const _EditTechnicalInfoStep({
    required this.varietyController,
    required this.altitudeController,
  });

  @override
  Widget build(BuildContext context) {
    return _StepContainer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Información técnica del cafetal',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Variedad',
              hint: 'ej: Castillo, Típica, Bourbon',
              controller: varietyController,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Altitud aproximada',
              hint: 'ej: 1,820 msnm',
              controller: altitudeController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.actionGreen, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ],
    );
  }
}

// Widget wrapper para transiciones suaves entre pasos
class _StepContainer extends StatelessWidget {
  final Widget child;

  const _StepContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      child: child,
    );
  }
}
