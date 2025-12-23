//lib/features/market/domain/entities/market_product.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_product.freezed.dart';
part 'market_product.g.dart';

@freezed
class MarketProduct with _$MarketProduct {
  const factory MarketProduct({
    required String id,
    required String name,
    required double price,
    required String seller,
  }) = _MarketProduct;

  factory MarketProduct.fromJson(Map<String, dynamic> json) => _$MarketProductFromJson(json);
}