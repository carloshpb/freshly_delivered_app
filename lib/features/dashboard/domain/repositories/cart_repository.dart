import 'dart:async';

import '../models/cart_item.dart';

abstract class CartRepository {
  Stream<List<CartItem>> fetchCartProducts();
  Future<void> setProductToCart(CartItem item);
  // Future<void> updateProductAtCart(CartItem item);
  Future<void> removeProductAtCart(CartItem item);
}
