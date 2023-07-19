import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/exceptions/app_auth_exception.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/sign_up_email_password_use_case_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  // a helper method to create a ProviderContainer that overrides the authRepositoryProvider
  ProviderContainer makeProviderContainer(
    MockAuthenticationRepository mockAuthenticationRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        signUpUseCaseProvider.overrideWithValue(
          SignUpEmailPasswordUseCaseImpl(
            authRepository: mockAuthenticationRepository,
          ),
        ),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group("SignUpEmailPasswordUseCaseImpl", () {
    const mockEmail = 'mockemail@example.com';
    const mockInvalidEmail = 'mockinvalid123';
    const mockCorrectPassword = '12345678';
    const mockWeakPassword = '12345';
    const mockName = "Test Test";
    const mockCorrectPhone = "+5534999999999";
    const mockInvalidPhone = "abc123456";

    test('''
      \n      When asked to sign up with a valid email, password, name and phone
      Then return void/null if successful
      ''', () async {
      var mockAuthenticationRepository = MockAuthenticationRepository();

      when(mockAuthenticationRepository.createUserWithEmailAndPassword(
              mockEmail, mockCorrectPassword, mockName, mockCorrectPhone))
          .thenAnswer((_) async {});

      final container = makeProviderContainer(mockAuthenticationRepository);

      var signUpUseCase = container.read(signUpUseCaseProvider);

      await expectLater(
        signUpUseCase.execute(request: (
          mockEmail,
          mockCorrectPassword,
          mockName,
          mockCorrectPhone
        )),
        isA<Future<void>>(),
      );
    });

    test('''
      \n      When asked to sign up with an invalid email
      Then return exception that email is invalid
      ''', () async {
      var mockAuthenticationRepository = MockAuthenticationRepository();

      when(mockAuthenticationRepository.createUserWithEmailAndPassword(
              mockInvalidEmail,
              mockCorrectPassword,
              mockName,
              mockCorrectPhone))
          .thenThrow(const InvalidEmailException());

      final container = makeProviderContainer(mockAuthenticationRepository);

      var signUpUseCase = container.read(signUpUseCaseProvider);

      await expectLater(
        signUpUseCase.execute(request: (
          mockInvalidEmail,
          mockCorrectPassword,
          mockName,
          mockCorrectPhone
        )),
        throwsA(
          predicate((e) =>
              e is InvalidEmailException &&
              e.message == "The email address is not valid"),
        ),
      );
    });

    test('''
      \n      When asked to sign up with an invalid phone
      Then return exception that phone is invalid
      ''', () async {
      var mockAuthenticationRepository = MockAuthenticationRepository();

      when(mockAuthenticationRepository.createUserWithEmailAndPassword(
              mockEmail, mockCorrectPassword, mockName, mockInvalidPhone))
          .thenThrow(const InvalidPhoneNumberException());

      final container = makeProviderContainer(mockAuthenticationRepository);

      var signUpUseCase = container.read(signUpUseCaseProvider);

      await expectLater(
        signUpUseCase.execute(request: (
          mockEmail,
          mockCorrectPassword,
          mockName,
          mockInvalidPhone
        )),
        throwsA(
          predicate((e) =>
              e is InvalidPhoneNumberException &&
              e.message == "The phone number is not valid"),
        ),
      );
    });

    test('''
      \n      When asked to sign up with a weak password
      Then return exception that password is invalid
      ''', () async {
      var mockAuthenticationRepository = MockAuthenticationRepository();

      when(mockAuthenticationRepository.createUserWithEmailAndPassword(
              mockEmail, mockWeakPassword, mockName, mockCorrectPhone))
          .thenThrow(const WeakPasswordException());

      final container = makeProviderContainer(mockAuthenticationRepository);

      var signUpUseCase = container.read(signUpUseCaseProvider);

      await expectLater(
        signUpUseCase.execute(
            request: (mockEmail, mockWeakPassword, mockName, mockCorrectPhone)),
        throwsA(
          predicate((e) =>
              e is WeakPasswordException &&
              e.message == "The password must be 8 characters long or more"),
        ),
      );
    });
  });
}
