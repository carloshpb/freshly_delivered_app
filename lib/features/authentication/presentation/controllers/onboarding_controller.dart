import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/onboarding_message.dart';
import '../../domain/services/impl/onboarding_service_impl.dart';

final onboardingControllerProvider =
    NotifierProvider.autoDispose<OnboardingController, int>(
  () => OnboardingController(),
  name: r'onboardingControllerProvider',
);

class OnboardingController extends AutoDisposeNotifier<int> {
  late final List<OnboardingMessage> _onboardingMessages;

  @override
  int build() {
    print("BUILDING CONTROLLER ...");
    _onboardingMessages =
        ref.read(onboardingServiceRepository).onboardingMessages;

    return 0;
  }

  List<OnboardingMessage> get onboardingMessages => _onboardingMessages;

  void onPageChanged(int indexPage) {
    print("OK, CHANGING PAGE TO THE NEXT PAGE: $indexPage");
    state = indexPage;
    print("--- CURRENT STATE : $state");
  }
}
