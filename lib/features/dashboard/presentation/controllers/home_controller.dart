import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dtos/product_dto.dart';
import 'states/home_state.dart';

// final searchProductTextFieldHomeProvider = StateProvider<String>((ref) => '');

// final filterProductsProvider =
//     NotifierProvider<FilterProductsController, List<ProductDto>>(
//   () => FilterProductsController(),
//   name: r'filterProductsProvider',
// );

// class FilterProductsController extends Notifier<List<ProductDto>> {
//   @override
//   FutureOr<List<ProductDto>> build() {
//     return;
//   }

//   void setNewFilteredProducts() {
//     var searchProductTextFieldState =
//         ref.watch(searchProductTextFieldHomeProvider);
//     var homeControllerState = ref.watch(homeControllerProvider);
//     if (searchProductTextFieldState.isNotEmpty) {
//       var regex = RegExp(searchProductTextFieldState, caseSensitive: false);
//       if (homeControllerState.hasValue) {
//         state = [
//           ...homeControllerState.value!.firstPopularProducts
//               .where((product) => regex.hasMatch(product.title))
//               .toList(),
//           ...homeControllerState.value!.secondPopularProducts
//               .where((product) => regex.hasMatch(product.title))
//               .toList(),
//         ];
//       }
//     }
//   }
// }

final homeControllerProvider = AsyncNotifierProvider<HomeController, HomeState>(
  () => HomeController(),
  name: r'homeControllerProvider',
);

class HomeController extends AsyncNotifier<HomeState> {
  @override
  FutureOr<HomeState> build() {
    return;
  }

  // void updateEmail(String email) {
  //   state = AsyncValue.data((email, state.value!.$2, state.value!.$3));
  // }

  // void updatePassword(String password) {
  //   state = AsyncValue.data((state.value!.$1, password, state.value!.$3));
  // }

  // Future<void> signIn() async {
  //   var email = state.value!.$1;
  //   var password = state.value!.$2;
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() async {
  //     await ref.watch(signInUseCaseProvider).execute((email, password));
  //     ref.watch(goRouterProvider).go(AppRouter.home.path);
  //     return (email, password, true);
  //   });
  // }
}
