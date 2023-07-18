import '../models/onboarding_message.dart';

abstract class OnboardingMessagesRepository {
  List<OnboardingMessage> get onboardingMessages;
}
