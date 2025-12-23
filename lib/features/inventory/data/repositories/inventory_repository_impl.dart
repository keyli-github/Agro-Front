//lib/features/inventory/data/repositories/inventory_repository_impl.dart
import 'package:isar_community/isar.dart';
import '../../domain/entities/inventory_item.dart';
import '../../domain/repositories/inventory_repository.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final Isar _isar;
  InventoryRepositoryImpl(this._isar); // El constructor que pide 1 argumento

  @override
  Stream<List<InventoryItem>> watchInventory() {
    // Usamos el esquema generado por Isar (inventoryItems)
    return _isar.inventoryItems.where().watch(fireImmediately: true);
  }

  @override
  Future<void> addItem(InventoryItem item) async {
    await _isar.writeTxn(() async {
      await _isar.inventoryItems.put(item);
    });
  }
}