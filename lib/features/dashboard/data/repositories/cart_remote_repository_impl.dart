import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/strings.dart';
import '../../../authentication/data/repositories/firebase_authentication_repository.dart';
import '../../../authentication/domain/models/app_user.dart';
import '../../domain/models/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../apis/remote/firestore_api.dart';
import '../apis/remote/impl/firestore_api_impl.dart';

// import '../../../../utils/update_map_helper.dart' as update_map_helper;

final cartRemoteRepositoryProvider = Provider.autoDispose<CartRepository>(
  (ref) {
    var firestoreApi = ref.watch(firestoreApiProvider);
    var authenticationRepository = ref.watch(authenticationRepositoryProvider);
    // var cartStreamController = StreamController<List<CartItem>>.broadcast();

    // firestoreApi.findAll(Strings.userCartRemoteTable).then((listCartItemsJson) {
    //   var cartItemsModels = (listCartItemsJson.isNotEmpty)
    //       ? listCartItemsJson.map((ci) => CartItem.fromJson(ci)).toList()
    //       : <CartItem>[];
    //   cartStreamController.add(cartItemsModels);
    // });

    var currentSimpleUserData =
        authenticationRepository.currentSimpleUserData();

    var streamCart = firestoreApi.fetchSubCollection(
      Strings.userCartRemoteTable,
      (currentSimpleUserData as UserSimple).uid,
      "items",
    );

    // ref.onDispose(
    //   () => cartStreamController.close(),
    // );

    return CartRemoteRepositoryImpl(firestoreApi, streamCart);
  },
);

class CartRemoteRepositoryImpl implements CartRepository {
  final FirestoreApi _firestoreApi;
  final Stream<List<Map<String, Object?>>> _cartItemsStreamController;

  CartRemoteRepositoryImpl(
    FirestoreApi firestoreApi,
    Stream<List<Map<String, Object?>>> cartItemsStreamController,
  )   : _firestoreApi = firestoreApi,
        _cartItemsStreamController = cartItemsStreamController;

  @override
  Future<void> setProductToCart(CartItem item) async {
    var itemJson = item.toJson();
    try {
      await _firestoreApi.save(
        Strings.userCartRemoteTable,
        itemJson,
      );
    } on Exception {
      // TODO : Handle errors
      return;
    }
  }

  @override
  Stream<List<CartItem>> fetchCartProducts() {
    return _cartItemsStreamController
        .map((event) => event.map((itemMap) => null));
  }

  @override
  Future<void> removeProductAtCart(CartItem item) {
    // TODO: implement removeProductAtCart
    throw UnimplementedError();
  }

  //   var lastCartItemList = await _cartItemsStreamController.stream.last;
  //   lastCartItemList[lastCartItemList.indexWhere(
  //           (currentCartItem) => currentCartItem.productId == item.productId)] =
  //       item;
  //   _cartItemsStreamController.add(lastCartItemList);

  //   // var resultCartItem = await _firestoreApi.findById(
  //   //   Strings.userCartRemoteTable,
  //   //   item.productId,
  //   // );
  //   // int result = -1;
  //   if (resultCartItem.isNotEmpty && resultCartItem["amount"] != item.amount) {
  //     result = await _firestoreApi.update(
  //       Strings.userCartRemoteTable,
  //       [(attributeName: "amount", value: item.amount)],
  //       (attributeName: "product_id", equalValue: item.productId),
  //     );
  //   } else if (resultCartItem.isEmpty) {
  //     var itemJson = item.toJson();
  //     result = await _firestoreApi.save(
  //       Strings.userCartRemoteTable,
  //       itemJson,
  //       itemJson.keys.toList(),
  //     );
  //   } else {
  //     // Do nothing
  //   }
  //   if (result > 0) {
  //     var lastCartItemList = await _cartItemsStreamController.stream.last;
  //     lastCartItemList[lastCartItemList.indexWhere((currentCartItem) =>
  //         currentCartItem.productId == item.productId)] = item;
  //     _cartItemsStreamController.add(lastCartItemList);
  //   }
  // }
}
