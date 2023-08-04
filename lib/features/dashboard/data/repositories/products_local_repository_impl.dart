import 'dart:async';

import 'package:freshly_delivered_app/features/dashboard/domain/models/product.dart';

import '../../domain/repositories/products_repository.dart';

class ProductsLocalRepositoryImpl implements ProductsRepository {
  ProductsLocalRepositoryImpl();

  @override
  FutureOr<Product> getProductById(int id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  FutureOr<List<Product>> getProductsWithLimit(int limit) {
    // TODO: implement getProductsWithLimit
    throw UnimplementedError();
  }
}
