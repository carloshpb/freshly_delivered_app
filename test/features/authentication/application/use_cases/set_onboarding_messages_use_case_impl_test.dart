import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/set_onboarding_messages_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/onboarding_message.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/onboarding_messages_repository.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/set_onboarding_messages_use_case.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late OnboardingMessagesRepository onboardingMessagesRepository;
  late SetOnboardingMessagesUseCase setOnboardingMessagesUseCase;

  const List<OnboardingMessage> messages = [
    OnboardingMessage(
      imageSvgPath: 'imagePath1.svg.vec',
      message: 'TITLE1',
      title: 'message1',
    ),
    OnboardingMessage(
      imageSvgPath: 'imagePath2.svg.vec',
      message: 'TITLE2',
      title: 'message2',
    ),
    OnboardingMessage(
      imageSvgPath: 'imagePath3.svg.vec',
      message: 'TITLE3',
      title: 'message3',
    ),
  ];

  const List<({String imageSvgPath, String message, String title})>
      messagesRecords = [
    (
      imageSvgPath: 'imagePath1.svg.vec',
      message: 'TITLE1',
      title: 'message1',
    ),
    (
      imageSvgPath: 'imagePath2.svg.vec',
      message: 'TITLE2',
      title: 'message2',
    ),
    (
      imageSvgPath: 'imagePath3.svg.vec',
      message: 'TITLE3',
      title: 'message3',
    ),
  ];

  setUp(() {
    onboardingMessagesRepository = MockOnboardingMessagesRepository();

    container = ProviderContainer(
      overrides: [
        setOnboardingMessagesUseCaseProvider.overrideWithValue(
          SetOnboardingMessagesUseCaseImpl(
            onboardingMessagesRepository: onboardingMessagesRepository,
          ),
        ),
      ],
    );

    setOnboardingMessagesUseCase =
        container.read(setOnboardingMessagesUseCaseProvider);
  });

  tearDown(() {
    container.dispose();
  });

  group("SetOnboardingMessagesUseCaseImpl", () {
    test(
      "execute - Adding normal messages",
      () {
        expect(
          () => setOnboardingMessagesUseCase.execute(
            request: messagesRecords,
          ),
          returnsNormally,
        );

        verify(
          onboardingMessagesRepository.onboardingMessages = messages,
        );
      },
    );

    test(
      "execute - Adding message with empty values",
      () {
        var wrongMessagesRecords1 = [
          (
            imageSvgPath: 'imagePath1.svg.vec',
            message: '',
            title: 'message1',
          ),
          (
            imageSvgPath: 'imagePath2.svg.vec',
            message: 'TITLE2',
            title: 'message3',
          ),
          (
            imageSvgPath: 'imagePath3.svg.vec',
            message: 'TITLE3',
            title: 'message3',
          ),
        ];

        var wrongMessagesRecords2 = [
          (
            imageSvgPath: 'imagePath1.svg.vec',
            message: 'TITLE1',
            title: 'message1',
          ),
          (
            imageSvgPath: 'imagePath2.svg.vec',
            message: '',
            title: 'message2',
          ),
          (
            imageSvgPath: 'imagePath3.svg.vec',
            message: 'TITLE3',
            title: 'message3',
          ),
        ];

        var wrongMessagesRecords3 = [
          (
            imageSvgPath: 'imagePath1.svg.vec',
            message: 'TITLE1',
            title: 'message1',
          ),
          (
            imageSvgPath: 'imagePath2.svg.vec',
            message: 'TITLE2',
            title: 'message2',
          ),
          (
            imageSvgPath: 'imagePath3.svg.vec',
            message: 'TITLE3',
            title: '',
          ),
        ];

        expect(
          () => setOnboardingMessagesUseCase.execute(
            request: wrongMessagesRecords1,
          ),
          throwsFormatException,
        );

        expect(
          () => setOnboardingMessagesUseCase.execute(
            request: wrongMessagesRecords2,
          ),
          throwsFormatException,
        );

        expect(
          () => setOnboardingMessagesUseCase.execute(
            request: wrongMessagesRecords3,
          ),
          throwsFormatException,
        );
      },
    );
  });
}
