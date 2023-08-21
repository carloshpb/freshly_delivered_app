import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/domain/models/cart.dart';

import 'package:freshly_delivered_app/features/dashboard/domain/models/product.dart';

import '../../../authentication/data/repositories/firebase_authentication_repository.dart';
import '../../domain/repositories/cart_repository.dart';
import '../apis/local/impl/sqlite_api_impl.dart';
import '../apis/local/sqlite_api.dart';

// TODO : Change to StreamProvider with StreamController, to receive and add products to the cart
final cartLocalRepositoryProvider =
    NotifierProvider.autoDispose<CartLocalRepositoryImpl, String>(
  () {
    // var sqliteApi = ref.watch(sqliteApiProvider);
    // var auth = ref.watch(authenticationRepositoryProvider as AlwaysAliveProviderListenable);
    // var cartStreamController = StreamController.broadcast(
    //   onListen: () => sqliteApi.findByAttributeDesc(
    //       "cart", "", attributeName, limit, offset),
    // );
    // ref.onDispose();
    //return CartLocalRepositoryImpl(ref.watch(sqliteApiProvider));

    return CartLocalRepositoryImpl();
  },
);

class CartLocalRepositoryImpl extends AutoDisposeNotifier<String>
    implements CartRepository {
  late final SQLiteApi _sqliteApi;
  late final StreamController<Cart> _streamController;

  CartLocalRepositoryImpl();

  // CartLocalRepositoryImpl(
  //   SQLiteApi sqliteApi,
  //   StreamController<Cart> streamController,
  // )   : _sqliteApi = sqliteApi,
  //       _streamController = streamController;

  @override
  String build() {
    _sqliteApi = ref.watch(sqliteApiProvider);
    var auth = ref.watch(authenticationRepositoryProvider);
    _streamController = StreamController<Cart>();
    ref.onDispose(
      () => _streamController.close(),
    );
    return (auth.currentUser == null) ? '' : auth.currentUser!.uid;
  }

  @override
  Future<void> addProductToCart(Product product, int amount) {
    // TODO: implement addProductToCart
    throw UnimplementedError();
  }

  @override
  Stream<Cart> fetchCartById(String currentUserId) {
    // TODO: implement fetchCartById
    throw UnimplementedError();
  }
}
