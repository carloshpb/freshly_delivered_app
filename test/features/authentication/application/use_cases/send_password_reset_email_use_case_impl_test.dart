import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/exceptions/app_auth_exception.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/send_password_reset_email_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/send_password_reset_email_use_case.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late AuthenticationRepository authRepository;
  late SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase;

  setUp(() {
    authRepository = MockAuthenticationRepository();

    container = ProviderContainer(
      overrides: [
        sendPasswordResetEmailUseCaseProvider.overrideWithValue(
          SendPasswordResetEmailUseCaseImpl(
            authRepository: authRepository,
          ),
        ),
      ],
    );

    sendPasswordResetEmailUseCase =
        container.read(sendPasswordResetEmailUseCaseProvider);
  });

  tearDown(() {
    container.dispose();
  });

  group("SendPasswordResetEmailUseCaseImpl", () {
    const mockEmail = 'mockemail@example.com';

    test('''
      \n      When asked to reset the email's password
      Then return void/null if successful
      ''', () async {
      when(authRepository.sendPasswordResetEmail(mockEmail)).thenAnswer(
        (_) async {},
      );

      //expect(result, isA<Future<void>>());

      await expectLater(
          sendPasswordResetEmailUseCase.execute(request: mockEmail), completes);
    });

    test('''
      \n      When asked to reset the email's password
      Then return exception if email is not registered
      ''', () async {
      when(authRepository.sendPasswordResetEmail(mockEmail))
          .thenThrow(const UserNotFoundException());

      await expectLater(
          sendPasswordResetEmailUseCase.execute(request: mockEmail),
          throwsA(predicate((e) =>
              e is UserNotFoundException &&
              e.message == "The user does not match any credentials")));
    });

    test('''
      \n      When asked to reset the email's password
      Then return exception if email is blocked
      ''', () async {
      when(authRepository.sendPasswordResetEmail(mockEmail))
          .thenThrow(const InvalidEmailException());

      await expectLater(
          sendPasswordResetEmailUseCase.execute(request: mockEmail),
          throwsA(predicate((e) =>
              e is InvalidEmailException &&
              e.message == "The email address is not valid")));
    });
  });
}
