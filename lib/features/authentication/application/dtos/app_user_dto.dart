import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/app_user.dart';

part 'app_user_dto.freezed.dart';

@freezed
class AppUserDto with _$AppUserDto {
  const AppUserDto._();

  const factory AppUserDto.notConnected() = UserNotConnectedDto;

  @Assert('id != ""', 'id cannot be empty')
  @Assert('email != ""', 'id cannot be empty')
  @Assert('password != ""', 'id cannot be empty')
  @Assert('fullname != ""', 'id cannot be empty')
  @Assert('phoneNumber != ""', 'id cannot be empty')
  const factory AppUserDto.data({
    required String id,
    required String email,
    required String password,
    required String fullname,
    required String phoneNumber,
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) = UserDataDto;

  @Assert('id != ""', 'id cannot be empty')
  @Assert('email != ""', 'id cannot be empty')
  const factory AppUserDto.simple({
    required String id,
    required String email,
  }) = UserSimpleDto;

  factory AppUserDto.fromDomain(AppUser domain) => switch (domain) {
        UserSimple() => UserSimpleDto(
            id: domain.id,
            email: domain.email,
          ),
        UserData() => UserDataDto(
            id: domain.id,
            email: domain.email,
            password: domain.password,
            fullname: domain.fullname,
            phoneNumber: domain.phoneNumber,
            createdAt: domain.createdAt,
            modifiedAt: domain.modifiedAt,
          ),
        _ => const UserNotConnectedDto(),
      };

  AppUser toDomain() {
    return switch (this) {
      UserDataDto() => UserData(
          id: (this as UserDataDto).id,
          email: (this as UserDataDto).email,
          password: (this as UserDataDto).password,
          fullname: (this as UserDataDto).fullname,
          phoneNumber: (this as UserDataDto).phoneNumber,
        ),
      UserSimpleDto() => UserSimple(
          id: (this as UserSimpleDto).id,
          email: (this as UserSimpleDto).email,
        ),
      _ => const UserNotConnected(),
    };
  }
}
