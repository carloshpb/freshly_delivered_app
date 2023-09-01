import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/application/dtos/product_dto.dart';

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
    } on IdNotFoundException {
      product = await _remoteProductsRepository.findProductById(request);
      _localProductsRepository.saveProducts([product]);
    }
    return ProductDto.fromDomain(product);
  }
}
