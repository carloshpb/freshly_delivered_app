// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItem _$$_CartItemFromJson(Map<String, dynamic> json) => _$_CartItem(
      product: NormalProduct.fromJson(json['product'] as Map<String, dynamic>),
      amount: json['amount'] as int? ?? 1,
    );

Map<String, dynamic> _$$_CartItemToJson(_$_CartItem instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
      'amount': instance.amount,
    };