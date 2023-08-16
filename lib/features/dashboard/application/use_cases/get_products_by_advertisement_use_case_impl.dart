import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dtos/advertisement_dto.dart';
import '../../application/dtos/product_dto.dart';
import '../../data/repositories/advertisements_remote_repository_impl.dart';
import '../../data/repositories/products_remote_repository_impl.dart';
import '../../domain/repositories/advertisements_repository.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/use_cases/get_products_by_advertisement_use_case.dart';

final getProductsByAdvertisementUseCaseProvider =
    Provider<GetProductsByAdvertisementUseCase>(
  (ref) => GetProductsByAdvertisementUseCaseImpl(
    ref.watch(productsRemoteRepositoryProvider),
    ref.watch(advertisementsRemoteRepositoryProvider),
  ),
);

class GetProductsByAdvertisementUseCaseImpl
    implements GetProductsByAdvertisementUseCase {
  final ProductsRepository _remoteProductsRepository;
  final AdvertisementsRepository _remoteAdvertisementsRepository;

  GetProductsByAdvertisementUseCaseImpl(
      ProductsRepository remoteProductsRepository,
      AdvertisementsRepository remoteAdvertisementsRepository)
      : _remoteProductsRepository = remoteProductsRepository,
        _remoteAdvertisementsRepository = remoteAdvertisementsRepository;

  @override
  FutureOr<List<ProductDto>> execute(
      ({
        AdvertisementDto advertisement,
        ProductDto? lastProductObject,
        int lastProductPosition
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
