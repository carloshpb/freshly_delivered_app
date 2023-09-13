import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../exceptions/app_firestore_exception.dart';
import '../../../../exceptions/app_sqlite_exception.dart';
import '../../application/dtos/advertisement_dto.dart';
import '../../application/dtos/product_dto.dart';
import '../../data/repositories/products_local_repository_impl.dart';
import '../../data/repositories/products_remote_repository_impl.dart';
import '../../domain/models/product.dart';
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
    List<Product> products;
    try {
      products = await _localProductsRepository.findProductsByAdvertisementId(
        advertisementId: request.advertisement.id,
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
      products = await _remoteProductsRepository.findProductsByAdvertisementId(
        advertisementId: request.advertisement.id,
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
