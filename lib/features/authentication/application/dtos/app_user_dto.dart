import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_dto.freezed.dart';

@freezed
class AppUserDTO with _$AppUserDTO {
  const AppUserDTO._();

  const AppUserDTO.notConnected();

  const factory AppUserDTO({
    required String imageSvgPath,
    required String title,
    required String message,
  }) = _AppUserDTO;
}
