import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/application/dtos/product_dto.dart';
import 'package:logger/logger.dart';

import '../../../../exceptions/app_firestore_exception.dart';
import '../../../../exceptions/app_sqlite_exception.dart';
import '../../data/repositories/products_local_repository_impl.dart';
import '../../data/repositories/products_remote_repository_impl.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/use_cases/get_products_with_limit_use_case.dart';

final getProductsWithLimitUseCaseProvider =
    Provider<GetProductsWithLimitUseCase>(
  (ref) => GetProductsWithLimitUseCaseImpl(
    ref.watch(productsLocalRepositoryProvider),
    ref.watch(productsRemoteRepositoryProvider),
  ),
);

class GetProductsWithLimitUseCaseImpl implements GetProductsWithLimitUseCase {
  final ProductsRepository _localProductsRepository;
  final ProductsRepository _remoteProductsRepository;

  GetProductsWithLimitUseCaseImpl(
    ProductsRepository localProductsRepository,
    ProductsRepository remoteProductsRepository,
  )   : _localProductsRepository = localProductsRepository,
        _remoteProductsRepository = remoteProductsRepository;

  @override
  Future<List<ProductDto>> execute(
      ({ProductDto? object, int position}) request) async {
    List<Product> products;
    try {
      products = await _localProductsRepository.findProductsWithLimit(
        lastProduct: (
          position: request.position,
          productObject: request.object?.toDomain(),
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
      products = await _remoteProductsRepository.findProductsWithLimit(
        lastProduct: (
          position: request.position,
          productObject: request.object?.toDomain(),
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
