import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routers/app_router.dart';
import '../../application/use_cases/sign_in_email_password_use_case_impl.dart';

final loginControllerProvider =
    AsyncNotifierProvider.autoDispose<LoginController, (String, String, bool)>(
  () => LoginController(),
  name: r'loginControllerProvider',
);

class LoginController extends AutoDisposeAsyncNotifier<(String, String, bool)> {
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
      ref.watch(goRouterProvider).pushReplacement(AppRouter.home.path);
      return (email, password, true);
    });
  }
}
