import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/firebase_authentication_repository.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../domain/use_cases/sign_up_email_password_use_case.dart';

final signUpUseCaseProvider = Provider.autoDispose<SignUpEmailPasswordUseCase>(
  (ref) {
    return SignUpEmailPasswordUseCaseImpl(
      authRepository: ref.watch(authenticationRepositoryProvider),
    );
  },
  name: r"signUpUseCaseProvider",
);

class SignUpEmailPasswordUseCaseImpl implements SignUpEmailPasswordUseCase {
  final AuthenticationRepository _authRepository;

  SignUpEmailPasswordUseCaseImpl(
      {required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<void> execute(
      {required (
        String email,
        String password,
        String fullName,
        String phoneNumber
      ) request}) async {
    return _authRepository.createUserWithEmailAndPassword(
        request.$1, request.$2, request.$3, request.$4);
  }
}
