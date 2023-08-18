import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
sealed class AppUser with _$AppUser {
  const factory AppUser.notConnected() = UserNotConnected;

  const factory AppUser.connecting() = UserConnecting;

  const factory AppUser.data({
    required String uid,
    required String email,
    required String password,
    required String fullname,
    required String phoneNumber,
  }) = UserData;

  const factory AppUser.noPersonalData({
    required String uid,
    required String email,
  }) = UserNoPersonalData;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);
}
