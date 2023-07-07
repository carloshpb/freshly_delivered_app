import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/strings.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException implements Exception {
  // Authentication
  const factory AppException.incompleteVerificationCode() =
      IncompleteVerificationCodeException;
  const factory AppException.userNotSignedIn() = UserNotSignedInException;
  const factory AppException.invalidEmailOrPasswordSignIn() =
      InvalidEmailOrPasswordSignInException;

  // General
  const factory AppException.internetOff() = InternetOffException;
  const factory AppException.serverOff() = ServerOffException;
  const factory AppException.wrongFormat() = WrongFormatException;
}

extension AppExceptionMessage on AppException {
  String message() {
    return when(
      // Authentication
      incompleteVerificationCode: () => Strings.incompleteVerificationCode,
      userNotSignedIn: () => Strings.userNotSignedIn,
      invalidEmailOrPasswordSignIn: () => Strings.invalidEmailOrPasswordSignIn,

      // General
      internetOff: () => Strings.internetOff,
      serverOff: () => Strings.serverOff,
      wrongFormat: () => Strings.wrongFormat,
    );
  }
}
