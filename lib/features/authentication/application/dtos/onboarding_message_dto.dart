import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/onboarding_message.dart';

part 'onboarding_message_dto.freezed.dart';

@freezed
class OnboardingMessageDto with _$OnboardingMessageDto {
  const OnboardingMessageDto._();

  const factory OnboardingMessageDto({
    required String imageSvgPath,
    required String title,
    required String message,
  }) = _OnboardingMessageDto;

  factory OnboardingMessageDto.fromDomain(OnboardingMessage domain) =>
      OnboardingMessageDto(
        title: domain.title,
        imageSvgPath: domain.imageSvgPath,
        message: domain.message,
      );

  OnboardingMessage toDomain() {
    return OnboardingMessage(
      title: this.title,
      imageSvgPath: this.imageSvgPath,
      message: this.message,
    );
  }
}
