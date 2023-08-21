import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../application/dtos/cart_item_dto.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    required List<CartItemDto> cartItems,
  }) = _CartState;

  double get totalPrice => cartItems.fold(
      0.0,
      (previousTotalPrice, cartItem) =>
          (cartItem.amount *
              (cartItem.product.price -
                  cartItem.product.price * cartItem.product.discount / 100)) +
          previousTotalPrice);
}
