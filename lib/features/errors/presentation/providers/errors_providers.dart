// lib/features/errors/presentation/providers/errors_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/features/errors/domain/entities/cafetal_profile.dart';
import 'package:agro/features/errors/domain/entities/recommendation.dart';
import 'package:agro/features/errors/domain/entities/advisor.dart';
import 'package:agro/features/errors/domain/entities/local_data.dart';
import 'package:agro/features/errors/domain/entities/advice.dart';

// Provider para el perfil del cafetal
final cafatalProfileProvider = StateProvider<CafatalProfile>((ref) {
  // Datos de ejemplo - se reemplazará con API/BD después
  return CafatalProfile(
    id: '1',
    ownerName: 'Neyver Terrones',
    dni: '12345678',
    phone: '+51987654321',
    region: 'San Martín',
    location: 'Moyobamba',
    district: 'Moyobamba',
    altitude: '1,820 msnm',
    variety: 'Castillo',
    area: '2.5',
    experience: '8',
    termsAccepted: true,
  );
});

// Provider para las recomendaciones
final recommendationsProvider = StateProvider<List<Recommendation>>((ref) {
  return [
    Recommendation(
      id: '1',
      title: 'Recompensa desbloquedada!',
      description: 'Completa otro desafío para poder usar estas herramientas recomendadas',
      level: 1,
      badge: 'Nivel 1',
    ),
  ];
});

// Provider para el asesor
final advisorProvider = StateProvider<Advisor>((ref) {
  return Advisor(
    id: '1',
    name: 'Tu Asesor',
    image: '',
    rating: 4.8,
    reviewsCount: 12,
  );
});

// Provider para datos locales
final localDataProvider = StateProvider<LocalData>((ref) {
  return LocalData(
    title: 'Dato local - San Martín',
    location: 'San Martín',
    description: 'Equivocarse en el día a dosis hace que el abono se pierda y cueste dinero',
  );
});

// Provider para consejos del cultivo
final adviceProvider = StateProvider<List<Advice>>((ref) {
  return [
    Advice(
      id: '1',
      title: 'Consejos del cultivo',
      description: 'Ver información relevante',
      icon: 'assets/icons/advice.png',
      moreInfo: 'Los consejos son basados en tu ubicación y condiciones del cultivo',
    ),
  ];
});
