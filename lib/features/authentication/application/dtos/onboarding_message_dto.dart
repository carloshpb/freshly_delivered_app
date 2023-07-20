import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_message_dto.freezed.dart';

@freezed
class OnboardingMessageDTO with _$OnboardingMessageDTO {
  const OnboardingMessageDTO._();

  const factory OnboardingMessageDTO({
    required String imageSvgPath,
    required String title,
    required String message,
  }) = _OnboardingMessageDTO;
}
