// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advertisement _$AdvertisementFromJson(Map<String, dynamic> json) =>
    Advertisement(
      id: json['id'] as int,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$AdvertisementToJson(Advertisement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
    };
