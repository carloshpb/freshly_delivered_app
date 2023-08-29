// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/converters/datetime_timestamp_converter.dart';
import '../../application/dtos/product_dto.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
sealed class Product with _$Product {
  const Product._();

  @JsonSerializable(explicitToJson: true)
  const factory Product.empty() = EmptyProduct;

  @JsonSerializable(explicitToJson: true)
  @Assert('price >= 0.0', 'price cannot be negative')
  @Assert('id != ""', 'id cannot be empty')
  @Assert('title != ""', 'title cannot be empty')
  @Assert('description != ""', 'description cannot be empty')
  @Assert('category != ""', 'category cannot be empty')
  @Assert('imagePath != ""', 'imagePath cannot be empty')
  const factory Product.normal({
    required String id,
    required String title,
    required double price,
    required String description,
    required String category,
    @JsonKey(name: 'image_path') required String imagePath,
    @JsonKey(name: 'units_sold') @Default(0) int unitsSold,
    @JsonKey(name: 'advertisement_id') @Default('') String advertisementId,
    @Default(0) int discount,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'created_at')
    DateTime? createdAt,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'modified_at')
    DateTime? modifiedAt,
  }) = NormalProduct;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);

  ProductDto toDto() => switch (this) {
        NormalProduct() => ProductDto.normal(
            id: (this as NormalProduct).id,
            title: (this as NormalProduct).title,
            price: (this as NormalProduct).price,
            description: (this as NormalProduct).description,
            imagePath: (this as NormalProduct).imagePath,
            category: (this as NormalProduct).category,
            unitsSold: (this as NormalProduct).unitsSold,
            advertisementId: (this as NormalProduct).advertisementId,
            discount: (this as NormalProduct).discount,
          ),
        EmptyProduct() => const ProductDto.empty(),
      };
}
