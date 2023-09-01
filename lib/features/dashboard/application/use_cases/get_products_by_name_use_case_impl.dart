import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dtos/product_dto.dart';
import '../../data/repositories/products_local_repository_impl.dart';
import '../../data/repositories/products_remote_repository_impl.dart';
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
    var products = await _remoteProductsRepository.findProductsByNameWithLimit(
      request.productName,
      10,
      (
        position: request.position,
        productObject: (request.productObject != null)
            ? request.productObject!.toDomain()
            : null,
      ),
    );

    if (products.isNotEmpty) {
      _localProductsRepository.insertOrReplaceProducts(products);
      return products.map((adv) => ProductDto.fromDomain(adv)).toList();
    }

    return [];
  }
}
