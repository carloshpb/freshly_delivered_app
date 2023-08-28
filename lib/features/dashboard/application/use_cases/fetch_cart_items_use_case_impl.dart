import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/repositories/cart_local_repository_impl.dart';
import '../../data/repositories/cart_remote_repository_impl.dart';
import '../../domain/models/cart_item.dart';

final fetchCartItemsUseCaseImplProvider = StreamProvider.autoDispose<CartItem>(
  (ref) {
    var cartLocalRepository = ref.watch(cartLocalRepositoryProvider);
    var cartRemoteRepository = ref.watch(cartRemoteRepositoryProvider);

    // var stream1 = cartLocalRepository.fetchCartProducts();
    // var stream2 = cartRemoteRepository.fetchCartProducts();

    return MergeStream<CartItem>([
      cartLocalRepository.streamCartItems,
      cartRemoteRepository.streamCartItems,
    ]);
  },
);

// class FetchCartItemsUseCaseImpl implements FetchCartItemsUseCase {
//   @override
//   Stream<List<ProductDto>> execute([void request]) {
//     // TODO: implement execute
//     throw UnimplementedError();
//   }
// }
