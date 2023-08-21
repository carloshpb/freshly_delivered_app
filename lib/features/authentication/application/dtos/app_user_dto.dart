import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_dto.freezed.dart';

@freezed
class AppUserDTO with _$AppUserDTO {
  const factory AppUserDTO.notConnected() = UserNotConnectedDTO;

  const factory AppUserDTO.data({
    required String uid,
    required String email,
    required String password,
    required String fullname,
    required String phoneNumber,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) = UserDataDTO;
}
