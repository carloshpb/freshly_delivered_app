import 'dart:async';

import '../models/product.dart';

abstract class ProductsRepository {
  FutureOr<Product> getProductById(int id);
  FutureOr<List<Product>> getProductsWithLimit(int limit);
}
