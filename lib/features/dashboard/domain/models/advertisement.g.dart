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
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      modifiedAt: json['modified_at'] == null
          ? null
          : DateTime.parse(json['modified_at'] as String),
    );

Map<String, dynamic> _$AdvertisementToJson(Advertisement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image_path': instance.imagePath,
      'is_special': instance.isSpecial,
      'discount': instance.discount,
      'created_at': instance.createdAt?.toIso8601String(),
      'modified_at': instance.modifiedAt?.toIso8601String(),
    };
