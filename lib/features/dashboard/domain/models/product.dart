// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/converters/datetime_timestamp_converter.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
sealed class Product with _$Product {
  // const Product._();

  // @JsonSerializable(explicitToJson: true)
  // const factory Product.empty() = EmptyProduct;

  @JsonSerializable(explicitToJson: true)
  @Assert('price >= 0.0', 'price cannot be negative')
  @Assert('id != ""', 'id cannot be empty')
  @Assert('title != ""', 'title cannot be empty')
  @Assert('description != ""', 'description cannot be empty')
  @Assert('category != ""', 'category cannot be empty')
  @Assert('imagePath != ""', 'imagePath cannot be empty')
  const factory Product({
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
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);

  // factory Product.fromSqliteJson(Map<String, Object?> json) {
  //   var datetimeConverter = const DateTimeToMillisecondsSinceEpochConverter();

  //   switch (json['runtimeType']) {
  //     case 'empty':
  //       return EmptyProduct.fromJson(json);
  //     case 'normal':
  //       return NormalProduct(
  //         id: json['id'] as String,
  //         title: json['title'] as String,
  //         price: (json['price'] as num).toDouble(),
  //         description: json['description'] as String,
  //         category: json['category'] as String,
  //         imagePath: json['image_path'] as String,
  //         unitsSold: json['units_sold'] as int? ?? 0,
  //         advertisementId: json['advertisement_id'] as String? ?? '',
  //         discount: json['discount'] as int? ?? 0,
  //         createdAt: datetimeConverter.fromJson(json['created_at'] as int),
  //         modifiedAt: datetimeConverter.fromJson(json['modified_at'] as int),
  //       );

  //     default:
  //       throw CheckedFromJsonException(json, 'runtimeType', 'Product',
  //           'Invalid union type "${json['runtimeType']}"!');
  //   }
  // }

  // Map<String, dynamic> toSqliteJson() {
  //   var datetimeConverter = const DateTimeToMillisecondsSinceEpochConverter();

  //   switch (this) {
  //     case EmptyProduct():
  //       return toJson();
  //     case NormalProduct():
  //       return <String, dynamic>{
  //         'id': (this as NormalProduct).id,
  //         'title': (this as NormalProduct).title,
  //         'price': (this as NormalProduct).price,
  //         'description': (this as NormalProduct).description,
  //         'category': (this as NormalProduct).category,
  //         'image_path': (this as NormalProduct).imagePath,
  //         'units_sold': (this as NormalProduct).unitsSold,
  //         'advertisement_id': (this as NormalProduct).advertisementId,
  //         'discount': (this as NormalProduct).discount,
  //         'created_at':
  //             datetimeConverter.toJson((this as NormalProduct).createdAt),
  //         'modified_at':
  //             datetimeConverter.toJson((this as NormalProduct).modifiedAt),
  //         'runtimeType': "normal",
  //       };
  //     default:
  //       var thisJson = toJson();
  //       throw CheckedToJsonException(thisJson, 'runtimeType', 'Product',
  //           'Invalid union type "${thisJson['runtimeType']}"!');
  //   }
  // }
}
