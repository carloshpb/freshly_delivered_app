import 'dart:async';

import '../models/cart_item.dart';

abstract class CartRepository {
  Stream<List<CartItem>> fetchCartProducts();
  Future<void> addProductToCart(CartItem item);
}
