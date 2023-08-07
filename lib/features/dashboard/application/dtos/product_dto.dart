import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/product.dart';

part 'product_dto.freezed.dart';

@freezed
class ProductDto with _$ProductDto {
  const ProductDto._();

  const factory ProductDto({
    required String id,
    required String title,
    required double price,
    required int offer,
    required String description,
    required String imagePath,
    required String category,
  }) = _ProductDto;

  Product toModel() {
    return Product(
      id: id,
      title: title,
      price: price,
      offer: offer,
      description: description,
      imagePath: imagePath,
      category: category,
      createdAt: DateTime.parse('0000-00-00'),
      modifiedAt: DateTime.parse('0000-00-00'),
    );
  }
}
