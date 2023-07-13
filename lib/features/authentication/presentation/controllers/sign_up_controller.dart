import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../exceptions/app_auth_exception.dart';
import '../../../../routers/app_router.dart';
import '../../application/use_cases/sign_in_email_password_use_case_impl.dart';
import '../../application/use_cases/sign_up_email_password_use_case_impl.dart';

final signUpControllerProvider =
    AsyncNotifierProvider.autoDispose<SignUpController, bool>(
  () => SignUpController(),
  name: r'signUpControllerProvider',
);

class SignUpController extends AutoDisposeAsyncNotifier<bool> {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> register({
    required String email,
    required String fullName,
    required String phoneNumber,
    required String password,
  }) async {
    state = const AsyncValue<bool>.loading().copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      await ref.read(signUpUseCaseProvider).execute(
        request: (email, password, fullName, phoneNumber),
      );

      // await Future.delayed(const Duration(seconds: 2));
      // throw const EmailAlreadyInUseException();
      return true;
      // ref.read(goRouterProvider).pushReplacement(AppRouter.successSignUp.path);
    });
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await ref.read(signInUseCaseProvider).execute(
        request: (email, password),
      );
    } on Exception catch (e) {
      ref
          .read(goRouterProvider)
          .pushReplacement(AppRouter.login.path, extra: e);
    }

    ref.read(goRouterProvider).pushReplacement(AppRouter.home.path);
    // state = await AsyncValue.guard(() async {
    //   await ref.read(signInUseCaseProvider).execute(
    //     request: (email, password),
    //   );
    //   // ref.read(goRouterProvider).pushReplacement(AppRouter.successSignUp.path);
    // });
  }

  void clearState() {
    state = const AsyncValue.data(false);
  }
}
