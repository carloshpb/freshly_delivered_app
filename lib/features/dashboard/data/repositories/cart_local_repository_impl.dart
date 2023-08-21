import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/domain/models/cart.dart';

import 'package:freshly_delivered_app/features/dashboard/domain/models/product.dart';

import '../../../../constants/strings.dart';
import '../../../authentication/data/repositories/firebase_authentication_repository.dart';
import '../../domain/repositories/cart_repository.dart';
import '../apis/local/impl/sqlite_api_impl.dart';
import '../apis/local/sqlite_api.dart';

// TODO : Change to StreamProvider with StreamController, to receive and add products to the cart
final cartLocalRepositoryProvider = Provider.autoDispose<CartRepository>(
  (ref) {
    var sqliteApi = ref.watch(sqliteApiProvider);
    var cartStreamController = StreamController<Cart>.broadcast(
      onListen: () =>
          sqliteApi.findAllWithLimit(Strings.userCartLocalTable, 0, 0),
    );
    // var auth = ref.watch(authenticationRepositoryProvider as AlwaysAliveProviderListenable);
    // var cartStreamController = StreamController.broadcast(
    //   onListen: () => sqliteApi.findByAttributeDesc(
    //       "cart", "", attributeName, limit, offset),
    // );
    ref.onDispose(
      () => cartStreamController.close(),
    );
    //return CartLocalRepositoryImpl(ref.watch(sqliteApiProvider));

    return CartLocalRepositoryImpl(
      sqliteApi,
      cartStreamController,
    );
  },
);

class CartLocalRepositoryImpl extends AutoDisposeNotifier<String>
    implements CartRepository {
  late final SQLiteApi _sqliteApi;
  late final StreamController<Cart> _streamController;

  CartLocalRepositoryImpl(
      SQLiteApi sqliteApi, StreamController<Cart> streamController)
      : _sqliteApi = sqliteApi,
        _streamController = streamController;

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
