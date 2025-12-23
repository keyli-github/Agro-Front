//lib/test/features/inventory/inventory_test.dart
import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agro/features/inventory/presentation/providers/inventory_provider.dart';
import 'package:agro/features/inventory/domain/entities/inventory_item.dart';
import 'package:agro/features/inventory/domain/repositories/inventory_repository.dart';

// Creamos un simulador (Fake) para no tener que pasar Isar en el test
class FakeInventoryRepository implements InventoryRepository {
  final List<InventoryItem> _items = [
    InventoryItem(itemId: '1', name: 'Urea', quantity: 10, unit: 'Sacos'),
  ];

  @override
  Stream<List<InventoryItem>> watchInventory() async* {
    yield _items;
  }

  @override
  Future<void> addItem(InventoryItem item) async {
    _items.add(item);
  }
}

void main() {
  test('El inventario debe cargar los datos iniciales correctamente', () async {
    final container = ProviderContainer(
      overrides: [
        // Usamos el Fake en lugar de la implementación real
        inventoryRepositoryProvider.overrideWithValue(FakeInventoryRepository()),
      ],
    );

    // Obtenemos los datos del stream
    final items = await container.read(inventoryStreamProvider.future);

    expect(items.length, 1);
    expect(items.first.name, 'Urea');
    expect(items.first.itemId, '1');
  });
}