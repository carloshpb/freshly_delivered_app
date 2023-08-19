// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

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
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'modified_at') DateTime? modifiedAt,
  }) = UserData;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);
}
