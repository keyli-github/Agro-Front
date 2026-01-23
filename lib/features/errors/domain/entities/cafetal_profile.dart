// lib/features/errors/domain/entities/cafetal_profile.dart

class CafatalProfile {
  final String id;
  final String ownerName;
  final String? dni;
  final String? phone;
  final String region;
  final String location;
  final String? district;
  final String? altitude;
  final String? variety;
  final String? area; // en hectáreas
  final String? experience; // años de experiencia
  final bool termsAccepted;

  CafatalProfile({
    required this.id,
    required this.ownerName,
    this.dni,
    this.phone,
    required this.region,
    required this.location,
    this.district,
    this.altitude,
    this.variety,
    this.area,
    this.experience,
    this.termsAccepted = false,
  });

  // Método para crear una copia con campos actualizados
  CafatalProfile copyWith({
    String? id,
    String? ownerName,
    String? dni,
    String? phone,
    String? region,
    String? location,
    String? district,
    String? altitude,
    String? variety,
    String? area,
    String? experience,
    bool? termsAccepted,
  }) {
    return CafatalProfile(
      id: id ?? this.id,
      ownerName: ownerName ?? this.ownerName,
      dni: dni ?? this.dni,
      phone: phone ?? this.phone,
      region: region ?? this.region,
      location: location ?? this.location,
      district: district ?? this.district,
      altitude: altitude ?? this.altitude,
      variety: variety ?? this.variety,
      area: area ?? this.area,
      experience: experience ?? this.experience,
      termsAccepted: termsAccepted ?? this.termsAccepted,
    );
  }
}
