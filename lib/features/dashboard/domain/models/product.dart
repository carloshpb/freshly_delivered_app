import 'package:freezed_annotation/freezed_annotation.dart';

import '../../application/dtos/product_dto.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
@Freezed(toJson: false, fromJson: false)
class Product with _$Product {
  const Product._();

  factory Product({
    @Default('') String id,
    @Default('') String title,
    @Default(-1.0) double price,
    @Default(-1) int offer,
    @Default('') String description,
    @Default('') String imagePath,
    @Default('') String category,
    required DateTime createdAt,
    required DateTime modifiedAt,
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
