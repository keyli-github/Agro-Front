// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MarketProduct _$MarketProductFromJson(Map<String, dynamic> json) {
  return _MarketProduct.fromJson(json);
}

/// @nodoc
mixin _$MarketProduct {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get seller => throw _privateConstructorUsedError;

  /// Serializes this MarketProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MarketProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarketProductCopyWith<MarketProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketProductCopyWith<$Res> {
  factory $MarketProductCopyWith(
    MarketProduct value,
    $Res Function(MarketProduct) then,
  ) = _$MarketProductCopyWithImpl<$Res, MarketProduct>;
  @useResult
  $Res call({String id, String name, double price, String seller});
}

/// @nodoc
class _$MarketProductCopyWithImpl<$Res, $Val extends MarketProduct>
    implements $MarketProductCopyWith<$Res> {
  _$MarketProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? seller = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            seller: null == seller
                ? _value.seller
                : seller // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MarketProductImplCopyWith<$Res>
    implements $MarketProductCopyWith<$Res> {
  factory _$$MarketProductImplCopyWith(
    _$MarketProductImpl value,
    $Res Function(_$MarketProductImpl) then,
  ) = __$$MarketProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double price, String seller});
}

/// @nodoc
class __$$MarketProductImplCopyWithImpl<$Res>
    extends _$MarketProductCopyWithImpl<$Res, _$MarketProductImpl>
    implements _$$MarketProductImplCopyWith<$Res> {
  __$$MarketProductImplCopyWithImpl(
    _$MarketProductImpl _value,
    $Res Function(_$MarketProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarketProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? seller = null,
  }) {
    return _then(
      _$MarketProductImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        seller: null == seller
            ? _value.seller
            : seller // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketProductImpl implements _MarketProduct {
  const _$MarketProductImpl({
    required this.id,
    required this.name,
    required this.price,
    required this.seller,
  });

  factory _$MarketProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketProductImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final String seller;

  @override
  String toString() {
    return 'MarketProduct(id: $id, name: $name, price: $price, seller: $seller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.seller, seller) || other.seller == seller));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, seller);

  /// Create a copy of MarketProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketProductImplCopyWith<_$MarketProductImpl> get copyWith =>
      __$$MarketProductImplCopyWithImpl<_$MarketProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketProductImplToJson(this);
  }
}

abstract class _MarketProduct implements MarketProduct {
  const factory _MarketProduct({
    required final String id,
    required final String name,
    required final double price,
    required final String seller,
  }) = _$MarketProductImpl;

  factory _MarketProduct.fromJson(Map<String, dynamic> json) =
      _$MarketProductImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  String get seller;

  /// Create a copy of MarketProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketProductImplCopyWith<_$MarketProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
