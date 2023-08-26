import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../constants/strings.dart';
import '../../../authentication/data/repositories/firebase_authentication_repository.dart';
import '../../../authentication/domain/models/app_user.dart';
import '../../../authentication/domain/repositories/authentication_repository.dart';
import '../../domain/models/cart_item.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/repositories/products_repository.dart';
import '../apis/remote/firestore_api.dart';
import '../apis/remote/impl/firestore_api_impl.dart';
import 'products_remote_repository_impl.dart';

// import '../../../../utils/update_map_helper.dart' as update_map_helper;

final cartRemoteRepositoryProvider = Provider.autoDispose<CartRepository>(
  (ref) {
    var firestoreApi = ref.watch(firestoreApiProvider);
    var authenticationRepository = ref.watch(authenticationRepositoryProvider);
    var productsRemoteRepository = ref.watch(productsRemoteRepositoryProvider);
    // var cartStreamController = StreamController<List<CartItem>>.broadcast();

    // firestoreApi.findAll(Strings.userCartRemoteTable).then((listCartItemsJson) {
    //   var cartItemsModels = (listCartItemsJson.isNotEmpty)
    //       ? listCartItemsJson.map((ci) => CartItem.fromJson(ci)).toList()
    //       : <CartItem>[];
    //   cartStreamController.add(cartItemsModels);
    // });

    final subject = BehaviorSubject<Map<String, Object?>>();

    final transformer =
        StreamTransformer<Map<String, Object?>, CartItem>.fromHandlers(
      handleData: (data, sink) async {
        if (data["documentChangeType"] == DocumentChangeType.removed) {
          data["amount"] = 0;
        }
        data.remove("documentChangeType");
        var product = await productsRemoteRepository
            .findProductById(data["id"] as String);

        switch (product) {
          case NormalProduct():
            sink.add(
              CartItem(
                product: product,
                amount: data["amount"] as int,
              ),
            );
            break;
          case EmptyProduct():
            break;
        }
      },
    );

    // TODO : This should be tested to see if any changes occurs on authenticationRepository or productsRemoteRepository will recreate the BehaviorSubject and fetch a new SubCollection again.

    var currentSimpleUserData =
        authenticationRepository.currentSimpleUserData();

    firestoreApi.fetchSubCollection(
      Strings.userCartRemoteTable,
      currentSimpleUserData.uid,
      "items",
      subject,
    );

    // var streamCart = firestoreApi.fetchSubCollection(
    //   Strings.userCartRemoteTable,
    //   (currentSimpleUserData as UserSimple).uid,
    //   "items",
    // );

    ref.onDispose(
      () => subject.close(),
    );

    return CartRemoteRepositoryImpl(
      firestoreApi,
      authenticationRepository,
      productsRemoteRepository,
      subject,
      transformer,
    );
  },
);

class CartRemoteRepositoryImpl implements CartRepository {
  final FirestoreApi _firestoreApi;
  final AuthenticationRepository _authenticationRepository;
  final ProductsRepository _productsRepository;
  //final Stream<List<Map<String, Object?>>> _cartItemsStreamController;
  final BehaviorSubject<Map<String, Object?>> _cartItemsStreamController;
  final StreamTransformer<Map<String, Object?>, CartItem>
      _streamCartItemTransformer;

  CartRemoteRepositoryImpl(
    FirestoreApi firestoreApi,
    AuthenticationRepository authenticationRepository,
    ProductsRepository productsRepository,
    BehaviorSubject<Map<String, Object?>> cartItemsStreamController,
    StreamTransformer<Map<String, Object?>, CartItem> streamCartItemTransformer,
  )   : _firestoreApi = firestoreApi,
        _authenticationRepository = authenticationRepository,
        _productsRepository = productsRepository,
        _cartItemsStreamController = cartItemsStreamController,
        _streamCartItemTransformer = streamCartItemTransformer;

  @override
  Stream<CartItem> get streamCartItems =>
      _cartItemsStreamController.transform(_streamCartItemTransformer);

  @override
  Future<void> setProductToCart(CartItem item) async {
    var itemJson = item.toFirestoreJson();
    try {
      var currentSimpleUser = _authenticationRepository.currentSimpleUserData();
      await _firestoreApi.setSubcollection(
        Strings.userCartRemoteTable,
        currentSimpleUser.uid,
        "items",
        itemJson,
      );
    } on Exception {
      // TODO : Handle errors
      return;
    }
  }

  @override
  void fetchCartProducts() {
    var currentSimpleUser = _authenticationRepository.currentSimpleUserData();
    _firestoreApi.fetchSubCollection(
      Strings.userCartRemoteTable,
      currentSimpleUser.uid,
      "items",
      _cartItemsStreamController,
    );
    // return _cartItemsStreamController.asyncMap(
    //   (listFirestoreItems) async {
    //     var cartItemConvertedList = <CartItem>[];
    //     for (int index = 0; index < listFirestoreItems.length; index++) {
    //       var currentId = listFirestoreItems[index]["id"] as String;
    //       // TODO : Treat better product that doesn't exist anymore
    //       var product = await _productsRepository.findProductById(currentId);
    //       switch (product) {
    //         case EmptyProduct():
    //           continue;
    //         default:
    //           cartItemConvertedList.add(
    //             CartItem(
    //               // id: listFirestoreItems[index]["id"] as String,
    //               product: product as NormalProduct,
    //               amount: listFirestoreItems[index]["amount"] as int,
    //             ),
    //           );
    //       }
    //     }
    //     return cartItemConvertedList;
    //   },
    // );
  }

  @override
  Future<void> removeProductAtCart(CartItem item) {
    var itemJson = item.toFirestoreJson();
    var currentSimpleUser = _authenticationRepository.currentSimpleUserData();
    return _firestoreApi.removeFromSubcollection(
      Strings.userCartRemoteTable,
      currentSimpleUser.uid,
      "items",
      itemJson,
    );
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
