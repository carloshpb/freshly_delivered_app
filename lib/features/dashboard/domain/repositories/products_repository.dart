import 'dart:async';

import '../models/product.dart';

abstract class ProductsRepository {
  FutureOr<Product> findProductById(String id);
  FutureOr<List<Product>> findProductsWithLimit(int limit);
  FutureOr<List<Product>> findAllProducts();
  Future<void> saveProducts(List<Product> products);
}
