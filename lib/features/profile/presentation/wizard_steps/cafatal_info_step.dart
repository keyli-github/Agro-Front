import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/features/errors/domain/entities/cafetal_profile.dart';

class CafatalInfoStep extends StatefulWidget {
  final CafatalProfile profile;
  final Function(CafatalProfile) onUpdate;

  const CafatalInfoStep({
    super.key,
    required this.profile,
    required this.onUpdate,
  });

  @override
  State<CafatalInfoStep> createState() => _CafatalInfoStepState();
}

class _CafatalInfoStepState extends State<CafatalInfoStep> {
  late TextEditingController _areaController;
  late TextEditingController _experienceController;
  late TextEditingController _altitudeController;
  String? _selectedVariety;
  late bool _termsAccepted;

  final List<String> varieties = ['Castillo', 'Típica', 'Bourbon', 'Caturra', 'Catimor', 'Mundo Novo'];

  @override
  void initState() {
    super.initState();
    _areaController = TextEditingController(text: widget.profile.area ?? '');
    _experienceController = TextEditingController(text: widget.profile.experience ?? '');
    _altitudeController = TextEditingController(text: widget.profile.altitude ?? '');
    _selectedVariety = widget.profile.variety;
    _termsAccepted = widget.profile.termsAccepted;

    _areaController.addListener(_updateProfile);
    _experienceController.addListener(_updateProfile);
    _altitudeController.addListener(_updateProfile);
  }

  void _updateProfile() {
    widget.onUpdate(widget.profile.copyWith(
      area: _areaController.text,
      experience: _experienceController.text,
      altitude: _altitudeController.text,
      variety: _selectedVariety,
      termsAccepted: _termsAccepted,
    ));
  }

  @override
  void dispose() {
    _areaController.dispose();
    _experienceController.dispose();
    _altitudeController.dispose();
    super.dispose();
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
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textDark)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Información técnica del cafetal',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.textDark),
        ),
        const SizedBox(height: 20),
        _buildTextField(
          label: 'Área de la cafetal (ha)',
          hint: 'Ejemplo: 1, 2.5, 3',
          controller: _areaController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 16),
        _buildTextField(
          label: 'Años de experiencia',
          hint: 'Mínimo 2 años',
          controller: _experienceController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Variedad principal de café', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textDark)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedVariety,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              items: varieties.map((variety) {
                return DropdownMenuItem(value: variety, child: Text(variety));
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedVariety = value);
                _updateProfile();
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildTextField(
          label: 'Altitud aproximada',
          hint: 'ej: 1,820 msnm',
          controller: _altitudeController,
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.yellow.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.yellow.shade200),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.shield, color: Colors.amber, size: 20),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Tus datos están protegidos.',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.amber),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Checkbox(
              value: _termsAccepted,
              onChanged: (value) {
                setState(() => _termsAccepted = value ?? false);
                _updateProfile();
              },
              activeColor: AppColors.actionGreen,
            ),
            Expanded(
              child: Text(
                'Acepto los términos y condiciones',
                style: TextStyle(fontSize: 13, color: AppColors.textDark),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
