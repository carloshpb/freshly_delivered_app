import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/use_cases/send_password_reset_email_use_case_impl.dart';

final forgotPasswordLoginControllerProvider =
    AsyncNotifierProvider.autoDispose<ForgotPasswordLoginController, bool>(
  () => ForgotPasswordLoginController(),
  name: r'forgotPasswordLoginControllerProvider',
);

final resendTimeMailLinkProvider = StateProvider.autoDispose<int>(
  (ref) => 0,
);

class ForgotPasswordLoginController extends AutoDisposeAsyncNotifier<bool> {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    var isSent = state.value!;
    if (!isSent) {
      state = const AsyncValue.loading();
    }

    state = await AsyncValue.guard(() async {
      if (isSent) {
        ref.read(sendPasswordResetEmailUseCaseProvider).execute(request: email);
      } else {
        await ref
            .read(sendPasswordResetEmailUseCaseProvider)
            .execute(request: email);
      }
      setTimer();
      return true;
      //ref.read(goRouterProvider).pushReplacement(AppRouter.home.path);
    });
  }

  Future<void> setTimer() async {
    final completer = Completer();
    ref.read(resendTimeMailLinkProvider.notifier).state = 20;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      ref.read(resendTimeMailLinkProvider.notifier).state--;
      if (ref.read(resendTimeMailLinkProvider) == 0) {
        completer.complete();
        timer.cancel();
      }
    });
    await completer.future;
  }

  void clearState() {
    state = const AsyncValue.data(false);
  }
}
