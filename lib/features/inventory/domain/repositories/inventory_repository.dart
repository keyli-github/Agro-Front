//lib/features/inventory/domain/repositories/inventory_repository.dart
import '../entities/inventory_item.dart';

abstract class InventoryRepository {
  Stream<List<InventoryItem>> watchInventory();
  Future<void> addItem(InventoryItem item);
}