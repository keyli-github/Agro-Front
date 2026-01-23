import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/features/errors/domain/entities/cafetal_profile.dart';

class LocationStep extends StatefulWidget {
  final CafatalProfile profile;
  final Function(CafatalProfile) onUpdate;

  const LocationStep({
    super.key,
    required this.profile,
    required this.onUpdate,
  });

  @override
  State<LocationStep> createState() => _LocationStepState();
}

class _LocationStepState extends State<LocationStep> {
  late String? _selectedRegion;
  late String? _selectedProvince;
  late String? _selectedDistrict;

  final Map<String, List<String>> regions = {
    'San Martín': ['Moyobamba', 'Tarapoto', 'Picota'],
    'Amazonas': ['Chachapoyas', 'Bagua Grande', 'Utcubamba'],
    'Huancayo': ['Huancayo', 'Concepción', 'Satipo'],
    'Cusco': ['Cusco', 'Urubamba', 'La Convención'],
  };

  final Map<String, List<String>> districts = {
    'Moyobamba': ['Moyobamba', 'Jepelacio', 'Tingo de Pólvora'],
    'Tarapoto': ['Tarapoto', 'San Antonio de Cumbaza', 'Morales'],
    'Chachapoyas': ['Chachapoyas', 'Mariscal Castilla', 'Asunción'],
    'Huancayo': ['Huancayo', 'El Tambo', 'Concepción'],
  };

  @override
  void initState() {
    super.initState();
    _selectedRegion = widget.profile.region;
    _selectedProvince = widget.profile.location;
    _selectedDistrict = widget.profile.district;
  }

  void _updateProfile() {
    widget.onUpdate(widget.profile.copyWith(
      region: _selectedRegion ?? '',
      location: _selectedProvince ?? '',
      district: _selectedDistrict ?? '',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ubicación',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.textDark),
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Región', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textDark)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedRegion,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              items: regions.keys.map((region) {
                return DropdownMenuItem(value: region, child: Text(region));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRegion = value;
                  _selectedProvince = null;
                  _selectedDistrict = null;
                });
                _updateProfile();
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Provincia', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textDark)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedProvince,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              items: _selectedRegion != null
                  ? regions[_selectedRegion]!.map((province) {
                      return DropdownMenuItem(value: province, child: Text(province));
                    }).toList()
                  : [],
              onChanged: (value) {
                setState(() {
                  _selectedProvince = value;
                  _selectedDistrict = null;
                });
                _updateProfile();
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Distrito', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textDark)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedDistrict,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              items: _selectedProvince != null && districts.containsKey(_selectedProvince)
                  ? districts[_selectedProvince]!.map((district) {
                      return DropdownMenuItem(value: district, child: Text(district));
                    }).toList()
                  : [],
              onChanged: (value) {
                setState(() => _selectedDistrict = value);
                _updateProfile();
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.actionGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.actionGreen.withOpacity(0.3)),
          ),
          child: const Row(
            children: [
              Icon(Icons.check_circle, color: AppColors.actionGreen, size: 20),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Solo usamos esta información para validar tu experiencia productiva.',
                  style: TextStyle(fontSize: 12, color: AppColors.actionGreen),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
