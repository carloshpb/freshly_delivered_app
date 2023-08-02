import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routers/app_router.dart';

final searchProductTextFieldHomeProvider = StateProvider<String>((ref) => '');

final homeControllerProvider =
    AsyncNotifierProvider.autoDispose<HomeController, (String, String, bool)>(
  () => HomeController(),
  name: r'homeControllerProvider',
);

class HomeController extends AutoDisposeAsyncNotifier<(String, String, bool)> {
  @override
  FutureOr<(String, String, bool)> build() {
    return ('', '', false);
  }

  void updateEmail(String email) {
    state = AsyncValue.data((email, state.value!.$2, state.value!.$3));
  }

  void updatePassword(String password) {
    state = AsyncValue.data((state.value!.$1, password, state.value!.$3));
  }

  Future<void> signIn() async {
    var email = state.value!.$1;
    var password = state.value!.$2;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.watch(signInUseCaseProvider).execute((email, password));
      ref.watch(goRouterProvider).go(AppRouter.home.path);
      return (email, password, true);
    });
  }
}
