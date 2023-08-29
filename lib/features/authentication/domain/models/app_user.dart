// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/converters/datetime_timestamp_converter.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
sealed class AppUser with _$AppUser {
  const factory AppUser.notConnected() = UserNotConnected;

  @JsonSerializable(explicitToJson: true)
  const factory AppUser.data({
    required String uid,
    required String email,
    required String password,
    required String fullname,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'created_at')
    DateTime? createdAt,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'modified_at')
    DateTime? modifiedAt,
  }) = UserData;

  @JsonSerializable(explicitToJson: true)
  const factory AppUser.simple({
    required String uid,
    required String email,
  }) = UserSimple;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);
}
