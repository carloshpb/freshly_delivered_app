// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../application/dtos/cart_item_dto.dart';
import '../../application/dtos/product_dto.dart';
import 'product.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  CartItem._();

  @JsonSerializable(explicitToJson: true)
  // @Assert('id != ""', 'id cannot be empty')
  @Assert('amount >= 0', 'amount cannot negative')
  factory CartItem({
    // required String id,
    required NormalProduct product,
    @Default(1) int amount,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, Object?> json) =>
      _$CartItemFromJson(json);

  CartItemDto toDto() {
    return CartItemDto(
      product: product.toDto() as NormalProductDto,
      amount: amount,
    );
  }

  factory CartItem.fromSqliteJson(Map<String, Object?> json) => CartItem(
        // id: json["cart_id"] as String,
        amount: json["amount"] as int,
        product: NormalProduct(
          id: json["id"] as String,
          title: json["title"] as String,
          price: json["price"] as double,
          description: json["description"] as String,
          imagePath: json["image_path"] as String,
          category: json["category"] as String,
          unitsSold: json["units_sold"] as int,
          advertisementId: json["advertisement_id"] as String,
          discount: json["discount"] as int,
          createdAt: ((json["created_at"] as String).isEmpty)
              ? null
              : DateTime.parse((json["created_at"] as String)),
          modifiedAt: ((json["modified_at"] as String).isEmpty)
              ? null
              : DateTime.parse((json["modified_at"] as String)),
        ),
      );

  Map<String, Object> toFirestoreJson() {
    return {
      "id": product.id,
      "amount": amount,
    };
  }
}
