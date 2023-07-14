import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routers/app_router.dart';
import '../../application/use_cases/sign_in_email_password_use_case_impl.dart';

final loginControllerProvider =
    AsyncNotifierProvider.autoDispose<LoginController, (String, String)>(
  () => LoginController(),
  name: r'loginControllerProvider',
);

class LoginController extends AutoDisposeAsyncNotifier<(String, String)> {
  @override
  FutureOr<(String, String)> build() {
    return ('', '');
  }

  void updateEmail(String email) {
    state = AsyncValue.data((email, state.value!.$2));
  }

  void updatePassword(String password) {
    state = AsyncValue.data((state.value!.$1, password));
  }

  Future<void> signIn() async {
    var email = state.value!.$1;
    var password = state.value!.$2;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(signInUseCaseProvider).execute(request: (email, password));
      ref.read(goRouterProvider).pushReplacement(AppRouter.home.path);
      return (email, password);
    });
  }
}
