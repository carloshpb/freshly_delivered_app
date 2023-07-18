import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/onboarding_messages_repository_impl.dart';
import '../../domain/repositories/onboarding_messages_repository.dart';
import '../../domain/use_cases/get_onboarding_messages_use_case.dart';

final getOnboardingMessagesUseCaseProvider =
    Provider.autoDispose<GetOnboardingMessagesUseCase>(
  (ref) {
    return GetOnboardingMessagesUseCaseImpl(
      onboardingMessagesRepository:
          ref.watch(onboardingMessagesRepositoryProvider),
    );
  },
  name: r"getOnboardingMessagesUseCaseProvider",
);

class GetOnboardingMessagesUseCaseImpl implements GetOnboardingMessagesUseCase {
  final OnboardingMessagesRepository _onboardingMessagesRepository;

  GetOnboardingMessagesUseCaseImpl(
      {required OnboardingMessagesRepository onboardingMessagesRepository})
      : _onboardingMessagesRepository = onboardingMessagesRepository;

  @override
  List<({String imageSvgPath, String title, String message})> execute(
      {required void request}) {
    return _onboardingMessagesRepository.onboardingMessages
        .map((msg) => (
              imageSvgPath: msg.imageSvgPath,
              title: msg.title,
              message: msg.message
            ))
        .toList();
  }
}
