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
  @Assert('id != ""', 'id cannot be empty')
  @Assert('amount >= 1', 'amount cannot be zero or negative')
  factory CartItem({
    required String id,
    required NormalProduct product,
    @Default(1) int amount,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, Object?> json) =>
      _$CartItemFromJson(json);

  

  factory CartItem.fromSqliteJson(Map<String, Object?> json) => CartItem(
    id: ,
    product: ProductDto.normal(id: id, title: title, price: price, description: description, imagePath: imagePath, category: category,),
    amount: ,
  );

  CartItemDto toDto() {
    return CartItemDto(
      product: product.toDto() as NormalProductDto,
      amount: amount,
    );
  }

  Map<String, Object> toSqliteJson() {
    return {
      "id": id,
      "product_id": product.id,
      "amount": amount,
    };
  }

  Map<String, Object> toFirestoreJson() {
    return {
      "id": id,
      "amount": amount,
    };
  }
}
