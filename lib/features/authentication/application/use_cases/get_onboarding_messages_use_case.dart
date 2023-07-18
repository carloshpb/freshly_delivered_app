import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_cases/get_onboarding_messages_use_case.dart';

final getOnboardingMessagesUseCaseProvider =
    Provider.autoDispose<CurrentUserUseCase>(
  (ref) {
    return GetOnboardingMessagesUseCaseImpl(
      authRepository: ref.watch(authenticationRepositoryProvider),
    );
  },
  name: r"getOnboardingMessagesUseCaseProvider",
);

class GetOnboardingMessagesUseCaseImpl implements GetOnboardingMessagesUseCase {
  GetOnboardingMessagesUseCaseImpl(
      {required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  @override
  List<(String imageSvgPath, String title, String message)> execute(
      {required void request}) {
    return _authRepository.currentUser;
  }
}
