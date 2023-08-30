// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/converters/datetime_timestamp_converter.dart';

part 'onboarding_message.freezed.dart';
part 'onboarding_message.g.dart';

@freezed
class OnboardingMessage with _$OnboardingMessage {
  //const OnboardingMessage._();

  @JsonSerializable(explicitToJson: true)
  @Assert('title != ""', 'title cannot be empty')
  @Assert('message != ""', 'message cannot be empty')
  @Assert('imageSvgPath != ""', 'imageSvgPath cannot be empty')
  const factory OnboardingMessage({
    required String title,
    required String message,
    required String imageSvgPath,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'created_at')
    DateTime? createdAt,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'modified_at')
    DateTime? modifiedAt,
  }) = _OnboardingMessage;

  factory OnboardingMessage.fromJson(Map<String, Object?> json) =>
      _$OnboardingMessageFromJson(json);
}
