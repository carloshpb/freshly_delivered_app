import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dtos/advertisement_dto.dart';
import '../../application/dtos/product_dto.dart';
import '../../data/repositories/products_local_repository_impl.dart';
import '../../data/repositories/products_remote_repository_impl.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/use_cases/get_products_by_advertisement_use_case.dart';

final getProductsByAdvertisementUseCaseProvider =
    Provider<GetProductsByAdvertisementUseCase>(
  (ref) => GetProductsByAdvertisementUseCaseImpl(
    ref.watch(productsRemoteRepositoryProvider),
    ref.watch(productsLocalRepositoryProvider),
    // ref.watch(advertisementsRemoteRepositoryProvider),
  ),
);

class GetProductsByAdvertisementUseCaseImpl
    implements GetProductsByAdvertisementUseCase {
  final ProductsRepository _remoteProductsRepository;
  final ProductsRepository _localProductsRepository;
  // final AdvertisementsRepository _remoteAdvertisementsRepository;

  GetProductsByAdvertisementUseCaseImpl(
    ProductsRepository remoteProductsRepository,
    ProductsRepository localProductsRepository,
    // AdvertisementsRepository remoteAdvertisementsRepository,
  )   : _remoteProductsRepository = remoteProductsRepository,
        _localProductsRepository = localProductsRepository;
  // _remoteAdvertisementsRepository = remoteAdvertisementsRepository;

  @override
  FutureOr<List<ProductDto>> execute(
      ({
        AdvertisementDto advertisement,
        ProductDto? lastProductObject,
        int lastProductPosition
      }) request) async {
    var products =
        await _remoteProductsRepository.findProductsByAdvertisementId(
      advertisementId: request.advertisement.id,
      lastProduct: (
        position: request.lastProductPosition,
        productObject: request.lastProductObject?.toDomain(),
      ),
    );

    if (products.isNotEmpty) {
      _localProductsRepository.insertOrReplaceProducts(products);
      return products.map((prod) => ProductDto.fromDomain(prod)).toList();
    }

    return [];
  }
}
