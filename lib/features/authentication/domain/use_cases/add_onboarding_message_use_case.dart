import '../../../use_case.dart';
import '../../application/dtos/onboarding_message_dto.dart';

abstract class AddOnboardingMessageUseCase
    implements UseCase<OnboardingMessageDto, void> {
  @override
  void execute(OnboardingMessageDto request);
}
