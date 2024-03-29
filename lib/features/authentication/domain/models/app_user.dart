// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/converters/datetime_timestamp_converter.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
sealed class AppUser with _$AppUser {
  const AppUser._();

  const factory AppUser.notConnected() = UserNotConnected;

  @JsonSerializable(explicitToJson: true)
  @Assert('id != ""', 'id cannot be empty')
  @Assert('email != ""', 'id cannot be empty')
  @Assert('fullname != ""', 'id cannot be empty')
  @Assert('phoneNumber != ""', 'id cannot be empty')
  const factory AppUser.data({
    required String id,
    required String email,
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
  @Assert('id != ""', 'id cannot be empty')
  @Assert('email != ""', 'id cannot be empty')
  const factory AppUser.simple({
    required String id,
    required String email,
  }) = UserSimple;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);
}
