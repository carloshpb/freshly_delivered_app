// // ignore_for_file: invalid_annotation_target

// import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../application/dtos/cart_dto.dart';
// import 'product.dart';

// part 'cart.freezed.dart';
// part 'cart.g.dart';

// @freezed
// class Cart with _$Cart {
//   const Cart._();

//   @JsonSerializable(explicitToJson: true)
//   @Assert('user_id != ""', 'user_id cannot be empty')
//   factory Cart({
//     @JsonKey(name: 'user_id') required String userId,
//     @JsonKey(name: 'total_price') @Default(0.0) double totalPrice,
//     @Default(<({Product product, double amount})>[])
//     List<({Product product, double amount})> items,
//   }) = _Cart;

//   factory Cart.fromJson(Map<String, Object?> json) => _$CartFromJson(json);

//   CartDto toDto() {
//     return CartDto(
//       userId: userId,
//       totalPrice: totalPrice,
//       items: items
//           .map(
//             (item) => (product: item.product.toDto(), amount: item.amount),
//           )
//           .toList(),
//     );
//   }
// }
