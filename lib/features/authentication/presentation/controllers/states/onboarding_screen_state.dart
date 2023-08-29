import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../application/dtos/onboarding_message_dto.dart';

part 'onboarding_screen_state.freezed.dart';

@freezed
class OnboardingScreenState with _$OnboardingScreenState {
  const factory OnboardingScreenState({
    required int pagePosition,
    required List<OnboardingMessageDto> messages,
  }) = _OnboardingScreenState;
}
