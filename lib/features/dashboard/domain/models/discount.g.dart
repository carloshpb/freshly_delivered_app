// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Discount _$$_DiscountFromJson(Map<String, dynamic> json) => _$_Discount(
      id: json['id'] as String,
      discountPercent: json['discountPercent'] as int? ?? 0,
      expiresAt: const DateTimeTimestampConverter()
          .fromJson(json['expires_at'] as Timestamp?),
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['created_at'] as Timestamp?),
      modifiedAt: const DateTimeTimestampConverter()
          .fromJson(json['modified_at'] as Timestamp?),
    );

Map<String, dynamic> _$$_DiscountToJson(_$_Discount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'discountPercent': instance.discountPercent,
      'expires_at':
          const DateTimeTimestampConverter().toJson(instance.expiresAt),
      'created_at':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'modified_at':
          const DateTimeTimestampConverter().toJson(instance.modifiedAt),
    };
