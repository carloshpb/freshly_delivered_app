import 'dart:async';

import '../models/advertisement.dart';
import '../models/product.dart';

abstract class ProductsRepository {
  FutureOr<Product> findProductById(String id);
  FutureOr<List<Product>> findProductsByNameWithLimit(String name, int limit,
      ({Product? productObject, int position}) lastProduct);
  FutureOr<List<Product>> findProductsWithLimit(
      int limit, ({Product? productObject, int position}) lastProduct);
  FutureOr<List<Product>> findAllProducts();
  Future<void> saveProducts(List<Product> products);
  Stream<List<Product>> fetchProductsByAdvertisementId(String advertisementId);
}
