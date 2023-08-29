import 'dart:async';

import '../models/product.dart';

abstract class ProductsRepository {
  FutureOr<Product> findProductById(String id);
  FutureOr<List<NormalProduct>> findProductsByNameWithLimit(String name,
      int limit, ({NormalProduct? productObject, int position}) lastProduct);
  FutureOr<List<NormalProduct>> findProductsWithLimit(
      int limit, ({NormalProduct? productObject, int position}) lastProduct);
  FutureOr<List<NormalProduct>> findAllProducts();
  Future<void> saveProducts(List<NormalProduct> products);
  FutureOr<List<NormalProduct>> findProductsByAdvertisementId(
      String advertisementId,
      int limit,
      ({NormalProduct? productObject, int position}) lastProduct);
  FutureOr<List<NormalProduct>> findProductsByPopularity(
      int limit, ({int position, NormalProduct? productObject}) lastProduct);
}
