import 'dart:async';

import '../models/cart_item.dart';

abstract class CartRepository {
  Stream<NormalCartItem> get streamCartItems;
  void fetchCartProducts();
  Future<void> setProductToCart(NormalCartItem item);
  // Future<void> updateProductAtCart(CartItem item);
  Future<void> removeProductAtCart(NormalCartItem item);
}
