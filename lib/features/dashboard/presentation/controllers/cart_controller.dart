import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'states/cart_state.dart';

final cartControllerProvider = AsyncNotifierProvider<CartController, CartState>(
  () => CartController(),
  name: r'cartControllerProvider',
);

class CartController extends AsyncNotifier<CartState> {
  @override
  FutureOr<CartState> build() async {
    // TODO : Test with a stream of CartItems -> change one item from elsewhere and see if this CartController is really listening to the changes
    // var cartItems = ref.watch();

    return const CartState(cartItems: []);
  }
}
