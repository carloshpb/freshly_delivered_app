import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/product.dart';

part 'product_dto.freezed.dart';

@freezed
sealed class ProductDto with _$ProductDto {
  const ProductDto._();

  const factory ProductDto.empty() = EmptyProductDto;

  @Assert('price >= 0.0', 'price cannot be negative')
  @Assert('id != ""', 'id cannot be empty')
  @Assert('title != ""', 'title cannot be empty')
  @Assert('description != ""', 'description cannot be empty')
  @Assert('category != ""', 'category cannot be empty')
  @Assert('imagePath != ""', 'imagePath cannot be empty')
  const factory ProductDto.normal({
    required String id,
    required String title,
    required double price,
    required String description,
    required String imagePath,
    required String category,
    @Default(0) int unitsSold,
    @Default('') String advertisementId,
    @Default(0) int discount,
  }) = NormalProductDto;

  factory ProductDto.fromDomain(Product domain) => switch (domain) {
        NormalProduct() => NormalProductDto(
            id: domain.id,
            title: domain.title,
            price: domain.price,
            description: domain.description,
            imagePath: domain.imagePath,
            category: domain.category,
            unitsSold: domain.unitsSold,
            advertisementId: domain.advertisementId,
            discount: domain.discount,
          ),
        _ => const EmptyProductDto(),
      };

  Product toDomain() {
    return switch (this) {
      NormalProductDto() => NormalProduct(
          id: (this as NormalProductDto).id,
          title: (this as NormalProductDto).title,
          price: (this as NormalProductDto).price,
          description: (this as NormalProductDto).description,
          imagePath: (this as NormalProductDto).imagePath,
          category: (this as NormalProductDto).category,
          unitsSold: (this as NormalProductDto).unitsSold,
          advertisementId: (this as NormalProductDto).advertisementId,
          discount: (this as NormalProductDto).discount,
        ),
      _ => const EmptyProduct(),
    };
  }
}
