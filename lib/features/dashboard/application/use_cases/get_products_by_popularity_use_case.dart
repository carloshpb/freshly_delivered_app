import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../exceptions/app_firestore_exception.dart';
import '../../../../exceptions/app_sqlite_exception.dart';
import '../../application/dtos/product_dto.dart';
import '../../data/repositories/products_local_repository_impl.dart';
import '../../data/repositories/products_remote_repository_impl.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/use_cases/get_products_by_popularity_use_case.dart';

final getProductsByPopularityUseCaseProvider =
    Provider<GetProductsByPopularityUseCase>(
  (ref) => GetProductsByPopularityUseCaseImpl(
    ref.watch(productsRemoteRepositoryProvider),
    ref.watch(productsLocalRepositoryProvider),
  ),
);

class GetProductsByPopularityUseCaseImpl
    implements GetProductsByPopularityUseCase {
  final ProductsRepository _remoteProductsRepository;
  final ProductsRepository _localProductsRepository;

  GetProductsByPopularityUseCaseImpl(
    ProductsRepository remoteProductsRepository,
    ProductsRepository localProductsRepository,
  )   : _remoteProductsRepository = remoteProductsRepository,
        _localProductsRepository = localProductsRepository;

  @override
  FutureOr<List<ProductDto>> execute(
      ({
        ProductDto? lastProductObject,
        int lastProductPosition
      }) request) async {
    List<Product> products;
    try {
      products = await _localProductsRepository.findProductsByPopularity(
        lastProduct: (
          position: request.lastProductPosition,
          productObject: request.lastProductObject?.toDomain(),
        ),
      );

      for (var i = 0; i < products.length; i++) {
        if (products[i].id.endsWith("expired")) {
          try {
            var updatedProduct =
                await _remoteProductsRepository.findProductById(
                    products[i].id.replaceFirst(RegExp(r'expired'), ""));

            products[i] = updatedProduct;
          } on NotFoundException {
            products.removeAt(i);
            continue;
          }
        }
      }
    } on DataNotFoundInDbException {
      products = await _remoteProductsRepository.findProductsByPopularity(
        lastProduct: (
          position: request.lastProductPosition,
          productObject: request.lastProductObject?.toDomain(),
        ),
      );

      if (products.isNotEmpty) {
        try {
          _localProductsRepository.saveProducts(products);
        } on DataNotInsertedInDbException catch (e) {
          Logger().e(e.message);
        }
      }
    }

    return (products.isNotEmpty)
        ? products.map((product) => ProductDto.fromDomain(product)).toList()
        : [];
  }
}
