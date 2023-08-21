// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/cart_item.dart';
import '../../domain/models/product.dart';
import 'product_dto.dart';

part 'cart_item_dto.freezed.dart';

@freezed
class CartItemDto with _$CartItemDto {
  CartItemDto._();

  factory CartItemDto({
    required NormalProductDto product,
    @Default(1) int amount,
  }) = _CartItemDto;

  late final String productId = product.id;

  CartItem toModel() {
    return CartItem(
      product: product.toModel() as NormalProduct,
      amount: amount,
    );
  }
}
