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
  FutureOr<List<Product>> findProductsWithLimit(
    int limit,
    ({Product? productObject, int position}) lastProduct,
  ) async {
    var resultListMap = await _sqliteApi.findAllWithLimit(
      Strings.productsLocalTable,
      limit,
      lastProduct.position,
      5,
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
  FutureOr<List<Product>> findProductsByNameWithLimit(String name, int limit,
      ({int position, Product? productObject}) lastProduct) async {
    var result = await _sqliteApi.findByAttributeDesc(
      Strings.productsLocalTable,
      name,
      "title",
      limit,
      "title",
      lastProduct.position,
      5,
    );

    return result
        .map(
          (prodMap) => Product.fromJson(prodMap),
        )
        .toList();
  }

  @override
  FutureOr<List<Product>> findProductsByAdvertisementId(
    String advertisementId,
    int limit,
    ({int position, Product? productObject}) lastProduct,
  ) async {
    var result = await _sqliteApi.findByAttributeDesc(
      Strings.productsLocalTable,
      advertisementId,
      'advertisement_id',
      limit,
      "units_sold",
      lastProduct.position,
      5,
      descending: true,
    );

    return result
        .map(
          (prodMap) => Product.fromJson(prodMap),
        )
        .toList();
  }

  @override
  FutureOr<List<Product>> findProductsByPopularity(
    int limit,
    ({int position, Product? productObject}) lastProduct,
  ) async {
    var result = await _sqliteApi.findByAttributeDesc(
      Strings.productsLocalTable,
      null,
      '',
      limit,
      "units_sold",
      lastProduct.position,
      5,
      descending: true,
    );

    return result
        .map(
          (prodMap) => Product.fromJson(prodMap),
        )
        .toList();
  }
}
