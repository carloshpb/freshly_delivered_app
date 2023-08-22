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
    var cartStreamController = StreamController<List<CartItem>>.broadcast();

    sqliteApi.findAll(Strings.userCartLocalTable).then((listCartItemsJson) {
      var cartItemsModels = (listCartItemsJson.isNotEmpty)
          ? listCartItemsJson.map((ci) => CartItem.fromJson(ci)).toList()
          : <CartItem>[];
      cartStreamController.add(cartItemsModels);
    });

    ref.onDispose(
      () => cartStreamController.close(),
    );

    return CartLocalRepositoryImpl(
      sqliteApi,
      cartStreamController,
    );
  },
);

class CartLocalRepositoryImpl implements CartRepository {
  final SQLiteApi _sqliteApi;
  final StreamController<List<CartItem>> _cartItemsStreamController;

  CartLocalRepositoryImpl(
    SQLiteApi sqliteApi,
    StreamController<List<CartItem>> cartItemsStreamController,
  )   : _sqliteApi = sqliteApi,
        _cartItemsStreamController = cartItemsStreamController;

  @override
  Future<void> addProductToCart(CartItem item) async {
    var itemJson = item.toJson();
    int result = await _sqliteApi.save(
      Strings.userCartLocalTable,
      itemJson,
      itemJson.keys.toList(),
    );

    if (result > 0) {
      var lastCartItemList = await _cartItemsStreamController.stream.last;
      lastCartItemList[lastCartItemList.indexWhere((currentCartItem) =>
          currentCartItem.productId == item.productId)] = item;
      _cartItemsStreamController.add(lastCartItemList);
    } else {
      throw ObjectAlreadyAddedException();
    }

    // var resultCartItem =
    //     await _sqliteApi.findById(Strings.userCartLocalTable, item.productId);
    // int result = -1;
    // if (resultCartItem.isNotEmpty && resultCartItem["amount"] != item.amount) {
    //   result = await _sqliteApi.update(
    //     Strings.userCartLocalTable,
    //     [(attributeName: "amount", value: item.amount)],
    //     (attributeName: "product_id", equalValue: item.productId),
    //   );
    // } else if (resultCartItem.isEmpty) {
    //   var itemJson = item.toJson();
    //   result = await _sqliteApi.save(
    //     Strings.userCartLocalTable,
    //     itemJson,
    //     itemJson.keys.toList(),
    //   );
    // } else {
    //   // Do nothing
    // }
    // if (result > 0) {
    //   var lastCartItemList = await _cartItemsStreamController.stream.last;
    //   lastCartItemList[lastCartItemList.indexWhere((currentCartItem) =>
    //       currentCartItem.productId == item.productId)] = item;
    //   _cartItemsStreamController.add(lastCartItemList);
    // }
  }

  @override
  Stream<List<CartItem>> fetchCartProducts() {
    return _cartItemsStreamController.stream;
  }

  @override
  Future<void> updateProductAtCart(CartItem item) {
    // TODO: implement updateProductAtCart
    throw UnimplementedError();
  }
}
