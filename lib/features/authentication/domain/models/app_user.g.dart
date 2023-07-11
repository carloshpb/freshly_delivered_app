// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      uid: json['uid'] as String,
      email: json['email'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'runtimeType': instance.$type,
    };

_$FakeAppUser _$$FakeAppUserFromJson(Map<String, dynamic> json) =>
    _$FakeAppUser(
      uid: json['uid'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      fullname: json['fullname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FakeAppUserToJson(_$FakeAppUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'password': instance.password,
      'fullname': instance.fullname,
      'phoneNumber': instance.phoneNumber,
      'runtimeType': instance.$type,
    };
