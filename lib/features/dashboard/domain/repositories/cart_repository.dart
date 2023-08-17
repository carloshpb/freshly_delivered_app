import 'dart:async';

import '../models/cart.dart';
import '../models/product.dart';

abstract class CartRepository {
  FutureOr<Stream<Cart>> fetchCartById(String currentUserId);
  Future<void> addProductToCart(Product product, int amount);
}
