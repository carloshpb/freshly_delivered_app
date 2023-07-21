import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dtos/onboarding_message_dto.dart';
import '../../application/use_cases/current_user_use_case_impl.dart';
import '../../application/use_cases/get_onboarding_messages_use_case_impl.dart';
import 'states/onboarding_screen_state.dart';

final onboardingControllerProvider =
    NotifierProvider.autoDispose<OnboardingController, OnboardingScreenState>(
  () => OnboardingController(),
  name: r'onboardingControllerProvider',
);

class OnboardingController extends AutoDisposeNotifier<OnboardingScreenState> {
  // late final List<({String imageSvgPath, String title, String message})>
  //     _onboardingMessages;

  @override
  OnboardingScreenState build() {
    print("BUILDING CONTROLLER ...");
    var initialMessages =
        ref.watch(getOnboardingMessagesUseCaseProvider).execute(request: null);
    var testUser = ref.watch(currentUserUseCaseProvider).execute(request: null);

    print("GOT INITIAL MESSAGES : $initialMessages");
    print("TEST USER : $testUser");

    return OnboardingScreenState(pagePosition: 0, messages: initialMessages);
  }

  // List<({String imageSvgPath, String title, String message})>
  //     get onboardingMessages => _onboardingMessages;

  void onPageChanged(int next) {
    if (next >= 0 && next < state.messages.length) {
      print("OK, CHANGING PAGE TO THE NEXT PAGE: $next");
      state = state.copyWith(pagePosition: next);
      print("--- CURRENT STATE : $state");
    }
  }
}
