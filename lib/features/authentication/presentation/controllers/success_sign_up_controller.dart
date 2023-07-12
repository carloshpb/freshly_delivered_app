import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routers/app_router.dart';
import '../../application/use_cases/sign_in_email_password_use_case_impl.dart';

final successSignUpControllerProvider =
    AsyncNotifierProvider.autoDispose<SuccessSignUpController, void>(
  () => SuccessSignUpController(),
  name: r'successSignUpControllerProvider',
);

class SuccessSignUpController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() async {}

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = await AsyncValue.guard(() async {
      await ref.read(signInUseCaseProvider).execute(
        request: (email, password),
      );
      ref.read(goRouterProvider).pushReplacement(AppRouter.successSignUp.path);
    });
  }
}
