import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/onboarding_messages_repository_impl.dart';
import '../../domain/models/onboarding_message.dart';
import '../../domain/repositories/onboarding_messages_repository.dart';
import '../../domain/use_cases/set_onboarding_messages_use_case.dart';

final setOnboardingMessagesUseCaseProvider =
    Provider.autoDispose<SetOnboardingMessagesUseCase>(
  (ref) {
    return SetOnboardingMessagesUseCaseImpl(
      onboardingMessagesRepository:
          ref.watch(onboardingMessagesRepositoryProvider),
    );
  },
  name: r"setOnboardingMessagesUseCaseProvider",
);

class SetOnboardingMessagesUseCaseImpl implements SetOnboardingMessagesUseCase {
  final OnboardingMessagesRepository _onboardingMessagesRepository;

  SetOnboardingMessagesUseCaseImpl(
      {required OnboardingMessagesRepository onboardingMessagesRepository})
      : _onboardingMessagesRepository = onboardingMessagesRepository;

  @override
  void execute(
      {required List<({String imageSvgPath, String message, String title})>
          request}) {
    var count = 0;
    List<OnboardingMessage> newList = [];
    while (count < request.length) {
      if (request[count].imageSvgPath.isEmpty ||
          request[count].message.isEmpty ||
          request[count].title.isEmpty) {
        throw const FormatException(
            "No attribute of OnboardingMessage can be empty");
      }
      newList.add(
        OnboardingMessage(
          imageSvgPath: request[count].imageSvgPath,
          title: request[count].title,
          message: request[count].message,
        ),
      );
      count++;
    }
    _onboardingMessagesRepository.onboardingMessages = newList;
  }
}
