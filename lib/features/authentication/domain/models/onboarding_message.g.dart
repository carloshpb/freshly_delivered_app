// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OnboardingMessage _$$_OnboardingMessageFromJson(Map<String, dynamic> json) =>
    _$_OnboardingMessage(
      imageSvgPath: json['imageSvgPath'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['created_at'] as Timestamp?),
      modifiedAt: const DateTimeTimestampConverter()
          .fromJson(json['modified_at'] as Timestamp?),
    );

Map<String, dynamic> _$$_OnboardingMessageToJson(
        _$_OnboardingMessage instance) =>
    <String, dynamic>{
      'imageSvgPath': instance.imageSvgPath,
      'title': instance.title,
      'message': instance.message,
      'created_at':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'modified_at':
          const DateTimeTimestampConverter().toJson(instance.modifiedAt),
    };
