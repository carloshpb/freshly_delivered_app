import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/onboarding_message.dart';
import '../../domain/services/impl/onboarding_service_impl.dart';

final onboardingControllerProvider =
    NotifierProvider.autoDispose<OnboardingController, void>(
  () => OnboardingController(),
  name: r'onboardingControllerProvider',
);

class OnboardingController extends AutoDisposeNotifier<void> {
  late final List<OnboardingMessage> _onboardingMessages;

  @override
  void build() {
    _onboardingMessages =
        ref.read(onboardingServiceRepository).onboardingMessages;
  }

  List<OnboardingMessage> get onboardingMessages => _onboardingMessages;
}
