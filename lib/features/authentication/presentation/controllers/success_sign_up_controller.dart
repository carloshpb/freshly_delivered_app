import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final successSignUpControllerProvider =
    AsyncNotifierProvider.autoDispose<SuccessSignUpController, void>(
  () => SuccessSignUpController(),
  name: r'successSignUpControllerProvider',
);

class SuccessSignUpController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() async {}

  // Future<void> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   state = await AsyncValue.guard(() async {
  //     await ref.watch(signInUseCaseProvider).execute(
  //       request: (email, password),
  //     );
  //     ref.watch(goRouterProvider).go(AppRouter.successSignUp.path);
  //   });
  // }
}
