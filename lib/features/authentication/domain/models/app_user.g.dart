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

_$UserConnecting _$$UserConnectingFromJson(Map<String, dynamic> json) =>
    _$UserConnecting(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserConnectingToJson(_$UserConnecting instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UserData _$$UserDataFromJson(Map<String, dynamic> json) => _$UserData(
      uid: json['uid'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      fullname: json['fullname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserDataToJson(_$UserData instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'password': instance.password,
      'fullname': instance.fullname,
      'phoneNumber': instance.phoneNumber,
      'runtimeType': instance.$type,
    };

_$UserNoPersonalData _$$UserNoPersonalDataFromJson(Map<String, dynamic> json) =>
    _$UserNoPersonalData(
      uid: json['uid'] as String,
      email: json['email'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserNoPersonalDataToJson(
        _$UserNoPersonalData instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'runtimeType': instance.$type,
    };
