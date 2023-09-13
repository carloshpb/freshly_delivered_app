// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserNotConnected _$$UserNotConnectedFromJson(Map<String, dynamic> json) =>
    _$UserNotConnected(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserNotConnectedToJson(_$UserNotConnected instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UserData _$$UserDataFromJson(Map<String, dynamic> json) => _$UserData(
      id: json['id'] as String,
      email: json['email'] as String,
      fullname: json['fullname'] as String,
      phoneNumber: json['phone_number'] as String,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['created_at'] as Timestamp?),
      modifiedAt: const DateTimeTimestampConverter()
          .fromJson(json['modified_at'] as Timestamp?),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserDataToJson(_$UserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullname': instance.fullname,
      'phone_number': instance.phoneNumber,
      'created_at':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'modified_at':
          const DateTimeTimestampConverter().toJson(instance.modifiedAt),
      'runtimeType': instance.$type,
    };

_$UserSimple _$$UserSimpleFromJson(Map<String, dynamic> json) => _$UserSimple(
      id: json['id'] as String,
      email: json['email'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserSimpleToJson(_$UserSimple instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'runtimeType': instance.$type,
    };
