// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmptyProduct _$$EmptyProductFromJson(Map<String, dynamic> json) =>
    _$EmptyProduct(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptyProductToJson(_$EmptyProduct instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$NormalProduct _$$NormalProductFromJson(Map<String, dynamic> json) =>
    _$NormalProduct(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
      imagePath: json['image_path'] as String,
      unitsSold: json['units_sold'] as int? ?? 0,
      advertisementId: json['advertisement_id'] as String? ?? '',
      discount: json['discount'] as int? ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      modifiedAt: json['modified_at'] == null
          ? null
          : DateTime.parse(json['modified_at'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NormalProductToJson(_$NormalProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image_path': instance.imagePath,
      'units_sold': instance.unitsSold,
      'advertisement_id': instance.advertisementId,
      'discount': instance.discount,
      'created_at': instance.createdAt?.toIso8601String(),
      'modified_at': instance.modifiedAt?.toIso8601String(),
      'runtimeType': instance.$type,
    };
