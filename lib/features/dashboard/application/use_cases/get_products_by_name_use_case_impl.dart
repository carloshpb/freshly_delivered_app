import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dtos/product_dto.dart';
import '../../data/repositories/products_remote_repository_impl.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/use_cases/get_products_by_name_use_case.dart';

final getProductsByNameUseCaseProvider = Provider<GetProductsByNameUseCase>(
  (ref) => GetProductsByNameUseCaseImpl(
    ref.watch(productsRemoteRepositoryProvider),
  ),
);

class GetProductsByNameUseCaseImpl implements GetProductsByNameUseCase {
  final ProductsRepository _remoteProductsRepository;

  GetProductsByNameUseCaseImpl(
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
