// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarketProductImpl _$$MarketProductImplFromJson(Map<String, dynamic> json) =>
    _$MarketProductImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      seller: json['seller'] as String,
    );

Map<String, dynamic> _$$MarketProductImplToJson(_$MarketProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'seller': instance.seller,
    };
