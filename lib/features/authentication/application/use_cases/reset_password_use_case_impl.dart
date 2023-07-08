import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/firebase_authentication_repository.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../domain/use_cases/reset_password_use_case.dart';

final resetPasswordUseCaseProvider = Provider.autoDispose<ResetPasswordUseCase>(
  (ref) {
    return ResetPasswordUseCaseImpl(
      authRepository: ref.watch(authenticationRepositoryProvider),
    );
  },
  name: r"resetPasswordUseCaseProvider",
);

class ResetPasswordUseCaseImpl implements ResetPasswordUseCase {
  final AuthenticationRepository _authRepository;

  ResetPasswordUseCaseImpl({required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<void> execute({required String request}) async {
    return _authRepository.resetPassword(request);
  }
}
