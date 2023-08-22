// import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../domain/models/cart.dart';
// import 'product_dto.dart';

// part 'cart_dto.freezed.dart';

// @freezed
// class CartDto with _$CartDto {
//   const CartDto._();

//   const factory CartDto({
//     @Default('') String userId,
//     @Default(0.0) double totalPrice,
//     @Default(<({ProductDto product, double amount})>[])
//     List<({ProductDto product, double amount})> items,
//   }) = _CartDto;

//   Cart toModel() {
//     return Cart(
//       userId: userId,
//       totalPrice: totalPrice,
//       items: items
//           .map(
//             (item) => (product: item.product.toModel(), amount: item.amount),
//           )
//           .toList(),
//     );
//   }
// }
