import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/use_cases/send_password_reset_email_use_case_impl.dart';

final forgotPasswordLoginControllerProvider =
    AsyncNotifierProvider.autoDispose<ForgotPasswordLoginController, bool>(
  () => ForgotPasswordLoginController(),
  name: r'forgotPasswordLoginControllerProvider',
);

class ForgotPasswordLoginController extends AutoDisposeAsyncNotifier<bool> {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(sendPasswordResetEmailUseCaseProvider)
          .execute(request: email);
      return true;
      //ref.read(goRouterProvider).pushReplacement(AppRouter.home.path);
    });
  }

  void clearState() {
    state = const AsyncValue.data(false);
  }
}
