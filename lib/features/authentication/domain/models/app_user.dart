import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    required String email,
  }) = _AppUser;

  const factory AppUser.fakeBack({
    required String uid,
    required String email,
    required String password,
    required String fullname,
    required String phoneNumber,
  }) = FakeAppUser;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);
}
