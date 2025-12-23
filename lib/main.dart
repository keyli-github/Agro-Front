//app/lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

// Entidades
import 'package:agro/features/plan/domain/entities/plan_item.dart';
import 'package:agro/features/inventory/domain/entities/inventory_item.dart';

// Core
import 'package:agro/core/router/app_router.dart';
import 'package:agro/core/theme/app_theme.dart';

// Variable global para Isar
late Isar isar;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Directorio de la base de datos
  final dir = await getApplicationDocumentsDirectory();

  // Abrimos Isar con ambos schemas
  isar = await Isar.open(
    [
      PlanItemSchema,
      InventoryItemSchema,
    ],
    directory: dir.path,
  );

  runApp(
    const ProviderScope(
      child: AgroApp(),
    ),
  );
}

class AgroApp extends ConsumerWidget {
  const AgroApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Agro App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: router,
    );
  }
}
