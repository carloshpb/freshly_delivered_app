import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dtos/product_dto.dart';
import '../../../application/use_cases/get_products_by_name_use_case_impl.dart';

final searchProductTextFieldHomeProvider = StateProvider<String>((ref) => '');

final homeSearchProductsControllerProvider =
    NotifierProvider<HomeSearchProductsController, List<ProductDto>>(
  () => HomeSearchProductsController(),
  name: r'homeSearchProductsControllerProvider',
);

class HomeSearchProductsController extends Notifier<List<ProductDto>> {
  @override
  List<ProductDto> build() {
    return [];
  }

  void setNewFilteredProducts() {
    var searchProductTextFieldState =
        ref.watch(searchProductTextFieldHomeProvider);
    var homeControllerState =
        ref.watch(findProductsByNameUseCaseProvider).execute(request);
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
