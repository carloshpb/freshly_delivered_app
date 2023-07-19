import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/current_user_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/app_user.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/current_user_use_case.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late AuthenticationRepository authRepository;
  late CurrentUserUseCase currentUserUseCase;

  const mockAppUser = AppUser(
    uid: 'mockUid',
    email: 'mockemail@example.com',
  );

  setUp(() {
    authRepository = MockAuthenticationRepository();

    container = ProviderContainer(
      overrides: [
        currentUserUseCaseProvider.overrideWithValue(
          CurrentUserUseCaseImpl(
            authRepository: authRepository,
          ),
        ),
      ],
    );

    currentUserUseCase = container.read(currentUserUseCaseProvider);
  });

  tearDown(() {
    container.dispose();
  });

  group("CurrentUserUseCaseImpl", () {
    test('''
      \n      When asked for the current user
      Then return the current user
      ''', () {
      when(authRepository.currentUser).thenReturn(mockAppUser);

      var appUser = currentUserUseCase.execute(request: null);

      expect(appUser, isNotNull);
      expect(appUser?.uid, equals('mockUid'));
      expect(appUser?.email, equals('mockemail@example.com'));
    });

    test('''
      \n      When asked for the current user
      If no user is connected
      Then return null
      ''', () {
      when(authRepository.currentUser).thenReturn(null);

      var appUser = currentUserUseCase.execute(request: null);

      expect(appUser, isNull);
    });
  });
}
