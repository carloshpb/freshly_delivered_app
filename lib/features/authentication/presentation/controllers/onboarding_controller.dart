import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dtos/onboarding_message_dto.dart';
import '../../application/use_cases/get_onboarding_messages_use_case_impl.dart';

final onboardingControllerProvider =
    NotifierProvider.autoDispose<OnboardingController, int>(
  () => OnboardingController(),
  name: r'onboardingControllerProvider',
);

class OnboardingController extends AutoDisposeNotifier<int> {
  late final List<OnboardingMessageDTO> _onboardingMessages;

  @override
  int build() {
    print("BUILDING CONTROLLER ...");
    _onboardingMessages =
        ref.watch(getOnboardingMessagesUseCaseProvider).execute();

    print("GOT INITIAL MESSAGES : $_onboardingMessages");

    //return OnboardingScreenState(pagePosition: 0, messages: initialMessages);
    return 0;
  }

  List<OnboardingMessageDTO> getMessages() => _onboardingMessages;

  void onPageChanged(int next) {
    if (next >= 0 && next < _onboardingMessages.length) {
      print("OK, CHANGING PAGE TO THE NEXT PAGE: $next");
      state = next;
      print("--- CURRENT STATE : $state");
    }
  }
}
