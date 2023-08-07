import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/application/dtos/product_dto.dart';

import '../../data/repositories/products_local_repository_impl.dart';
import '../../data/repositories/products_remote_repository_impl.dart';
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

  @override
  Future<ProductDto> execute(String request) async {
    var product = await _localProductsRepository.findProductById(request);

    if (product.id.isEmpty) {
      product = await _remoteProductsRepository.findProductById(request);

      _localProductsRepository.saveProducts([product]);
    }

    return product.toDto();
  }
}
