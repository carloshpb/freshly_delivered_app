import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/throttler.dart';
import '../../application/use_cases/get_onboarding_messages_use_case_impl.dart';

final onboardingControllerProvider =
    NotifierProvider.autoDispose<OnboardingController, int>(
  () => OnboardingController(),
  name: r'onboardingControllerProvider',
);

class OnboardingController extends AutoDisposeNotifier<int> with Throttler {
  late final List<({String imageSvgPath, String title, String message})>
      _onboardingMessages;

  @override
  int build() {
    print("BUILDING CONTROLLER ...");
    _onboardingMessages =
        ref.read(getOnboardingMessagesUseCaseProvider).execute(request: null);

    return 0;
  }

  List<({String imageSvgPath, String title, String message})>
      get onboardingMessages => _onboardingMessages;

  void onPageChanged(int next) {
    if (next >= 0 && next < _onboardingMessages.length) {
      print("OK, CHANGING PAGE TO THE NEXT PAGE: $next");
      state = next;
      print("--- CURRENT STATE : $state");
    }
  }
}
