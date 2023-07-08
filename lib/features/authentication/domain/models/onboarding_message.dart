import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_message.freezed.dart';
part 'onboarding_message.g.dart';

@freezed
class OnboardingMessage with _$OnboardingMessage {
  const OnboardingMessage._();

  const factory OnboardingMessage({
    required String imageSvgPath,
    required String title,
    required String message,
  }) = _OnboardingMessage;

  factory OnboardingMessage.fromJson(Map<String, Object?> json) =>
      _$OnboardingMessageFromJson(json);
}
