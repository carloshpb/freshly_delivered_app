import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/strings.dart';
import '../../domain/models/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../apis/local/impl/sqlite_api_impl.dart';
import '../apis/local/sqlite_api.dart';

final cartLocalRepositoryProvider = Provider.autoDispose<CartRepository>(
  (ref) {
    var sqliteApi = ref.watch(sqliteApiProvider);
    var cartStreamController = StreamController<List<CartItem>>.broadcast(
        // onListen: () {
        //   var cartProducts =
        //       sqliteApi.findAllWithLimit(Strings.userCartLocalTable, 0, 0);
        // },
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

class CartLocalRepositoryImpl implements CartRepository {
  late final SQLiteApi _sqliteApi;
  late final StreamController<List<CartItem>> _streamController;

  CartLocalRepositoryImpl(
      SQLiteApi sqliteApi, StreamController<List<CartItem>> streamController)
      : _sqliteApi = sqliteApi,
        _streamController = streamController {
    _sqliteApi.findAll(Strings.userCartLocalTable).then((listCartItemsJson) {
      var cartItemsModels = (listCartItemsJson.isNotEmpty)
          ? listCartItemsJson.map((ci) => CartItem.fromJson(ci)).toList()
          : <CartItem>[];
      _streamController.add(cartItemsModels);
    });
  }

  @override
  Future<void> addProductToCart(CartItem item) async {
    var resultCartItem =
        await _sqliteApi.findById(Strings.userCartLocalTable, item.productId);
    int result = -1;
    if (resultCartItem.isNotEmpty && resultCartItem["amount"] != item.amount) {
      result = await _sqliteApi.update(
        Strings.userCartLocalTable,
        [(attributeName: "amount", value: item.amount)],
        (attributeName: "product_id", equalValue: item.productId),
      );
    } else if (resultCartItem.isEmpty) {
      var itemJson = item.toJson();
      result = await _sqliteApi.save(
        Strings.userCartLocalTable,
        itemJson,
        itemJson.keys.toList(),
      );
    } else {
      // Do nothing
    }
    if (result > 0) {
      var lastCartItemList = await _streamController.stream.last;
      lastCartItemList[lastCartItemList.indexWhere((currentCartItem) =>
          currentCartItem.productId == item.productId)] = item;
      _streamController.add(lastCartItemList);
    }
  }

  @override
  Stream<List<CartItem>> fetchCartProducts() {
    return _streamController.stream;
  }
}
