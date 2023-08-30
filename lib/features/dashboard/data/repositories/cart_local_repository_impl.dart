import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../constants/strings.dart';
import '../../../../exceptions/app_sqflite_exception.dart';
import '../../../../exceptions/object_already_added_exception.dart';
import '../../domain/models/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/repositories/products_repository.dart';
import '../apis/local/impl/sqlite_api_impl.dart';
import '../apis/local/sqlite_api.dart';
import 'products_local_repository_impl.dart';

const _customQuery = '''
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
    FROM cart AS c
    JOIN products AS p ON c.id = p.id
    ''';

final cartLocalRepositoryProvider = Provider.autoDispose<CartRepository>(
  (ref) {
    var sqliteApi = ref.watch(sqliteApiProvider);
    var productsLocalRepository = ref.watch(productsLocalRepositoryProvider);
    // var cartStreamController =
    //     StreamController<List<Map<String, Object?>>>.broadcast();

    final cartStreamController = BehaviorSubject<Map<String, Object?>>();

    final transformer =
        StreamTransformer<Map<String, Object?>, CartItem>.fromHandlers(
      handleData: (data, sink) async {
        var modelAdv = CartItem.fromJson(data);
        sink.add(modelAdv);
      },
    );

    sqliteApi.customQuery(_customQuery).then((listCartItemsJson) {
      for (var index = 0; index < listCartItemsJson.length; index++) {
        cartStreamController.add(listCartItemsJson[index]);
      }

      // var cartItemsModels = (listCartItemsJson.isNotEmpty)
      //     ? listCartItemsJson.map((ci) => CartItem.fromJson(ci)).toList()
      //     : <CartItem>[];
      // cartStreamController.add(cartItemsModels);
      // cartStreamController.add(listCartItemsJson);
    });

    ref.onDispose(
      () => cartStreamController.close(),
    );

    return CartLocalRepositoryImpl(
      sqliteApi,
      productsLocalRepository,
      cartStreamController,
      transformer,
    );
  },
);

class CartLocalRepositoryImpl implements CartRepository {
  final SQLiteApi _sqliteApi;
  // final ProductsRepository _productsLocalRepository;
  final BehaviorSubject<Map<String, Object?>> _cartItemsStreamController;
  final StreamTransformer<Map<String, Object?>, CartItem> _cartItemsTransformer;

  CartLocalRepositoryImpl(
    SQLiteApi sqliteApi,
    ProductsRepository productsLocalRepository,
    BehaviorSubject<Map<String, Object?>> cartItemsStreamController,
    StreamTransformer<Map<String, Object?>, CartItem> cartItemsTransformer,
  )   : _sqliteApi = sqliteApi,
        // _productsLocalRepository = productsLocalRepository,
        _cartItemsStreamController = cartItemsStreamController,
        _cartItemsTransformer = cartItemsTransformer;

  @override
  Future<void> setProductToCart(CartItem item) async {
    var itemJson = item.toSimplifiedJson();
    await _sqliteApi.save(
      Strings.userCartLocalTable,
      itemJson,
      itemJson.keys.toList(),
    );

    // // TODO :

    // if (result > 0) {
    //   // var lastCartItemList = await _cartItemsStreamController.stream.last;
    //   // lastCartItemList[lastCartItemList.indexWhere(
    //   //     (currentCartItem) => currentCartItem.id == item.id)] = item;
    //   // _cartItemsStreamController.add(lastCartItemList);
    // } else {
    //   throw ObjectAlreadyAddedException("SQLite");
    // }

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
  void fetchCartProducts() {
    _sqliteApi.customQuery(_customQuery).then((listCartItemsJson) {
      for (var index = 0; index < listCartItemsJson.length; index++) {
        _cartItemsStreamController.add(listCartItemsJson[index]);
      }
    });

    // var result = _sqliteApi.customQuery(_customQuery).then((value) => null);

    // return _cartItemsStreamController.stream.asyncMap(
    //   (listFirestoreItems) async {
    //     var cartItemConvertedList = <CartItem>[];
    //     for (int index = 0; index < listFirestoreItems.length;) {
    //       // if product was removed from local DB due to remote reason, then the cart_item shouldn't exist anymore
    //       if (listFirestoreItems[index]["title"] == null ||
    //           (listFirestoreItems[index]["title"] as String).isEmpty) {
    //         await _sqliteApi.deleteById(
    //             Strings.userCartLocalTable, listFirestoreItems[index]["id"] as String);
    //         continue;
    //       }
    //       var currentCartItem =
    //           CartItem.fromSqliteJson(listFirestoreItems[index]);
    //       cartItemConvertedList.add(currentCartItem);
    //     }
    //     return cartItemConvertedList;
    //   },
    // );
  }

  @override
  Future<void> removeProductAtCart(CartItem item) async {
    var result = await _sqliteApi.deleteById(
        Strings.userCartLocalTable, item.product.id);
    if (result == 0) {
      throw const ObjectNotDeletedException();
    }
  }

  @override
  Stream<CartItem> get streamCartItems =>
      _cartItemsStreamController.transform(_cartItemsTransformer);
}
