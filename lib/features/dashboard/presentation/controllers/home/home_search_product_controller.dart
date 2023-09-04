import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dtos/product_dto.dart';
import '../../../application/use_cases/get_products_by_name_use_case_impl.dart';

final searchProductTextFieldHomeProvider = StateProvider<String>((ref) => '');

final homeSearchProductsControllerProvider =
    AsyncNotifierProvider<HomeSearchProductsController, List<ProductDto>>(
  () => HomeSearchProductsController(),
  name: r'homeSearchProductsControllerProvider',
);

class HomeSearchProductsController extends AsyncNotifier<List<ProductDto>> {
  @override
  FutureOr<List<ProductDto>> build() {
    var searchProductName = ref.watch(searchProductTextFieldHomeProvider);
    return (searchProductName.isEmpty)
        ? []
        : ref.watch(getProductsByNameUseCaseProvider).execute((
            position: 0,
            productName: searchProductName,
            productObject: null,
          ));
  }

  Future<void> setNewFilteredProducts() async {
    var searchProductTextFieldState =
        ref.watch(searchProductTextFieldHomeProvider);

    var currentFoundProductData = (state.value!.isNotEmpty)
        ? (
            position: state.value!.length - 1,
            productName: searchProductTextFieldState,
            productObject: state.value![state.value!.length - 1],
          )
        : (
            position: 0,
            productName: searchProductTextFieldState,
            productObject: null,
          );

    state = const AsyncValue.loading();

    var productsByName = await ref
        .watch(getProductsByNameUseCaseProvider)
        .execute(currentFoundProductData);

    state = AsyncValue.data(state.value!..addAll(productsByName));

    // if (searchProductTextFieldState.isNotEmpty) {
    //   var regex = RegExp(searchProductTextFieldState, caseSensitive: false);
    //   if (productsByName.hasValue) {
    //     state = [
    //       ...productsByName.value!.firstPopularProducts
    //           .where((product) => regex.hasMatch(product.title))
    //           .toList(),
    //       ...productsByName.value!.secondPopularProducts
    //           .where((product) => regex.hasMatch(product.title))
    //           .toList(),
    //     ];
    //   }
    // }
  }
}
