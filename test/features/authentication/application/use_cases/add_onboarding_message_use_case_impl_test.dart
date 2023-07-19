import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/add_onboarding_message_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/onboarding_message.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/onboarding_messages_repository.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/add_onboarding_message_use_case.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late OnboardingMessagesRepository onboardingMessagesRepository;
  late AddOnboardingMessageUseCase addOnboardingMessageUseCase;

  setUp(() {
    onboardingMessagesRepository = MockOnboardingMessagesRepository();

    container = ProviderContainer(
      overrides: [
        addOnboardingMessageUseCaseProvider.overrideWithValue(
          AddOnboardingMessageUseCaseImpl(
            onboardingMessagesRepository: onboardingMessagesRepository,
          ),
        ),
      ],
    );

    addOnboardingMessageUseCase =
        container.read(addOnboardingMessageUseCaseProvider);
  });

  tearDown(() {
    container.dispose();
  });

  group("AddOnboardingMessageUseCase", () {
    test(
      "execute - Adding normal message",
      () {
        when(
          onboardingMessagesRepository.addOnboardingMessage(
            const OnboardingMessage(
              imageSvgPath: 'imagePath4.svg.vec',
              message: 'TITLE4',
              title: 'message4',
            ),
          ),
        ).thenReturn(null);

        expect(
          () => addOnboardingMessageUseCase.execute(
            request: (
              imageSvgPath: 'imagePath4.svg.vec',
              message: 'TITLE4',
              title: 'message4',
            ),
          ),
          returnsNormally,
        );

        verify(
          onboardingMessagesRepository.addOnboardingMessage(
            const OnboardingMessage(
              imageSvgPath: 'imagePath4.svg.vec',
              message: 'TITLE4',
              title: 'message4',
            ),
          ),
        );
      },
    );

    test(
      "execute - Adding message with empty values",
      () {
        expect(
          () => addOnboardingMessageUseCase.execute(
            request: (
              imageSvgPath: '',
              message: 'TITLE4',
              title: 'message4',
            ),
          ),
          throwsFormatException,
        );

        expect(
          () => addOnboardingMessageUseCase.execute(
            request: (
              imageSvgPath: 'imagePath4.svg.vec',
              message: '',
              title: 'message4',
            ),
          ),
          throwsFormatException,
        );

        expect(
          () => addOnboardingMessageUseCase.execute(
            request: (
              imageSvgPath: 'imagePath4.svg.vec',
              message: 'TITLE4',
              title: '',
            ),
          ),
          throwsFormatException,
        );
      },
    );
  });
}
