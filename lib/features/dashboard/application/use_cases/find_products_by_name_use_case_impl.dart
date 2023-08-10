import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dtos/product_dto.dart';
import '../../data/repositories/products_remote_repository_impl.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/use_cases/find_products_by_name_use_case.dart';

final findProductsByNameUseCaseProvider = Provider<FindProductsByNameUseCase>(
  (ref) => FindProductsByNameUseCaseImpl(
    ref.watch(productsRemoteRepositoryProvider),
  ),
);

class FindProductsByNameUseCaseImpl implements FindProductsByNameUseCase {
  final ProductsRepository _remoteProductsRepository;

  FindProductsByNameUseCaseImpl(
    ProductsRepository remoteProductsRepository,
  ) : _remoteProductsRepository = remoteProductsRepository;

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
            ? request.productObject!.toModel()
            : null,
      ),
    );

    return (products.isNotEmpty)
        ? products.map((adv) => adv.toDto()).toList()
        : [];
  }
}
