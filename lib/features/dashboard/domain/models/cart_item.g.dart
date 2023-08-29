// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmptyCartItem _$$EmptyCartItemFromJson(Map<String, dynamic> json) =>
    _$EmptyCartItem(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptyCartItemToJson(_$EmptyCartItem instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$NormalCartItem _$$NormalCartItemFromJson(Map<String, dynamic> json) =>
    _$NormalCartItem(
      product: NormalProduct.fromJson(json['product'] as Map<String, dynamic>),
      amount: json['amount'] as int? ?? 1,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['created_at'] as Timestamp?),
      modifiedAt: const DateTimeTimestampConverter()
          .fromJson(json['modified_at'] as Timestamp?),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NormalCartItemToJson(_$NormalCartItem instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
      'amount': instance.amount,
      'created_at':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'modified_at':
          const DateTimeTimestampConverter().toJson(instance.modifiedAt),
      'runtimeType': instance.$type,
    };
