import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/domain/models/product.dart';

import '../../../../constants/strings.dart';
import '../../domain/repositories/products_repository.dart';
import '../apis/remote/firestore_api.dart';
import '../apis/remote/impl/firestore_api_impl.dart';

final productsRemoteRepositoryProvider = Provider<ProductsRepository>(
  (ref) => ProductsRemoteRepositoryImpl(ref.watch(firestoreApiProvider)),
);

class ProductsRemoteRepositoryImpl implements ProductsRepository {
  final FirestoreApi _firestoreApi;

  ProductsRemoteRepositoryImpl(FirestoreApi firestoreApi)
      : _firestoreApi = firestoreApi;

  @override
  FutureOr<Product> findProductById(String id) async {
    var resultListMap =
        await _firestoreApi.findById(Strings.productsRemoteTable, id);
    return Product.fromJson(resultListMap);
  }

  @override
  FutureOr<List<Product>> findProductsWithLimit(
    int limit,
    ({Product? productObject, int position}) lastProduct,
  ) async {
    var resultListMap = await _firestoreApi.findAllWithLimit(
      Strings.productsRemoteTable,
      limit,
      lastProduct.productObject,
    );
    return resultListMap
        .map(
          (prodMap) => Product.fromJson(prodMap),
        )
        .toList();
  }

  @override
  FutureOr<List<Product>> findAllProducts() async {
    var resultListMap =
        await _firestoreApi.findAll(Strings.productsRemoteTable);
    return resultListMap
        .map(
          (prodMap) => Product.fromJson(prodMap),
        )
        .toList();
  }

  @override
  Future<void> saveProducts(List<Product> products) async {
    var mapProducts = products.map((prod) => prod.toJson());
    await _firestoreApi.add(Strings.productsRemoteTable, mapProducts);
  }

  @override
  FutureOr<List<Product>> findProductsByNameWithLimit(String name, int limit,
      ({int position, Product? productObject}) lastProduct) async {
    var result = await _firestoreApi.findByAttributeDesc(
      Strings.productsRemoteTable,
      name,
      "title",
      limit,
      lastProduct.productObject,
    );

    return result
        .map(
          (prodMap) => Product.fromJson(prodMap),
        )
        .toList();
  }

  // @override
  // Stream<List<Product>> fetchProductsByAdvertisementId(
  //     String advertisementId) async* {
  //   var resultListMap = _firestoreApi.fetchListByAttributeDesc(
  //     Strings.productsRemoteTable,
  //     advertisementId,
  //     'advertisement_id',
  //     'units_sold',

  //   );

  // }
}
