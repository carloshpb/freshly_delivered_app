import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/cart.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/cart_repository.dart';
import '../apis/local/impl/sqlite_api_impl.dart';
import '../apis/local/sqlite_api.dart';

// final cartRemoteRepositoryProvider = Provider<CartRepository>(
//   (ref) => CartRemoteRepositoryImpl(ref.watch(sqliteApiProvider)),
// );

final cartRemoteRepositoryProvider = Provider<CartRepository>(
  (ref) => CartRemoteRepositoryImpl(ref.watch(sqliteApiProvider)),
);

class CartRemoteRepositoryImpl implements CartRepository {
  final SQLiteApi _sqliteApi;

  CartRemoteRepositoryImpl(SQLiteApi sqliteApi) : _sqliteApi = sqliteApi;

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
