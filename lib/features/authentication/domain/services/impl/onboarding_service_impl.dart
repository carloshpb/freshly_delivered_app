import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/onboarding_message.dart';
import '../onboarding_service.dart';

final onboardingServiceRepository = Provider.autoDispose<OnboardingServiceImpl>(
  (ref) => OnboardingServiceImpl(),
);

class OnboardingServiceImpl implements OnboardingService {
  final List<OnboardingMessage> _onboardingMessages = [
    const OnboardingMessage(
      imageSvgPath: 'assets/images/onboarding1.svg.vec',
      title: 'SHOP CONVENIENTLY',
      message:
          'Shop from an unlimited stock of groceries from the convenience of your homes',
    ),
    const OnboardingMessage(
      imageSvgPath: 'assets/images/onboarding2.svg.vec',
      title: 'EXPERTLY CURATED RECIPES',
      message:
          'Our recipes are prepared in the finest of conditions by experts in their fields',
    ),
    const OnboardingMessage(
      imageSvgPath: 'assets/images/onboarding3.svg.vec',
      title: 'BRING OUT THE CHEF IN YOU',
      message:
          'Our recipes are specially picked so you can get cooking in no time',
    ),
  ];

  @override
  List<OnboardingMessage> get onboardingMessages => _onboardingMessages;
}
