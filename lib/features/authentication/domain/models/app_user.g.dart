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
      uid: json['uid'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      fullname: json['fullname'] as String,
      phoneNumber: json['phone_number'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      modifiedAt: json['modified_at'] == null
          ? null
          : DateTime.parse(json['modified_at'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserDataToJson(_$UserData instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'password': instance.password,
      'fullname': instance.fullname,
      'phone_number': instance.phoneNumber,
      'created_at': instance.createdAt?.toIso8601String(),
      'modified_at': instance.modifiedAt?.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$UserSimple _$$UserSimpleFromJson(Map<String, dynamic> json) => _$UserSimple(
      uid: json['uid'] as String,
      email: json['email'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserSimpleToJson(_$UserSimple instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'runtimeType': instance.$type,
    };
