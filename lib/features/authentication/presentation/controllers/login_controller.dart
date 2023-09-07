import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/use_cases/sign_in_email_password_use_case_impl.dart';

final loginControllerProvider = AsyncNotifierProvider.autoDispose<
    LoginController,
    ({
      String email,
      String password,
      bool loginSuccess,
    })>(
  () => LoginController(),
  name: r'loginControllerProvider',
);

class LoginController extends AutoDisposeAsyncNotifier<
    ({
      String email,
      String password,
      bool loginSuccess,
    })> {
  @override
  FutureOr<
      ({
        String email,
        String password,
        bool loginSuccess,
      })> build() {
    return (
      email: '',
      password: '',
      loginSuccess: false,
    );
  }

  void updateEmail(String email) {
    state = AsyncValue.data((
      email: email,
      password: state.value!.password,
      loginSuccess: state.value!.loginSuccess,
    ));
  }

  void updatePassword(String password) {
    state = AsyncValue.data((
      email: state.value!.email,
      password: password,
      loginSuccess: state.value!.loginSuccess,
    ));
  }

  Future<void> signIn() async {
    var email = state.value!.email;
    var password = state.value!.password;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.watch(signInUseCaseProvider).execute((email, password));
      // ref.watch(goRouterProvider).go(AppRouter.home.path);
      return (email: email, password: password, loginSuccess: true);
    });
  }
}
