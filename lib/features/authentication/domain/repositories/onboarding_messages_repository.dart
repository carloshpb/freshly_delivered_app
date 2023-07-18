import '../models/onboarding_message.dart';

abstract class OnboardingMessagesRepository {
  List<OnboardingMessage> get onboardingMessages;
  set onboardingMessages(List<OnboardingMessage> messages);
  void addOnboardingMessage(OnboardingMessage message);
}
