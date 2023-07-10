import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routers/app_router.dart';
import '../../application/use_cases/sign_in_email_password_use_case_impl.dart';

final loginControllerProvider =
    AsyncNotifierProvider.autoDispose<LoginController, void>(
  () => LoginController(),
  name: r'loginControllerProvider',
);

class LoginController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(signInUseCaseProvider).execute(request: (email, password));
      ref.read(goRouterProvider).pushReplacement(AppRouter.home.path);
    });
  }

  void clearState() {
    state = const AsyncValue.data(null);
  }
}
