import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/domain/models/product.dart';

import '../../../../constants/strings.dart';
import '../../domain/repositories/products_repository.dart';
import '../apis/local/impl/sqlite_api_impl.dart';
import '../apis/local/sqlite_api.dart';

final productsLocalRepositoryProvider = Provider<ProductsRepository>(
  (ref) => ProductsLocalRepositoryImpl(ref.watch(sqliteApiProvider)),
);

class ProductsLocalRepositoryImpl implements ProductsRepository {
  final _productStringProperties = [
    "id",
    "title",
    "price",
    "offer",
    "description",
    "image_path",
    "category",
    "created_at",
    "modified_at",
  ];

  final SQLiteApi _sqliteApi;

  ProductsLocalRepositoryImpl(SQLiteApi sqliteApi) : _sqliteApi = sqliteApi;

  /// Throws
  @override
  FutureOr<Product> findProductById(String id) async {
    var resultMap =
        await _sqliteApi.findById(Strings.productsLocalTable, id, 5);

    return Product.fromJson(resultMap);
  }

  @override
  FutureOr<List<Product>> findProductsWithLimit({
    required ({Product? productObject, int position}) lastProduct,
    int expirationTimeLimit = 5,
  }) async {
    var resultListMap = await _sqliteApi.findAllWithLimit(
      Strings.productsLocalTable,
      expirationTimeLimit,
      limit: 10,
      offset: lastProduct.position,
    );
    return resultListMap
        .map(
          (prodMap) => Product.fromJson(prodMap),
        )
        .toList();
  }

  @override
  FutureOr<List<Product>> findAllProducts() async {
    var resultListMap = await _sqliteApi.findAll(
      Strings.productsLocalTable,
      5,
    );
    return resultListMap
        .map(
          (prodMap) => Product.fromJson(prodMap),
        )
        .toList();
  }

  @override
  Future<void> saveProducts(List<Product> products) async {
    var mapProducts = products.map((prod) => prod.toJson());
    await _sqliteApi.save(
        Strings.productsLocalTable, mapProducts, _productStringProperties);
  }

  @override
  FutureOr<List<Product>> findProductsByNameWithLimit({
    required String name,
    required ({Product? productObject, int position}) lastProduct,
    int expirationTimeLimit = 5,
  }) async {
    var result = await _sqliteApi.findByAttributeDesc(
      Strings.productsLocalTable,
      name,
      "title",
      "title",
      expirationTimeLimit,
      limit: 10,
      offset: lastProduct.position,
    );

    return result
        .map(
          (prodMap) => Product.fromJson(prodMap),
        )
        .toList();
  }

  @override
  FutureOr<List<Product>> findProductsByAdvertisementId({
    required String advertisementId,
    required ({Product? productObject, int position}) lastProduct,
    int expirationTimeLimit = 5,
  }) async {
    var result = await _sqliteApi.findByAttributeDesc(
      Strings.productsLocalTable,
      advertisementId,
      'advertisement_id',
      "units_sold",
      expirationTimeLimit,
      limit: 10,
      offset: lastProduct.position,
      descending: true,
    );

    return result
        .map(
          (prodMap) => Product.fromJson(prodMap),
        )
        .toList();
  }

  @override
  FutureOr<List<Product>> findProductsByPopularity({
    required ({Product? productObject, int position}) lastProduct,
    int expirationTimeLimit = 5,
  }) async {
    var result = await _sqliteApi.findByAttributeDesc(
      Strings.productsLocalTable,
      null,
      '',
      "units_sold",
      expirationTimeLimit,
      limit: 10,
      offset: lastProduct.position,
      descending: true,
    );

    return result
        .map(
          (prodMap) => Product.fromJson(prodMap),
        )
        .toList();
  }

  @override
  Future<void> insertOrReplaceProducts(List<Product> products) {
    var mapProducts = products.map((prod) => prod.toJson());
    return _sqliteApi.insertOrReplace(
        Strings.productsLocalTable, mapProducts, _productStringProperties);
  }
}
