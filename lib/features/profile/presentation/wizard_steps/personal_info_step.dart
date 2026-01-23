import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/features/errors/domain/entities/cafetal_profile.dart';

class PersonalInfoStep extends StatefulWidget {
  final CafatalProfile profile;
  final Function(CafatalProfile) onUpdate;

  const PersonalInfoStep({
    super.key,
    required this.profile,
    required this.onUpdate,
  });

  @override
  State<PersonalInfoStep> createState() => _PersonalInfoStepState();
}

class _PersonalInfoStepState extends State<PersonalInfoStep> {
  late TextEditingController _nameController;
  late TextEditingController _dniController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.ownerName);
    _dniController = TextEditingController(text: widget.profile.dni ?? '');
    _phoneController = TextEditingController(text: widget.profile.phone ?? '');

    _nameController.addListener(_updateProfile);
    _dniController.addListener(_updateProfile);
    _phoneController.addListener(_updateProfile);
  }

  void _updateProfile() {
    widget.onUpdate(widget.profile.copyWith(
      ownerName: _nameController.text,
      dni: _dniController.text,
      phone: _phoneController.text,
    ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dniController.dispose();
    _phoneController.dispose();
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
          'Información personal',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.textDark),
        ),
        const SizedBox(height: 8),
        const Text(
          'Válida como documento complementario para trámites a fines del usuario',
          style: TextStyle(fontSize: 13, color: AppColors.textLight),
        ),
        const SizedBox(height: 20),
        _buildTextField(
          label: 'Nombre completo',
          hint: 'Tal como figura en tu DNI',
          controller: _nameController,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          label: 'DNI',
          hint: '8 dígitos',
          controller: _dniController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          label: 'Teléfono celular',
          hint: 'WhatsApp activo',
          controller: _phoneController,
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
