//lib/features/inventory/domain/entities/inventory_item.dart
import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inventory_item.g.dart';

@Collection()
@JsonSerializable()
class InventoryItem {
  Id id = Isar.autoIncrement; 

  final String itemId;
  final String name;
  final double quantity;
  final String unit;

  InventoryItem({
    required this.itemId,
    required this.name,
    required this.quantity,
    required this.unit,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryItemToJson(this);
}
