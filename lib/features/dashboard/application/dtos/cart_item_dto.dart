// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/cart_item.dart';
import 'product_dto.dart';

part 'cart_item_dto.freezed.dart';

@freezed
class CartItemDto with _$CartItemDto {
  const CartItemDto._();

  @Assert('amount >= 0', 'amount cannot negative')
  factory CartItemDto({
    required ProductDto product,
    @Default(1) int amount,
  }) = _CartItemDto;

  factory CartItemDto.fromDomain(CartItem domain) => CartItemDto(
        product: ProductDto.fromDomain(domain.product),
        amount: domain.amount,
      );

  CartItem toDomain() => CartItem(
        product: product.toDomain(),
        amount: amount,
      );
}
