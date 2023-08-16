import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/use_cases/get_last_advertisements_use_case_impl.dart';

final homeLoadingControllerProvider =
    AsyncNotifierProvider<HomeLoadingController, bool>(
  () => HomeLoadingController(),
  name: r'homeLoadingControllerProvider',
);

class HomeLoadingController extends AsyncNotifier<bool> {
  @override
  FutureOr<bool> build() async {
    var advertisements = await ref
        .watch(getLastAdvertisementsUseCaseProvider)
        .execute((object: null, position: 0));
    var products = await ref
        .watch(getProductsWithLimitUseCaseProvider)
        .execute((object: null, position: 0));
    var specialAdvertisement = await ref
        .watch(findSpecialAdvertisementsUseCaseProvider)
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
