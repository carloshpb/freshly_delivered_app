import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/strings.dart';
import '../../../../exceptions/object_already_added_exception.dart';
import '../../domain/models/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/repositories/products_repository.dart';
import '../apis/local/impl/sqlite_api_impl.dart';
import '../apis/local/sqlite_api.dart';
import 'products_local_repository_impl.dart';

final cartLocalRepositoryProvider = Provider.autoDispose<CartRepository>(
  (ref) {
    var sqliteApi = ref.watch(sqliteApiProvider);
    var productsLocalRepository = ref.watch(productsLocalRepositoryProvider);
    var cartStreamController =
        StreamController<List<Map<String, Object?>>>.broadcast();

    sqliteApi.findAll(Strings.userCartLocalTable).then((listCartItemsJson) {
      // var cartItemsModels = (listCartItemsJson.isNotEmpty)
      //     ? listCartItemsJson.map((ci) => CartItem.fromJson(ci)).toList()
      //     : <CartItem>[];
      // cartStreamController.add(cartItemsModels);
      cartStreamController.add(listCartItemsJson);
    });

    ref.onDispose(
      () => cartStreamController.close(),
    );

    return CartLocalRepositoryImpl(
      sqliteApi,
      productsLocalRepository,
      cartStreamController,
    );
  },
);

class CartLocalRepositoryImpl implements CartRepository {
  final SQLiteApi _sqliteApi;
  // final ProductsRepository _productsLocalRepository;
  final StreamController<List<Map<String, Object?>>> _cartItemsStreamController;

  CartLocalRepositoryImpl(
    SQLiteApi sqliteApi,
    ProductsRepository productsLocalRepository,
    StreamController<List<Map<String, Object?>>> cartItemsStreamController,
  )   : _sqliteApi = sqliteApi,
        // _productsLocalRepository = productsLocalRepository,
        _cartItemsStreamController = cartItemsStreamController;

  @override
  Future<void> setProductToCart(CartItem item) async {
    var itemJson = item.toFirestoreJson();
    int result = await _sqliteApi.save(
      Strings.userCartLocalTable,
      itemJson,
      itemJson.keys.toList(),
    );

    // TODO :

    if (result > 0) {
      // var lastCartItemList = await _cartItemsStreamController.stream.last;
      // lastCartItemList[lastCartItemList.indexWhere(
      //     (currentCartItem) => currentCartItem.id == item.id)] = item;
      // _cartItemsStreamController.add(lastCartItemList);
    } else {
      throw ObjectAlreadyAddedException("SQLite");
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
    // return _cartItemsStreamController.stream;
    // return _cartItemsStreamController.stream.map(
    //   (event) => event.map((itemMap) => CartItem.fromJson(itemMap)).toList(),
    // );

    var customQuery = '''
    SELECT
      c.amount,
      c.id,
      p.title,
      p.price,
      p.description,
      p.category,
      p.image_path,
      p.units_sold,
      p.advertisement_id,
      p.discount,
      p.created_at,
      p.modified_at
    FROM cart_item AS c
    JOIN products AS p ON c.id = p.id
    ''';

    var result = _sqliteApi.customQuery(customQuery).then((value) => null);

    return _cartItemsStreamController.stream.asyncMap(
      (listFirestoreItems) async {
        var cartItemConvertedList = <CartItem>[];
        for (int index = 0; index < listFirestoreItems.length;) {
          // if product was removed from local DB due to remote reason, then the cart_item shouldn't exist anymore
          if (listFirestoreItems[index]["title"] == null ||
              (listFirestoreItems[index]["title"] as String).isEmpty) {
            await _sqliteApi.deleteById(
                "cart", listFirestoreItems[index]["id"] as String);
            continue;
          }
          var currentCartItem =
              CartItem.fromSqliteJson(listFirestoreItems[index]);
          cartItemConvertedList.add(currentCartItem);
        }
        return cartItemConvertedList;
      },
    );
  }

  @override
  Future<void> updateProductAtCart(CartItem item) {
    // TODO: implement updateProductAtCart
    throw UnimplementedError();
  }

  @override
  Future<void> removeProductAtCart(CartItem item) {
    // TODO: implement removeProductAtCart
    throw UnimplementedError();
  }
}
