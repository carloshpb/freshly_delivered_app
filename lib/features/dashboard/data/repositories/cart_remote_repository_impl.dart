import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/cart.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/cart_repository.dart';
import '../apis/remote/firestore_api.dart';
import '../apis/remote/impl/firestore_api_impl.dart';

// final cartRemoteRepositoryProvider = Provider<CartRepository>(
//   (ref) => CartRemoteRepositoryImpl(ref.watch(sqliteApiProvider)),
// );

final cartRemoteRepositoryProvider = Provider<CartRepository>(
  (ref) => CartRemoteRepositoryImpl(ref.watch(firestoreApiProvider)),
);

class CartRemoteRepositoryImpl implements CartRepository {
  final FirestoreApi _firestoreApi;

  CartRemoteRepositoryImpl(FirestoreApi firestoreApi)
      : _firestoreApi = firestoreApi;

  @override
  Future<void> addProductToCart(Product product, int amount) {
    // TODO: implement addProductToCart
    throw UnimplementedError();
  }

  @override
  FutureOr<Stream<Cart>> fetchCartById(String currentUserId) {
    // TODO: implement fetchCartById
    throw UnimplementedError();
  }
}
