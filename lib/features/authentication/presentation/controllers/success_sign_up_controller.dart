import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/exceptions/app_auth_exception.dart';

import '../../../../constants/strings.dart';
import '../../application/dtos/app_user_dto.dart';
import '../../application/use_cases/auth_state_use_case_impl.dart';

final successSignUpControllerProvider =
    AsyncNotifierProvider.autoDispose<SuccessSignUpController, void>(
  () => SuccessSignUpController(),
  name: r'successSignUpControllerProvider',
);

class SuccessSignUpController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() async {}

  void authState() {
    state = const AsyncValue.loading();

    var currentAuthState = ref.watch(authStateUseCaseProvider);

    switch (currentAuthState) {
      case AsyncData():
        switch (currentAuthState.value) {
          case UserNotConnectedDto():
            state = const AsyncValue.error(
                AppAuthException.notConnected(Strings.userNotConnected),
                StackTrace.empty);
          default:
            state = const AsyncValue.data(null);
        }
      case AsyncError():
        state = AsyncValue.error(currentAuthState.error, StackTrace.current);
      default:
      // do nothing
    }
  }
}
