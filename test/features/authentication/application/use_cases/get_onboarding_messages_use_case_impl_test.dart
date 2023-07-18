import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/get_onboarding_messages_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/onboarding_message.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/onboarding_messages_repository.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/get_onboarding_messages_use_case.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late OnboardingMessagesRepository onboardingMessagesRepository;
  late GetOnboardingMessagesUseCase getOnboardingMessagesUseCase;

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

  setUp(() {
    onboardingMessagesRepository = MockOnboardingMessagesRepository();

    container = ProviderContainer(
      overrides: [
        getOnboardingMessagesUseCaseProvider.overrideWithValue(
          GetOnboardingMessagesUseCaseImpl(
            onboardingMessagesRepository: onboardingMessagesRepository,
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

      var result = getOnboardingMessagesUseCase.execute(request: null);

      expect(
          result[0],
          equals(const OnboardingMessage(
            imageSvgPath: 'imagePath1.svg.vec',
            message: 'TITLE1',
            title: 'message1',
          )));
      expect(
          result[1],
          equals(const OnboardingMessage(
            imageSvgPath: 'imagePath2.svg.vec',
            message: 'TITLE2',
            title: 'message2',
          )));
      expect(
          result[2],
          equals(const OnboardingMessage(
            imageSvgPath: 'imagePath3.svg.vec',
            message: 'TITLE3',
            title: 'message3',
          )));
    });
  });
}
