import '../../../use_case.dart';
import '../../application/dtos/onboarding_message_dto.dart';

abstract class GetOnboardingMessagesUseCase
    implements UseCase<void, List<OnboardingMessageDto>> {
  @override
  List<OnboardingMessageDto> execute([void request]);
}
