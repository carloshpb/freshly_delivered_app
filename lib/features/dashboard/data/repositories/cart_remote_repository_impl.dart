import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../constants/strings.dart';
import '../../../../exceptions/app_auth_exception.dart';
import '../../../authentication/data/repositories/firebase_authentication_repository.dart';
import '../../../authentication/domain/models/app_user.dart';
import '../../../authentication/domain/repositories/authentication_repository.dart';
import '../../domain/models/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
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

        sink.add(
          CartItem(
            product: product,
            amount: data["amount"] as int,
          ),
        );
      },
    );

    // TODO : This should be tested to see if any changes occurs on authenticationRepository or productsRemoteRepository will recreate the BehaviorSubject and fetch a new SubCollection again.

    var currentSimpleUserData =
        authenticationRepository.currentSimpleUserData();

    switch (currentSimpleUserData) {
      case UserNotConnected():
        ref.invalidateSelf();
        break;
      default:
        firestoreApi.fetchSubCollection(
          Strings.userCartRemoteTable,
          (currentSimpleUserData as UserSimple).id,
          "items",
          subject,
        );
    }

    ref.onDispose(
      () => subject.close(),
    );

    return CartRemoteRepositoryImpl(
      firestoreApi,
      authenticationRepository,
      //productsRemoteRepository,
      subject,
      transformer,
      ref,
    );
  },
);

class CartRemoteRepositoryImpl implements CartRepository {
  final FirestoreApi _firestoreApi;
  final AuthenticationRepository _authenticationRepository;
  //final ProductsRepository _productsRepository;
  //final Stream<List<Map<String, Object?>>> _cartItemsStreamController;
  final BehaviorSubject<Map<String, Object?>> _cartItemsStreamController;
  final StreamTransformer<Map<String, Object?>, CartItem>
      _streamCartItemTransformer;

  CartRemoteRepositoryImpl(
    FirestoreApi firestoreApi,
    AuthenticationRepository authenticationRepository,
    //ProductsRepository productsRepository,
    BehaviorSubject<Map<String, Object?>> cartItemsStreamController,
    StreamTransformer<Map<String, Object?>, CartItem> streamCartItemTransformer,
    Ref ref,
  )   : _firestoreApi = firestoreApi,
        _authenticationRepository = authenticationRepository,
        //_productsRepository = productsRepository,
        _cartItemsStreamController = cartItemsStreamController,
        _streamCartItemTransformer = streamCartItemTransformer;

  @override
  Stream<CartItem> get streamCartItems =>
      _cartItemsStreamController.transform(_streamCartItemTransformer);

  @override
  Future<void> setProductToCart(CartItem item) {
    var itemJson = item.toJson();
    // UserSimple currentSimpleUser;

    var currentSimpleUser = _authenticationRepository.currentSimpleUserData();

    switch (currentSimpleUser) {
      case UserNotConnected():
        throw const AppAuthException.notConnected(
            "Not allowed to set product to cart because user is not connected");
      default:
        return _firestoreApi.setSubcollection(
          Strings.userCartRemoteTable,
          (currentSimpleUser as UserSimple).id,
          "items",
          itemJson,
        );
    }
  }

  @override
  void fetchCartProducts() {
    var currentSimpleUser = _authenticationRepository.currentSimpleUserData();

    switch (currentSimpleUser) {
      case UserNotConnected():
        throw const AppAuthException.notConnected(
            "Not allowed to set product to cart because user is not connected");
      default:
        _firestoreApi.fetchSubCollection(
          Strings.userCartRemoteTable,
          (currentSimpleUser as UserSimple).id,
          "items",
          _cartItemsStreamController,
        );
    }
  }

  @override
  Future<void> removeProductAtCart(CartItem item) async {
    var itemJson = item.toSimplifiedJson();

    var currentSimpleUser = _authenticationRepository.currentSimpleUserData();

    switch (currentSimpleUser) {
      case UserNotConnected():
        throw const AppAuthException.notConnected(
            "Not allowed to set product to cart because user is not connected");
      default:
        return _firestoreApi.removeFromSubcollection(
          Strings.userCartRemoteTable,
          (currentSimpleUser as UserSimple).id,
          "items",
          itemJson,
        );
    }
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
