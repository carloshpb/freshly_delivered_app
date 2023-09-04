import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/use_cases/get_special_advertisements_use_case_impl.dart';
import '../../application/use_cases/get_last_advertisements_use_case_impl.dart';
import '../../application/use_cases/get_products_with_limit_use_case_impl.dart';
import 'states/home_state.dart';

final homeControllerProvider = AsyncNotifierProvider<HomeController, HomeState>(
  () => HomeController(),
  name: r'homeControllerProvider',
);

class HomeController extends AsyncNotifier<HomeState> {
  @override
  FutureOr<HomeState> build() async {
    var advertisements = await ref
        .watch(getLastAdvertisementsUseCaseProvider)
        .execute((object: null, position: 0));
    var products = await ref
        .watch(getProductsWithLimitUseCaseProvider)
        .execute((object: null, position: 0));
    var specialAdvertisement = await ref
        .watch(getSpecialAdvertisementsUseCaseProvider)
        .execute((object: null, position: 0));
    var firstSublistProducts =
        products.sublist(0, (products.length / 2).round());
    var secondSublistProducts = products.sublist((products.length / 2).round());

    return HomeState(
      advertisements: advertisements,
      firstPopularProducts: firstSublistProducts,
      secondPopularProducts: secondSublistProducts,
      specialOffer: specialAdvertisement[0],
      searchProductName: '',
      searchProductsResult: [],
    );
  }

  void toggleFavorite() {}
}
