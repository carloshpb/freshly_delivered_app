import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/features/authentication/application/dtos/onboarding_message_dto.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/get_onboarding_messages_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/onboarding_message.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/onboarding_messages_repository.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/get_onboarding_messages_use_case.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/set_onboarding_messages_use_case.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late OnboardingMessagesRepository onboardingMessagesRepository;
  late GetOnboardingMessagesUseCase getOnboardingMessagesUseCase;
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

  const List<OnboardingMessageDto> messagesDto = [
    OnboardingMessageDto(
      imageSvgPath: 'imagePath1.svg.vec',
      message: 'TITLE1',
      title: 'message1',
    ),
    OnboardingMessageDto(
      imageSvgPath: 'imagePath2.svg.vec',
      message: 'TITLE2',
      title: 'message2',
    ),
    OnboardingMessageDto(
      imageSvgPath: 'imagePath3.svg.vec',
      message: 'TITLE3',
      title: 'message3',
    ),
  ];

  const defaultMessages = [
    OnboardingMessageDto(
      imageSvgPath: 'assets/images/onboarding1.svg.vec',
      title: 'SHOP CONVENIENTLY',
      message:
          'Shop from an unlimited stock of groceries from the convenience of your homes',
    ),
    OnboardingMessageDto(
      imageSvgPath: 'assets/images/onboarding2.svg.vec',
      title: 'EXPERTLY CURATED RECIPES',
      message:
          'Our recipes are prepared in the finest of conditions by experts in their fields',
    ),
    OnboardingMessageDto(
      imageSvgPath: 'assets/images/onboarding3.svg.vec',
      title: 'BRING OUT THE CHEF IN YOU',
      message:
          'Our recipes are specially picked so you can get cooking in no time',
    ),
  ];

  setUp(() {
    onboardingMessagesRepository = MockOnboardingMessagesRepository();
    setOnboardingMessagesUseCase = MockSetOnboardingMessagesUseCase();

    container = ProviderContainer(
      overrides: [
        getOnboardingMessagesUseCaseProvider.overrideWithValue(
          GetOnboardingMessagesUseCaseImpl(
            onboardingMessagesRepository: onboardingMessagesRepository,
            setOnboardingMessagesUseCase: setOnboardingMessagesUseCase,
          ),
        ),
      ],
    );

    getOnboardingMessagesUseCase =
        container.read(getOnboardingMessagesUseCaseProvider);
  });

  tearDown(() {
    container.dispose();
  });

  group("GetOnboardingMessagesUseCaseImpl", () {
    test('''
      \n      When asked for onboard messages list
      Then return the list
      ''', () {
      when(onboardingMessagesRepository.onboardingMessages)
          .thenReturn(messages);

      var result = getOnboardingMessagesUseCase.execute();

      expect(result, equals(messagesDto));

      expect(
        result[0],
        equals(
          const OnboardingMessageDto(
            imageSvgPath: 'imagePath1.svg.vec',
            message: 'TITLE1',
            title: 'message1',
          ),
        ),
      );
      expect(
        result[1],
        equals(
          const OnboardingMessageDto(
            imageSvgPath: 'imagePath2.svg.vec',
            message: 'TITLE2',
            title: 'message2',
          ),
        ),
      );
      expect(
        result[2],
        equals(
          const OnboardingMessageDto(
            imageSvgPath: 'imagePath3.svg.vec',
            message: 'TITLE3',
            title: 'message3',
          ),
        ),
      );
    });

    test('onboardingMessages - handles empty list', () {
      when(onboardingMessagesRepository.onboardingMessages).thenReturn([]);

      var result = getOnboardingMessagesUseCase.execute();

      expect(result.length, 3);

      // Verify the properties of each default message
      expect(
        result[0],
        equals(
          const OnboardingMessageDto(
            imageSvgPath: 'assets/images/onboarding1.svg.vec',
            title: 'SHOP CONVENIENTLY',
            message:
                'Shop from an unlimited stock of groceries from the convenience of your homes',
          ),
        ),
      );
      expect(
        result[1],
        equals(
          const OnboardingMessageDto(
            imageSvgPath: 'assets/images/onboarding2.svg.vec',
            title: 'EXPERTLY CURATED RECIPES',
            message:
                'Our recipes are prepared in the finest of conditions by experts in their fields',
          ),
        ),
      );
      expect(
        result[2],
        equals(
          const OnboardingMessageDto(
            imageSvgPath: 'assets/images/onboarding3.svg.vec',
            title: 'BRING OUT THE CHEF IN YOU',
            message:
                'Our recipes are specially picked so you can get cooking in no time',
          ),
        ),
      );
    });

    test('onboardingMessages - handles corrupted shared preferences data', () {
      when(onboardingMessagesRepository.onboardingMessages)
          .thenThrow(TypeError());

      when(setOnboardingMessagesUseCase.execute(defaultMessages))
          .thenReturn(argThat(isNull));

      var result = getOnboardingMessagesUseCase.execute();

      verify(
        setOnboardingMessagesUseCase.execute(defaultMessages),
      );

      expect(result.length, equals(3));

      // Verify the properties of each default message
      expect(
        result[0],
        equals(
          const OnboardingMessageDto(
            imageSvgPath: 'assets/images/onboarding1.svg.vec',
            title: 'SHOP CONVENIENTLY',
            message:
                'Shop from an unlimited stock of groceries from the convenience of your homes',
          ),
        ),
      );
      expect(
        result[1],
        equals(
          const OnboardingMessageDto(
            imageSvgPath: 'assets/images/onboarding2.svg.vec',
            title: 'EXPERTLY CURATED RECIPES',
            message:
                'Our recipes are prepared in the finest of conditions by experts in their fields',
          ),
        ),
      );
      expect(
        result[2],
        equals(
          const OnboardingMessageDto(
            imageSvgPath: 'assets/images/onboarding3.svg.vec',
            title: 'BRING OUT THE CHEF IN YOU',
            message:
                'Our recipes are specially picked so you can get cooking in no time',
          ),
        ),
      );
    });
  });
}
