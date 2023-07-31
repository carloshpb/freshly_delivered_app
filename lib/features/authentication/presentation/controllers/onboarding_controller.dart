import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/use_cases/get_onboarding_messages_use_case_impl.dart';
import 'states/onboarding_screen_state.dart';

final onboardingControllerProvider =
    NotifierProvider.autoDispose<OnboardingController, OnboardingScreenState>(
  () => OnboardingController(),
  name: r'onboardingControllerProvider',
);

class OnboardingController extends AutoDisposeNotifier<OnboardingScreenState> {
  @override
  OnboardingScreenState build() {
    var initialMessages =
        ref.watch(getOnboardingMessagesUseCaseProvider).execute();

    return OnboardingScreenState(pagePosition: 0, messages: initialMessages);
  }

  void onPageChanged(int next) {
    if (next >= 0 && next < state.messages.length) {
      state = state.copyWith(pagePosition: next);
    }
  }
}
