import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/exceptions/app_auth_exception.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/sign_in_email_password_use_case_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  // a helper method to create a ProviderContainer that overrides the authRepositoryProvider
  ProviderContainer makeProviderContainer(
    MockAuthenticationRepository mockAuthenticationRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        signInUseCaseProvider.overrideWithValue(
          SignInEmailPasswordUseCaseImpl(
            authRepository: mockAuthenticationRepository,
          ),
        ),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group("SignInEmailPasswordUseCaseImpl", () {
    const mockEmail = 'mockemail@example.com';
    const mockCorrectPassword = '12345678';
    const mockInvalidPassword = '12345';
    test('''
      \n      When asked to sign with a valid email and password
      Then return void/null if successful
      ''', () async {
      var mockAuthenticationRepository = MockAuthenticationRepository();

      when(mockAuthenticationRepository.signInWithEmailAndPassword(
              mockEmail, mockCorrectPassword))
          .thenAnswer((_) async {});

      final container = makeProviderContainer(mockAuthenticationRepository);

      var signInUseCase = container.read(signInUseCaseProvider);

      await expectLater(
        signInUseCase.execute(request: (mockEmail, mockCorrectPassword)),
        isA<Future<void>>(),
      );
    });

    test('''
      \n      When asked to sign with a valid email and wrong password
      Then return exception that password is incorrect
      ''', () async {
      var mockAuthenticationRepository = MockAuthenticationRepository();

      when(mockAuthenticationRepository.signInWithEmailAndPassword(
              mockEmail, mockInvalidPassword))
          .thenThrow(const WrongPasswordException());

      final container = makeProviderContainer(mockAuthenticationRepository);

      var signInUseCase = container.read(signInUseCaseProvider);

      await expectLater(
        signInUseCase.execute(request: (mockEmail, mockInvalidPassword)),
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
      var mockAuthenticationRepository = MockAuthenticationRepository();

      when(mockAuthenticationRepository.signInWithEmailAndPassword(
              mockEmail, mockCorrectPassword))
          .thenThrow(const UserNotFoundException());

      final container = makeProviderContainer(mockAuthenticationRepository);

      var signInUseCase = container.read(signInUseCaseProvider);

      await expectLater(
        signInUseCase.execute(request: (mockEmail, mockCorrectPassword)),
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
      var mockAuthenticationRepository = MockAuthenticationRepository();

      when(mockAuthenticationRepository.signInWithEmailAndPassword(
              mockEmail, mockCorrectPassword))
          .thenThrow(const InvalidEmailException());

      final container = makeProviderContainer(mockAuthenticationRepository);

      var signInUseCase = container.read(signInUseCaseProvider);

      await expectLater(
        signInUseCase.execute(request: (mockEmail, mockCorrectPassword)),
        throwsA(
          predicate((e) =>
              e is InvalidEmailException &&
              e.message == "The email address is not valid"),
        ),
      );
    });
  });
}
