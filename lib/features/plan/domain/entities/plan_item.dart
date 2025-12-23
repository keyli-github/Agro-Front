// lib/features/plan/domain/entities/plan_item.dart
import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plan_item.g.dart';

@Collection()
@JsonSerializable()
class PlanItem {
  Id id = Isar.autoIncrement;

  final String planId;
  final String title;
  final String crop;

  PlanItem({
    required this.planId,
    required this.title,
    required this.crop,
  });

  factory PlanItem.fromJson(Map<String, dynamic> json) =>
      _$PlanItemFromJson(json);

  Map<String, dynamic> toJson() => _$PlanItemToJson(this);
}