import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/current_user_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/app_user.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  // a helper method to create a ProviderContainer that overrides the authRepositoryProvider
  ProviderContainer makeProviderContainer(
    MockAuthenticationRepository mockAuthenticationRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        currentUserUseCaseProvider.overrideWithValue(
          CurrentUserUseCaseImpl(
            authRepository: mockAuthenticationRepository,
          ),
        ),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group("CurrentUserUseCaseImpl", () {
    const mockAppUser = AppUser(
      uid: 'mockUid',
      email: 'mockemail@example.com',
    );

    test('''
      \n      When asked for the current user
      Then return the current user
      ''', () {
      var mockAuthenticationRepository = MockAuthenticationRepository();

      when(mockAuthenticationRepository.currentUser).thenReturn(mockAppUser);

      final container = makeProviderContainer(mockAuthenticationRepository);

      var currentUserUseCase = container.read(currentUserUseCaseProvider);

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
      var mockAuthenticationRepository = MockAuthenticationRepository();

      when(mockAuthenticationRepository.currentUser).thenReturn(null);

      final container = makeProviderContainer(mockAuthenticationRepository);

      var currentUserUseCase = container.read(currentUserUseCaseProvider);

      var appUser = currentUserUseCase.execute(request: null);

      expect(appUser, isNull);
    });
  });
}
