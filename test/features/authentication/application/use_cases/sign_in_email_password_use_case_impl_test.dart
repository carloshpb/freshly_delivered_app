import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/exceptions/app_auth_exception.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/sign_in_email_password_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/sign_in_email_password_use_case.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late AuthenticationRepository authRepository;
  late SignInEmailPasswordUseCase signInUseCase;

  setUp(() {
    authRepository = MockAuthenticationRepository();

    container = ProviderContainer(
      overrides: [
        signInUseCaseProvider.overrideWithValue(
          SignInEmailPasswordUseCaseImpl(
            authRepository: authRepository,
          ),
        ),
      ],
    );

    signInUseCase = container.read(signInUseCaseProvider);
  });

  tearDown(() {
    container.dispose();
  });

  group("SignInEmailPasswordUseCaseImpl", () {
    const mockEmail = 'mockemail@example.com';
    const mockCorrectPassword = '12345678';
    const mockInvalidPassword = '12345';
    test('''
      \n      When asked to sign with a valid email and password
      Then return void/null if successful
      ''', () async {
      when(authRepository.signInWithEmailAndPassword(
              mockEmail, mockCorrectPassword))
          .thenAnswer((_) async {});

      await expectLater(
        signInUseCase.execute((mockEmail, mockCorrectPassword)),
        isA<Future<void>>(),
      );
    });

    test('''
      \n      When asked to sign with a valid email and wrong password
      Then return exception that password is incorrect
      ''', () async {
      when(authRepository.signInWithEmailAndPassword(
              mockEmail, mockInvalidPassword))
          .thenThrow(const WrongPasswordException());

      await expectLater(
        signInUseCase.execute((mockEmail, mockInvalidPassword)),
        throwsA(
          predicate((e) =>
              e is WrongPasswordException && e.message == "Wrong password"),
        ),
      );
    });

    test('''
      \n      When asked to sign with a non registered email and password
      Then return exception that email is not registered
      ''', () async {
      when(authRepository.signInWithEmailAndPassword(
              mockEmail, mockCorrectPassword))
          .thenThrow(const UserNotFoundException());

      await expectLater(
        signInUseCase.execute((mockEmail, mockCorrectPassword)),
        throwsA(
          predicate((e) =>
              e is UserNotFoundException &&
              e.message == "The user does not match any credentials"),
        ),
      );
    });

    test('''
      \n      When asked to sign with a blocked email and password
      Then return exception that email is blocked
      ''', () async {
      when(authRepository.signInWithEmailAndPassword(
              mockEmail, mockCorrectPassword))
          .thenThrow(const InvalidEmailException());

      await expectLater(
        signInUseCase.execute((mockEmail, mockCorrectPassword)),
        throwsA(
          predicate((e) =>
              e is InvalidEmailException &&
              e.message == "The email address is not valid"),
        ),
      );
    });
  });
}
