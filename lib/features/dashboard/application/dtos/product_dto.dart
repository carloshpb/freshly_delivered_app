import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/product.dart';

part 'product_dto.freezed.dart';

@freezed
class ProductDto with _$ProductDto {
  const ProductDto._();

  const factory ProductDto({
    required int id,
    required String title,
    required double price,
    required int offer,
    required String description,
    required String image,
    required String category,
  }) = _ProductDto;

  Product toModel() {
    return Product(
      id: id,
      title: title,
      price: price,
      offer: offer,
      description: description,
      image: image,
      category: category,
    );
  }
}
