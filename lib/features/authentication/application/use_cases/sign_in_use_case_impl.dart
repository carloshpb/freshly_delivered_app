import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../exceptions/app_auth_exception.dart';
import '../../data/repositories/firebase_authentication_repository.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../domain/use_cases/sign_in_use_case.dart';

final signInUseCaseProvider = Provider.autoDispose<SignInUseCaseImpl>(
  (ref) {
    return SignInUseCaseImpl(
      authRepository: ref.watch(firebaseAuthenticationRepositoryProvider),
    );
  },
  name: r"signInUseCaseProvider",
);

class SignInUseCaseImpl implements SignInUseCase {
  final AuthenticationRepository _authRepository;

  SignInUseCaseImpl({required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Result<void, AppAuthException>> execute(
      {required (String email, String password) request}) async {
    return _authRepository.signInWithEmailAndPassword(request.$1, request.$2);
  }
}
