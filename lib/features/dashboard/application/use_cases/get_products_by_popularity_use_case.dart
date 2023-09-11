import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dtos/product_dto.dart';
import '../../data/repositories/products_local_repository_impl.dart';
import '../../data/repositories/products_remote_repository_impl.dart';
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
    var products = await _remoteProductsRepository.findProductsByPopularity(
      lastProduct: (
        position: request.lastProductPosition,
        productObject: request.lastProductObject?.toDomain(),
      ),
    );

    if (products.isNotEmpty) {
      _localProductsRepository.insertOrReplaceProducts(products);
      return products.map((adv) => ProductDto.fromDomain(adv)).toList();
    }

    return [];
  }
}
