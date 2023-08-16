import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/domain/models/product.dart';

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

  @override
  FutureOr<Product> findProductById(String id) async {
    var resultMap = await _sqliteApi.findById("products", id);
    return (resultMap.isEmpty)
        ? Product(
            createdAt: DateTime.parse('0000-00-00'),
            modifiedAt: DateTime.parse('0000-00-00'),
          )
        : Product.fromJson(resultMap);
  }

  @override
  FutureOr<List<Product>> findProductsWithLimit(
    int limit,
    ({Product? productObject, int position}) lastProduct,
  ) async {
    var resultListMap = await _sqliteApi.findAllWithLimit(
      "products",
      limit,
      lastProduct.position,
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
      "products",
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
    await _sqliteApi.save("products", mapProducts, _productStringProperties);
  }

  @override
  FutureOr<List<Product>> findProductsByNameWithLimit(String name, int limit,
      ({int position, Product? productObject}) lastProduct) async {
    var result = await _sqliteApi.findByAttributeDesc(
      "products",
      name,
      "title",
      limit,
      lastProduct.position,
    );

    return result
        .map(
          (prodMap) => Product.fromJson(prodMap),
        )
        .toList();
  }

  @override
  Stream<List<Product>> fetchProductsByAdvertisementId(String advertisementId) {
    // TODO: implement fetchProductsByAdvertisementId
    throw UnimplementedError();
  }
}
