// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmptyAdvertisement _$$EmptyAdvertisementFromJson(Map<String, dynamic> json) =>
    _$EmptyAdvertisement(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptyAdvertisementToJson(
        _$EmptyAdvertisement instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$NormalAdvertisement _$$NormalAdvertisementFromJson(
        Map<String, dynamic> json) =>
    _$NormalAdvertisement(
      id: json['id'] as String,
      description: json['description'] as String,
      imagePath: json['image_path'] as String,
      isSpecial: json['is_special'] as bool? ?? false,
      discount: json['discount'] as int? ?? 0,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['created_at'] as Timestamp?),
      modifiedAt: const DateTimeTimestampConverter()
          .fromJson(json['modified_at'] as Timestamp?),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NormalAdvertisementToJson(
        _$NormalAdvertisement instance) =>
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
      'runtimeType': instance.$type,
    };
