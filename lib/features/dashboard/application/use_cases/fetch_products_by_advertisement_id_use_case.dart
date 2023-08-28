// import 'dart:async';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../application/dtos/product_dto.dart';
// import '../../data/repositories/products_remote_repository_impl.dart';
// import '../../domain/repositories/products_repository.dart';
// import '../../domain/use_cases/fetch_products_by_advertisement_id_use_case.dart';

// final fetchProductsByAdvertisementIdUseCaseProvider =
//     Provider<FetchProductsByAdvertisementIdUseCase>(
//   (ref) => FetchProductsByAdvertisementIdUseCaseImpl(
//     //ref.watch(productsLocalRepositoryProvider),
//     ref.watch(productsRemoteRepositoryProvider),
//   ),
// );

// class FetchProductsByAdvertisementIdUseCaseImpl
//     implements FetchProductsByAdvertisementIdUseCase {
//   //final ProductsRepository _localProductsRepository;
//   final ProductsRepository _remoteProductsRepository;

//   FetchProductsByAdvertisementIdUseCaseImpl(
//     //ProductsRepository localProductsRepository,
//     ProductsRepository remoteProductsRepository,
//   ) : //_localProductsRepository = localProductsRepository,
//         _remoteProductsRepository = remoteProductsRepository;

//   @override
//   Stream<List<ProductDto>> execute(String request) async* {
//     var streamProducts =
//         _remoteProductsRepository.fetchProductsByAdvertisementId(request);

//     yield* streamProducts.map<List<ProductDto>>(
//       (listProducts) => listProducts
//           .map(
//             (prod) => prod.toDto(),
//           )
//           .toList(),
//     );
//   }
// }
