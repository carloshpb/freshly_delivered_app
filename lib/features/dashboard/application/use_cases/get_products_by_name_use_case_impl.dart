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
import '../../domain/use_cases/get_products_by_name_use_case.dart';

final getProductsByNameUseCaseProvider = Provider<GetProductsByNameUseCase>(
  (ref) => GetProductsByNameUseCaseImpl(
    ref.watch(productsRemoteRepositoryProvider),
    ref.watch(productsLocalRepositoryProvider),
  ),
);

class GetProductsByNameUseCaseImpl implements GetProductsByNameUseCase {
  final ProductsRepository _remoteProductsRepository;
  final ProductsRepository _localProductsRepository;

  GetProductsByNameUseCaseImpl(
    ProductsRepository remoteProductsRepository,
    ProductsRepository localProductsRepository,
  )   : _remoteProductsRepository = remoteProductsRepository,
        _localProductsRepository = localProductsRepository;

  @override
  FutureOr<List<ProductDto>> execute(
      ({
        String productName,
        int position,
        ProductDto? productObject
      }) request) async {
    List<Product> products;
    try {
      products = await _localProductsRepository.findProductsByNameWithLimit(
        name: request.productName,
        lastProduct: (
          position: request.position,
          productObject: request.productObject?.toDomain(),
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
      products = await _remoteProductsRepository.findProductsByNameWithLimit(
        name: request.productName,
        lastProduct: (
          position: request.position,
          productObject: request.productObject?.toDomain(),
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
