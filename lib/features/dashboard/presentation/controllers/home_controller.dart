import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/use_cases/get_products_by_advertisement_use_case_impl.dart';
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
    var popularProducts = await ref
        .watch(getProductsWithLimitUseCaseProvider)
        .execute((object: null, position: 0));
    var specialAdvertisement = await ref
        .watch(getSpecialAdvertisementsUseCaseProvider)
        .execute((object: null, position: 0));
    var specialAdvProducts =
        await ref.watch(getProductsByAdvertisementUseCaseProvider).execute(
      (
        advertisement: specialAdvertisement[0],
        lastProductObject: null,
        lastProductPosition: 0,
      ),
    );

    return HomeState(
      advertisements: advertisements,
      specialOffer: specialAdvertisement[0],
      searchProductName: '',
      searchProductsResult: [],
      popularProducts: popularProducts,
      specialOfferProducts: specialAdvProducts,
    );
  }

  void toggleFavorite() {}
}
