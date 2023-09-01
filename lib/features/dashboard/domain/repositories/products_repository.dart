import 'dart:async';

import '../models/product.dart';

abstract class ProductsRepository {
  FutureOr<Product> findProductById(String id);
  FutureOr<List<Product>> findProductsByNameWithLimit(String name, int limit,
      ({Product? productObject, int position}) lastProduct);
  FutureOr<List<Product>> findProductsWithLimit(
      int limit, ({Product? productObject, int position}) lastProduct);
  FutureOr<List<Product>> findAllProducts();
  Future<void> saveProducts(List<Product> products);
  Future<void> insertOrReplaceProducts(List<Product> products);
  FutureOr<List<Product>> findProductsByAdvertisementId(String advertisementId,
      int limit, ({Product? productObject, int position}) lastProduct);
  FutureOr<List<Product>> findProductsByPopularity(
      int limit, ({int position, Product? productObject}) lastProduct);
}
