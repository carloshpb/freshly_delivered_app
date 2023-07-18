import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/onboarding_messages_repository_impl.dart';
import '../../domain/models/onboarding_message.dart';
import '../../domain/repositories/onboarding_messages_repository.dart';
import '../../domain/use_cases/get_onboarding_messages_use_case.dart';
import '../../domain/use_cases/set_onboarding_messages_use_case.dart';
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

  static const _defaultOnboardingMessages = [
    OnboardingMessage(
      imageSvgPath: 'assets/images/onboarding1.svg.vec',
      message: 'SHOP CONVENIENTLY',
      title:
          'Shop from an unlimited stock of groceries from the convenience of your homes',
    ),
    OnboardingMessage(
      imageSvgPath: 'assets/images/onboarding2.svg.vec',
      message: 'EXPERTLY CURATED RECIPES',
      title:
          'Our recipes are prepared in the finest of conditions by experts in their fields',
    ),
    OnboardingMessage(
      imageSvgPath: 'assets/images/onboarding3.svg.vec',
      message: 'BRING OUT THE CHEF IN YOU',
      title:
          'Our recipes are specially picked so you can get cooking in no time',
    ),
  ];

  GetOnboardingMessagesUseCaseImpl(
      {required OnboardingMessagesRepository onboardingMessagesRepository,
      required SetOnboardingMessagesUseCase setOnboardingMessagesUseCase})
      : _onboardingMessagesRepository = onboardingMessagesRepository,
        _setOnboardingMessagesUseCase = setOnboardingMessagesUseCase;

  @override
  List<({String imageSvgPath, String title, String message})> execute(
      {required void request}) {
    late List<OnboardingMessage> resultMessagesFromRepo;

    try {
      var resultMessagesFromRepo =
          _onboardingMessagesRepository.onboardingMessages;

      if (resultMessagesFromRepo.isEmpty) {
        resultMessagesFromRepo = _defaultOnboardingMessages;
      }
    } on TypeError {
      _setOnboardingMessagesUseCase.execute(
        request: _defaultOnboardingMessages
            .map(
              (onbMsg) => (
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
          (onbMsg) => (
            imageSvgPath: onbMsg.imageSvgPath,
            message: onbMsg.message,
            title: onbMsg.title,
          ),
        )
        .toList();
  }
}
