import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dtos/product_dto.dart';
import '../../../application/use_cases/get_products_with_limit_use_case_impl.dart';

final homePopularProductsControllerProvider = AsyncNotifierProvider<
    HomePopularProductsController, (List<ProductDto>, List<ProductDto>)>(
  () => HomePopularProductsController(),
  name: r'homePopularProductsControllerProvider',
);

class HomePopularProductsController
    extends AsyncNotifier<(List<ProductDto>, List<ProductDto>)> {
  @override
  FutureOr<(List<ProductDto>, List<ProductDto>)> build() async {
    var products = await ref
        .watch(getProductsWithLimitUseCaseProvider)
        .execute((object: null, position: 0));
    var firstSublistProducts =
        products.sublist(0, (products.length / 2).round());
    var secondSublistProducts = products.sublist((products.length / 2).round());
    return (firstSublistProducts, secondSublistProducts);
  }

  void toggleFavorite() {}
}
