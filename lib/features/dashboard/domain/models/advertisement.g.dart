// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Advertisement _$$_AdvertisementFromJson(Map<String, dynamic> json) =>
    _$_Advertisement(
      id: json['id'] as String,
      description: json['description'] as String,
      imagePath: json['image_path'] as String,
      isSpecial: json['is_special'] as bool? ?? false,
      discount: json['discount'] == null
          ? const Discount(id: '-1')
          : Discount.fromJson(json['discount'] as Map<String, dynamic>),
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['created_at'] as Timestamp?),
      modifiedAt: const DateTimeTimestampConverter()
          .fromJson(json['modified_at'] as Timestamp?),
    );

Map<String, dynamic> _$$_AdvertisementToJson(_$_Advertisement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image_path': instance.imagePath,
      'is_special': instance.isSpecial,
      'discount': instance.discount.toJson(),
      'created_at':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'modified_at':
          const DateTimeTimestampConverter().toJson(instance.modifiedAt),
    };
