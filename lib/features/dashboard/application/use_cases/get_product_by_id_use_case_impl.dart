import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/application/dtos/product_dto.dart';
import 'package:logger/logger.dart';

import '../../../../exceptions/app_firestore_exception.dart';
import '../../../../exceptions/app_sqlite_exception.dart';
import '../../data/repositories/products_local_repository_impl.dart';
import '../../data/repositories/products_remote_repository_impl.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/use_cases/get_product_by_id_use_case.dart';

final getProductByIdUseCaseProvider = Provider<GetProductByIdUseCase>(
  (ref) => GetProductByIdUseCaseImpl(
    ref.watch(productsLocalRepositoryProvider),
    ref.watch(productsRemoteRepositoryProvider),
  ),
);

class GetProductByIdUseCaseImpl implements GetProductByIdUseCase {
  final ProductsRepository _localProductsRepository;
  final ProductsRepository _remoteProductsRepository;

  GetProductByIdUseCaseImpl(
    ProductsRepository localProductsRepository,
    ProductsRepository remoteProductsRepository,
  )   : _localProductsRepository = localProductsRepository,
        _remoteProductsRepository = remoteProductsRepository;

  // May throw NotFoundException
  @override
  Future<ProductDto> execute(String request) async {
    Product product;
    try {
      product = await _localProductsRepository.findProductById(request);

      if (product.id.endsWith("expired")) {
        var updatedAdv = await _remoteProductsRepository
            .findProductById(product.id.replaceFirst(RegExp(r'expired'), ""));

        product = updatedAdv;
      }
    } on IdNotFoundException {
      try {
        product = await _remoteProductsRepository.findProductById(request);
      } on NotFoundException {
        product = Product.empty();
      }

      try {
        _localProductsRepository.saveProducts([product]);
      } on DataNotInsertedInDbException catch (e) {
        Logger().e(e.message);
      }
    } on NotFoundException {
      product = Product.empty();
    }
    return ProductDto.fromDomain(product);
  }
}
