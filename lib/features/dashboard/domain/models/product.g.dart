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
      imagePath: json['imagePath'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'offer': instance.offer,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'category': instance.category,
    };
