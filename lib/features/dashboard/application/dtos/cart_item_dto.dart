// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/cart_item.dart';
import '../../domain/models/product.dart';
import 'product_dto.dart';

part 'cart_item_dto.freezed.dart';

@freezed
class CartItemDto with _$CartItemDto {
  const CartItemDto._();

  const factory CartItemDto.empty() = EmptyCartItemDto;

  @Assert('amount >= 0', 'amount cannot negative')
  factory CartItemDto.normal({
    required NormalProductDto product,
    @Default(1) int amount,
  }) = NormalCartItemDto;

  factory CartItemDto.fromDomain(CartItem domain) => switch (domain) {
        NormalCartItem() => NormalCartItemDto(
            product: ProductDto.fromDomain(domain.product) as NormalProductDto,
            amount: domain.amount,
          ),
        _ => const EmptyCartItemDto(),
      };

  CartItem toDomain() {
    return switch (this) {
      NormalCartItemDto() => NormalCartItem(
          product:
              (this as NormalCartItemDto).product.toDomain() as NormalProduct,
          amount: (this as NormalCartItemDto).amount,
        ),
      _ => const EmptyCartItem(),
    };
  }
}
