import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/firebase_authentication_repository.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../domain/use_cases/sign_in_email_password_use_case.dart';

final signInUseCaseProvider = Provider.autoDispose<SignInEmailPasswordUseCase>(
  (ref) {
    return SignInEmailPasswordUseCaseImpl(
      authRepository: ref.watch(authenticationRepositoryProvider),
    );
  },
  name: r"signInUseCaseProvider",
);

class SignInEmailPasswordUseCaseImpl implements SignInEmailPasswordUseCase {
  final AuthenticationRepository _authRepository;

  SignInEmailPasswordUseCaseImpl(
      {required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<void> execute((String email, String password) request) async {
    return _authRepository.signInWithEmailAndPassword(request.$1, request.$2);
  }
}
