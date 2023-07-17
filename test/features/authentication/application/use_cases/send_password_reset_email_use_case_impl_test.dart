import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/exceptions/app_auth_exception.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/send_password_reset_email_use_case_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  // a helper method to create a ProviderContainer that overrides the authRepositoryProvider
  ProviderContainer makeProviderContainer(
    MockAuthenticationRepository mockAuthenticationRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        sendPasswordResetEmailUseCaseProvider.overrideWithValue(
          SendPasswordResetEmailUseCaseImpl(
            authRepository: mockAuthenticationRepository,
          ),
        ),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group("SendPasswordResetEmailUseCaseImpl", () {
    const mockEmail = 'mockemail@example.com';

    test('''
      \n      When asked to reset the email's password
      Then return void/null if successful
      ''', () {
      var mockAuthenticationRepository = MockAuthenticationRepository();

      var voidFuture = Future(() => null);

      when(mockAuthenticationRepository.sendPasswordResetEmail(mockEmail))
          .thenReturn(voidFuture);

      final container = makeProviderContainer(mockAuthenticationRepository);

      var sendPasswordResetEmailUseCase =
          container.read(sendPasswordResetEmailUseCaseProvider);

      var result = sendPasswordResetEmailUseCase.execute(request: mockEmail);

      expect(result, isA<Future<void>>());
    });

    test('''
      \n      When asked to reset the email's password
      Then return exception if email is not registered
      ''', () {
      var mockAuthenticationRepository = MockAuthenticationRepository();

      when(mockAuthenticationRepository.sendPasswordResetEmail(mockEmail))
          .thenThrow(const UserNotFoundException());

      final container = makeProviderContainer(mockAuthenticationRepository);

      var sendPasswordResetEmailUseCase =
          container.read(sendPasswordResetEmailUseCaseProvider);

      var result = sendPasswordResetEmailUseCase.execute(request: mockEmail);

      expect(
          result,
          throwsA(predicate((e) =>
              e is UserNotFoundException &&
              e.message == "The user does not match any credentials")));
    });

    test('''
      \n      When asked to reset the email's password
      Then return exception if email is blocked
      ''', () {
      var mockAuthenticationRepository = MockAuthenticationRepository();

      when(mockAuthenticationRepository.sendPasswordResetEmail(mockEmail))
          .thenThrow(const InvalidEmailException());

      final container = makeProviderContainer(mockAuthenticationRepository);

      var sendPasswordResetEmailUseCase =
          container.read(sendPasswordResetEmailUseCaseProvider);

      var result = sendPasswordResetEmailUseCase.execute(request: mockEmail);

      expect(
          result,
          throwsA(predicate((e) =>
              e is InvalidEmailException &&
              e.message == "The email address is not valid")));
    });
  });
}
