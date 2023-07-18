import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/strings.dart';

part 'app_auth_exception.freezed.dart';

@freezed
sealed class AppAuthException with _$AppAuthException implements Exception {
  const AppAuthException._();

  const factory AppAuthException.invalidEmail() = InvalidEmailException;
  const factory AppAuthException.invalidPhoneNumber() =
      InvalidPhoneNumberException;
  const factory AppAuthException.missingAndroidPkgName() =
      MissingAndroidPkgNameException;
  const factory AppAuthException.missingContinueUri() =
      MissingContinueUriException;
  const factory AppAuthException.missingIosBundleId() =
      MissingIosBundleIdException;
  const factory AppAuthException.invalidContinueUri() =
      InvalidContinueUriException;
  const factory AppAuthException.unauthorizedContinueUri() =
      UnauthorizedContinueUriException;
  const factory AppAuthException.userNotFound() = UserNotFoundException;
  const factory AppAuthException.userDisabled() = UserDisabledException;
  const factory AppAuthException.wrongPassword() = WrongPasswordException;
  const factory AppAuthException.emailAlreadyInUseException() =
      EmailAlreadyInUseException;
  const factory AppAuthException.operationNotAllowedException() =
      OperationNotAllowedException;
  const factory AppAuthException.weakPassword() = WeakPasswordException;
  const factory AppAuthException.expiredActionCode() =
      ExpiredActionCodeException;
  const factory AppAuthException.invalidActionCode() =
      InvalidActionCodeException;
  const factory AppAuthException.unknownAuthCode(String code) =
      UnknownAuthCodeException;

  @override
  String toString() {
    return message;
  }

  String get message {
    switch (this) {
      case InvalidEmailException():
        return Strings.invalidEmail;
      case InvalidPhoneNumberException():
        return Strings.invalidPhoneNumber;
      case MissingAndroidPkgNameException():
        return Strings.missingAndroidPkgName;
      case MissingContinueUriException():
        return Strings.missingContinueUri;
      case MissingIosBundleIdException():
        return Strings.missingIosBundleId;
      case InvalidContinueUriException():
        return Strings.invalidContinueUri;
      case UnauthorizedContinueUriException():
        return Strings.unauthorizedContinueUri;
      case UserNotFoundException():
        return Strings.userNotFound;
      case UserDisabledException():
        return Strings.userDisabled;
      case WrongPasswordException():
        return Strings.wrongPassword;
      case EmailAlreadyInUseException():
        return Strings.emailAlreadyInUseException;
      case OperationNotAllowedException():
        return Strings.operationNotAllowedException;
      case WeakPasswordException():
        return Strings.weakPassword;
      case ExpiredActionCodeException():
        return Strings.expiredActionCode;
      case InvalidActionCodeException():
        return Strings.invalidActionCode;
      case UnknownAuthCodeException(:final String code):
        return "${Strings.unknownErrorCode} : $code";
    }
  }
}

extension FirebaseAuthCodeIdentifier on FirebaseAuthException {
  AppAuthException convertToAppException() {
    switch (code) {
      case "auth/invalid-email":
        return const InvalidEmailException();
      case "auth/invalid-phone-number":
        return const InvalidPhoneNumberException();
      case "auth/missing-android-pkg-name":
        return const MissingAndroidPkgNameException();
      case "auth/missing-continue-uri":
        return const MissingContinueUriException();
      case "auth/missing-ios-bundle-id":
        return const MissingIosBundleIdException();
      case "auth/invalid-continue-uri":
        return const InvalidContinueUriException();
      case "auth/unauthorized-continue-uri":
        return const UnauthorizedContinueUriException();
      case "auth/user-not-found":
        return const UserNotFoundException();
      case "auth/user-disabled":
        return const UserDisabledException();
      case "auth/wrong-password":
        return const WrongPasswordException();
      case "auth/email-already-in-use":
        return const EmailAlreadyInUseException();
      case "auth/operation-not-allowed":
        return const OperationNotAllowedException();
      case "auth/weak-password":
        return const WeakPasswordException();
      case "auth/expired-action-code":
        return const ExpiredActionCodeException();
      case "auth/invalid-action-code":
        return const InvalidActionCodeException();
      default:
        return UnknownAuthCodeException(code);
    }
  }
}
