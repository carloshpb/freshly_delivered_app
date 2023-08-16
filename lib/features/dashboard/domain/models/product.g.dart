// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      offer: json['offer'] as int,
      description: json['description'] as String,
      imagePath: json['image_path'] as String,
      category: json['category'] as String,
      unitsSold: json['units_sold'] as int,
      advertisementId: json['advertisement_id'] as String,
      discount: json['discount'] as int,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      modifiedAt: json['modified_at'] == null
          ? null
          : DateTime.parse(json['modified_at'] as String),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'offer': instance.offer,
      'description': instance.description,
      'image_path': instance.imagePath,
      'category': instance.category,
      'units_sold': instance.unitsSold,
      'advertisement_id': instance.advertisementId,
      'discount': instance.discount,
      'created_at': instance.createdAt?.toIso8601String(),
      'modified_at': instance.modifiedAt?.toIso8601String(),
    };
