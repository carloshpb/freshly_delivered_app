import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routers/app_router.dart';
import '../../application/use_cases/send_password_reset_email_use_case_impl.dart';

final forgotPasswordLoginControllerProvider =
    AsyncNotifierProvider.autoDispose<ForgotPasswordLoginController, void>(
  () => ForgotPasswordLoginController(),
  name: r'forgotPasswordLoginControllerProvider',
);

class ForgotPasswordLoginController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> sendPasswordResetEmail(String email) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(sendPasswordResetEmailUseCaseProvider)
          .execute(request: email);
      ref.read(goRouterProvider).pushReplacement(AppRouter.home.path);
    });
  }

  void clearState() {
    state = const AsyncValue.data(null);
  }
}
