// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
      imagePath: json['image_path'] as String,
      unitsSold: json['units_sold'] as int? ?? 0,
      discount: json['discount'] == null
          ? const Discount(id: "-1")
          : Discount.fromJson(json['discount'] as Map<String, dynamic>),
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['created_at'] as Timestamp?),
      modifiedAt: const DateTimeTimestampConverter()
          .fromJson(json['modified_at'] as Timestamp?),
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image_path': instance.imagePath,
      'units_sold': instance.unitsSold,
      'discount': instance.discount.toJson(),
      'created_at':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'modified_at':
          const DateTimeTimestampConverter().toJson(instance.modifiedAt),
    };
