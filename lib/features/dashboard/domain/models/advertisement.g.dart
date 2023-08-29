// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advertisement _$AdvertisementFromJson(Map<String, dynamic> json) =>
    Advertisement(
      id: json['id'] as String,
      description: json['description'] as String,
      imagePath: json['image_path'] as String,
      isSpecial: json['is_special'] as bool,
      discount: json['discount'] as int,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['created_at'] as Timestamp?),
      modifiedAt: const DateTimeTimestampConverter()
          .fromJson(json['modified_at'] as Timestamp?),
    );

Map<String, dynamic> _$AdvertisementToJson(Advertisement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image_path': instance.imagePath,
      'is_special': instance.isSpecial,
      'discount': instance.discount,
      'created_at':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'modified_at':
          const DateTimeTimestampConverter().toJson(instance.modifiedAt),
    };
