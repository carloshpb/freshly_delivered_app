import 'dart:async';

import '../models/product.dart';

abstract class ProductsRepository {
  FutureOr<Product> findProductById(String id);
  FutureOr<List<Product>> findProductsByNameWithLimit({
    required String name,
    required ({Product? productObject, int position}) lastProduct,
    int expirationTimeLimit = 5,
  });
  FutureOr<List<Product>> findProductsWithLimit({
    required ({Product? productObject, int position}) lastProduct,
    int expirationTimeLimit = 5,
  });
  FutureOr<List<Product>> findAllProducts();
  Future<void> saveProducts(List<Product> products);
  Future<void> insertOrReplaceProducts(List<Product> products);

  FutureOr<List<Product>> findProductsByAdvertisementId({
    required String advertisementId,
    required ({Product? productObject, int position}) lastProduct,
    int expirationTimeLimit = 5,
  });
  FutureOr<List<Product>> findProductsByPopularity({
    required ({Product? productObject, int position}) lastProduct,
    int expirationTimeLimit = 5,
  });
}
