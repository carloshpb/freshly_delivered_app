import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dtos/product_dto.dart';
import '../../application/use_cases/find_special_advertisements_use_case_impl.dart';
import '../../application/use_cases/get_last_advertisements_use_case_impl.dart';
import '../../application/use_cases/get_products_with_limit_use_case_impl.dart';
import 'states/home_state.dart';

final searchProductTextFieldHomeProvider = StateProvider<String>((ref) => '');

final filterProductsProvider =
    NotifierProvider<FilterProductsController, List<ProductDto>>(
  () => FilterProductsController(),
  name: r'filterProductsProvider',
);

class FilterProductsController extends Notifier<List<ProductDto>> {
  @override
  List<ProductDto> build() {
    return [];
  }

  void setNewFilteredProducts() {
    var searchProductTextFieldState =
        ref.watch(searchProductTextFieldHomeProvider);
    var homeControllerState = ref.watch(homeControllerProvider);
    if (searchProductTextFieldState.isNotEmpty) {
      var regex = RegExp(searchProductTextFieldState, caseSensitive: false);
      if (homeControllerState.hasValue) {
        state = [
          ...homeControllerState.value!.firstPopularProducts
              .where((product) => regex.hasMatch(product.title))
              .toList(),
          ...homeControllerState.value!.secondPopularProducts
              .where((product) => regex.hasMatch(product.title))
              .toList(),
        ];
      }
    }
  }
}

final homeControllerProvider = AsyncNotifierProvider<HomeController, HomeState>(
  () => HomeController(),
  name: r'homeControllerProvider',
);

class HomeController extends AsyncNotifier<HomeState> {
  @override
  FutureOr<HomeState> build() async {
    var advertisements =
        await ref.watch(getLastAdvertisementsUseCaseProvider).execute();
    var products =
        await ref.watch(getProductsWithLimitUseCaseProvider).execute(20);
    var specialAdvertisement =
        await ref.watch(findSpecialAdvertisementsUseCaseProvider).execute();
    var firstSublistProducts =
        products.sublist(0, (products.length / 2).round());
    var secondSublistProducts = products.sublist((products.length / 2).round());
    return HomeState(
      advertisements: advertisements,
      firstPopularProducts: firstSublistProducts,
      secondPopularProducts: secondSublistProducts,
      specialOffer: specialAdvertisement[0],
    );
  }

  void toggleFavorite() {}
}
