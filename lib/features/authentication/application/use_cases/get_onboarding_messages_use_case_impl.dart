import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/onboarding_messages_repository_impl.dart';
import '../../domain/models/onboarding_message.dart';
import '../../domain/repositories/onboarding_messages_repository.dart';
import '../../domain/use_cases/get_onboarding_messages_use_case.dart';
import '../../domain/use_cases/set_onboarding_messages_use_case.dart';
import '../dtos/onboarding_message_dto.dart';
import 'set_onboarding_messages_use_case_impl.dart';

final getOnboardingMessagesUseCaseProvider =
    Provider.autoDispose<GetOnboardingMessagesUseCase>(
  (ref) {
    return GetOnboardingMessagesUseCaseImpl(
      onboardingMessagesRepository:
          ref.watch(onboardingMessagesRepositoryProvider),
      setOnboardingMessagesUseCase:
          ref.watch(setOnboardingMessagesUseCaseProvider),
    );
  },
  name: r"getOnboardingMessagesUseCaseProvider",
);

class GetOnboardingMessagesUseCaseImpl implements GetOnboardingMessagesUseCase {
  final OnboardingMessagesRepository _onboardingMessagesRepository;
  final SetOnboardingMessagesUseCase _setOnboardingMessagesUseCase;

  final _defaultOnboardingMessages = const [
    OnboardingMessage(
      imageSvgPath: 'assets/images/onboarding1.svg.vec',
      title: 'SHOP CONVENIENTLY',
      message:
          'Shop from an unlimited stock of groceries from the convenience of your homes',
    ),
    OnboardingMessage(
      imageSvgPath: 'assets/images/onboarding2.svg.vec',
      title: 'EXPERTLY CURATED RECIPES',
      message:
          'Our recipes are prepared in the finest of conditions by experts in their fields',
    ),
    OnboardingMessage(
      imageSvgPath: 'assets/images/onboarding3.svg.vec',
      title: 'BRING OUT THE CHEF IN YOU',
      message:
          'Our recipes are specially picked so you can get cooking in no time',
    ),
  ];

  GetOnboardingMessagesUseCaseImpl(
      {required OnboardingMessagesRepository onboardingMessagesRepository,
      required SetOnboardingMessagesUseCase setOnboardingMessagesUseCase})
      : _onboardingMessagesRepository = onboardingMessagesRepository,
        _setOnboardingMessagesUseCase = setOnboardingMessagesUseCase;

  @override
  List<OnboardingMessageDto> execute([void request]) {
    late List<OnboardingMessage> resultMessagesFromRepo;

    try {
      resultMessagesFromRepo = _onboardingMessagesRepository.onboardingMessages;

      if (resultMessagesFromRepo.isEmpty) {
        resultMessagesFromRepo = _defaultOnboardingMessages;
      }
    } on TypeError {
      _setOnboardingMessagesUseCase.execute(
        _defaultOnboardingMessages
            .map(
              (onbMsg) => OnboardingMessageDto(
                imageSvgPath: onbMsg.imageSvgPath,
                message: onbMsg.message,
                title: onbMsg.title,
              ),
            )
            .toList(),
      );
      resultMessagesFromRepo = _defaultOnboardingMessages;
    }

    return resultMessagesFromRepo
        .map(
          (onbMsg) => OnboardingMessageDto(
            imageSvgPath: onbMsg.imageSvgPath,
            message: onbMsg.message,
            title: onbMsg.title,
          ),
        )
        .toList();
  }
}
