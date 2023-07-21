import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/onboarding_messages_repository_impl.dart';
import '../../domain/models/onboarding_message.dart';
import '../../domain/repositories/onboarding_messages_repository.dart';
import '../../domain/use_cases/add_onboarding_message_use_case.dart';
import '../dtos/onboarding_message_dto.dart';

final addOnboardingMessageUseCaseProvider =
    Provider.autoDispose<AddOnboardingMessageUseCase>(
  (ref) {
    return AddOnboardingMessageUseCaseImpl(
      onboardingMessagesRepository:
          ref.watch(onboardingMessagesRepositoryProvider),
    );
  },
  name: r"addOnboardingMessageUseCaseProvider",
);

class AddOnboardingMessageUseCaseImpl implements AddOnboardingMessageUseCase {
  final OnboardingMessagesRepository _onboardingMessagesRepository;

  AddOnboardingMessageUseCaseImpl(
      {required OnboardingMessagesRepository onboardingMessagesRepository})
      : _onboardingMessagesRepository = onboardingMessagesRepository;

  @override
  void execute(OnboardingMessageDTO request) {
    if (request.imageSvgPath.isEmpty ||
        request.message.isEmpty ||
        request.title.isEmpty) {
      throw const FormatException(
          "No attribute of OnboardingMessage can be empty");
    }

    var newMessage = OnboardingMessage(
      imageSvgPath: request.imageSvgPath,
      title: request.title,
      message: request.message,
    );

    _onboardingMessagesRepository.addOnboardingMessage(newMessage);
  }
}
