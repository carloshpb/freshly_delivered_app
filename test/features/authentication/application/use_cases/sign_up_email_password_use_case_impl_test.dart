import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/exceptions/app_auth_exception.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/sign_up_email_password_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/sign_up_email_password_use_case.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late AuthenticationRepository authRepository;
  late SignUpEmailPasswordUseCase signUpUseCase;

  setUp(() {
    authRepository = MockAuthenticationRepository();

    container = ProviderContainer(
      overrides: [
        signUpUseCaseProvider.overrideWithValue(
          SignUpEmailPasswordUseCaseImpl(
            authRepository: authRepository,
          ),
        ),
      ],
    );

    signUpUseCase = container.read(signUpUseCaseProvider);
  });

  tearDown(() {
    container.dispose();
  });

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
      when(authRepository.createUserWithEmailAndPassword(
              mockEmail, mockCorrectPassword, mockName, mockCorrectPhone))
          .thenAnswer((_) async {});

      await expectLater(
        signUpUseCase.execute(
            (mockEmail, mockCorrectPassword, mockName, mockCorrectPhone)),
        isA<Future<void>>(),
      );
    });

    test('''
      \n      When asked to sign up with an invalid email
      Then return exception that email is invalid
      ''', () async {
      when(authRepository.createUserWithEmailAndPassword(mockInvalidEmail,
              mockCorrectPassword, mockName, mockCorrectPhone))
          .thenThrow(const InvalidEmailException());

      await expectLater(
        signUpUseCase.execute((
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
      when(authRepository.createUserWithEmailAndPassword(
              mockEmail, mockCorrectPassword, mockName, mockInvalidPhone))
          .thenThrow(const InvalidPhoneNumberException());

      await expectLater(
        signUpUseCase.execute(
            (mockEmail, mockCorrectPassword, mockName, mockInvalidPhone)),
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
      when(authRepository.createUserWithEmailAndPassword(
              mockEmail, mockWeakPassword, mockName, mockCorrectPhone))
          .thenThrow(const WeakPasswordException());

      await expectLater(
        signUpUseCase
            .execute((mockEmail, mockWeakPassword, mockName, mockCorrectPhone)),
        throwsA(
          predicate((e) =>
              e is WeakPasswordException &&
              e.message == "The password must be 8 characters long or more"),
        ),
      );
    });
  });
}
