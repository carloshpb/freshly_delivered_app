import '../../../use_case.dart';
import '../../application/dtos/onboarding_message_dto.dart';

abstract class GetOnboardingMessagesUseCase
    implements UseCase<void, List<OnboardingMessageDTO>> {
  @override
  List<OnboardingMessageDTO> execute([void request]);
}
