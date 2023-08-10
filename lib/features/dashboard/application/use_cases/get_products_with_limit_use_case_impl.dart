import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/application/dtos/product_dto.dart';

import '../../data/repositories/products_local_repository_impl.dart';
import '../../data/repositories/products_remote_repository_impl.dart';
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
    var products = await _localProductsRepository.findProductsWithLimit(
      10,
      (
        position: request.position,
        productObject:
            (request.object != null) ? request.object!.toModel() : null,
      ),
    );

    if (products.isEmpty) {
      products = await _remoteProductsRepository.findProductsWithLimit(
        10,
        (
          position: request.position,
          productObject:
              (request.object != null) ? request.object!.toModel() : null,
        ),
      );

      if (products.isNotEmpty) {
        // TODO : Treat when couldnt be saved locally
        _localProductsRepository.saveProducts(products);
      }
    }

    return (products.isNotEmpty)
        ? products.map((adv) => adv.toDto()).toList()
        : [];
  }
}
