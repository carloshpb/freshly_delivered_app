import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/firebase_authentication_repository.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../domain/use_cases/send_password_reset_email_use_case.dart';

final resetPasswordUseCaseProvider =
    Provider.autoDispose<SendPasswordResetEmailUseCase>(
  (ref) {
    return SendPasswordResetEmailUseCaseImpl(
      authRepository: ref.watch(authenticationRepositoryProvider),
    );
  },
  name: r"resetPasswordUseCaseProvider",
);

class SendPasswordResetEmailUseCaseImpl
    implements SendPasswordResetEmailUseCase {
  final AuthenticationRepository _authRepository;

  SendPasswordResetEmailUseCaseImpl(
      {required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<void> execute({required String request}) async {
    return _authRepository.sendPasswordResetEmail(request);
  }
}
