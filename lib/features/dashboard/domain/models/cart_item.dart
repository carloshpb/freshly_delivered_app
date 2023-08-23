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

  CartItemDto toDto() {
    return CartItemDto(
      product: product.toDto() as NormalProductDto,
      amount: amount,
    );
  }
}
