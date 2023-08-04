import 'package:freezed_annotation/freezed_annotation.dart';

import '../../application/dtos/product_dto.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
@Freezed(toJson: false, fromJson: false)
class Product with _$Product {
  const Product._();

  factory Product({
    required String id,
    required String title,
    required double price,
    required int offer,
    required String description,
    required String imagePath,
    required String category,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  ProductDto toDto() {
    return ProductDto(
      id: id,
      title: title,
      price: price,
      offer: offer,
      description: description,
      imagePath: imagePath,
      category: category,
    );
  }
}
