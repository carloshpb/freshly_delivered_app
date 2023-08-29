import '../../../use_case.dart';
import '../../application/dtos/onboarding_message_dto.dart';

abstract class SetOnboardingMessagesUseCase
    implements UseCase<List<OnboardingMessageDto>, void> {
  @override
  void execute(List<OnboardingMessageDto> request);
}
