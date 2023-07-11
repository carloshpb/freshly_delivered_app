import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/use_cases/sign_up_email_password_use_case_impl.dart';

final signUpControllerProvider =
    AsyncNotifierProvider.autoDispose<SignUpController, void>(
  () => SignUpController(),
  name: r'signUpControllerProvider',
);

class SignUpController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> register({
    required String email,
    required String fullName,
    required String phoneNumber,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(signUpUseCaseProvider).execute(
        request: (email, password, fullName, phoneNumber),
      );
    });
  }
}
