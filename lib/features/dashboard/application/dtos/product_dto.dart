import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/product.dart';
import 'discount_dto.dart';

part 'product_dto.freezed.dart';

@freezed
sealed class ProductDto with _$ProductDto {
  const ProductDto._();

  @Assert('price >= 0.0', 'price cannot be negative')
  @Assert('id != ""', 'id cannot be empty')
  @Assert('title != ""', 'title cannot be empty')
  @Assert('description != ""', 'description cannot be empty')
  @Assert('category != ""', 'category cannot be empty')
  @Assert('imagePath != ""', 'imagePath cannot be empty')
  const factory ProductDto({
    required String id,
    required String title,
    required double price,
    required String description,
    required String imagePath,
    required String category,
    @Default(0) int unitsSold,
    @Default(DiscountDto(id: "-1")) DiscountDto discount,
  }) = _ProductDto;

  factory ProductDto.fromDomain(Product domain) => ProductDto(
        id: domain.id,
        title: domain.title,
        price: domain.price,
        description: domain.description,
        imagePath: domain.imagePath,
        category: domain.category,
        unitsSold: domain.unitsSold,
        discount: DiscountDto.fromDomain(domain.discount),
      );

  Product toDomain() => Product(
        id: id,
        title: title,
        price: price,
        description: description,
        imagePath: imagePath,
        category: category,
        unitsSold: unitsSold,
        discount: discount.toDomain(),
      );
}
