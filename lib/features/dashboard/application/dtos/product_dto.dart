import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/product.dart';

part 'product_dto.freezed.dart';

@freezed
class ProductDto with _$ProductDto {
  const ProductDto._();

  const factory ProductDto({
    @Default('') String id,
    @Default('') String title,
    @Default(-1.0) double price,
    @Default(-1) int offer,
    @Default('') String description,
    @Default('') String imagePath,
    @Default('') String category,
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
