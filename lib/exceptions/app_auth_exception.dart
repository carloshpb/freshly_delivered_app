import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_api_exception.dart';

part 'app_auth_exception.freezed.dart';

@freezed
sealed class AppAuthException
    with _$AppAuthException
    implements AppApiException {
  const AppAuthException._();

  const factory AppAuthException.invalidEmail(String msg) =
      InvalidEmailException;
  const factory AppAuthException.invalidPhoneNumber(String msg) =
      InvalidPhoneNumberException;
  const factory AppAuthException.missingAndroidPkgName(String msg) =
      MissingAndroidPkgNameException;
  const factory AppAuthException.missingContinueUri(String msg) =
      MissingContinueUriException;
  const factory AppAuthException.missingIosBundleId(String msg) =
      MissingIosBundleIdException;
  const factory AppAuthException.invalidContinueUri(String msg) =
      InvalidContinueUriException;
  const factory AppAuthException.unauthorizedContinueUri(String msg) =
      UnauthorizedContinueUriException;
  const factory AppAuthException.userNotFound(String msg) =
      UserNotFoundException;
  const factory AppAuthException.userDisabled(String msg) =
      UserDisabledException;
  const factory AppAuthException.wrongPassword(String msg) =
      WrongPasswordException;
  const factory AppAuthException.emailAlreadyInUseException(String msg) =
      EmailAlreadyInUseException;
  const factory AppAuthException.operationNotAllowedException(String msg) =
      OperationNotAllowedException;
  const factory AppAuthException.weakPassword(String msg) =
      WeakPasswordException;
  const factory AppAuthException.expiredActionCode(String msg) =
      ExpiredActionCodeException;
  const factory AppAuthException.invalidActionCode(String msg) =
      InvalidActionCodeException;
  const factory AppAuthException.notConnected(String msg) =
      UserNotConnectedException;
  const factory AppAuthException.unknownAuthCode(String msg, String code) =
      UnknownAuthCodeException;

  // @override
  // String toString() {
  //   return message;
  // }

  factory AppAuthException.fromFirebaseException(
      FirebaseException firebaseException) {
    switch (firebaseException.code) {
      case "invalid-email":
        return InvalidEmailException(firebaseException.message!);
      case "invalid-phone-number":
        return InvalidPhoneNumberException(firebaseException.message!);
      case "missing-android-pkg-name":
        return MissingAndroidPkgNameException(firebaseException.message!);
      case "missing-continue-uri":
        return MissingContinueUriException(firebaseException.message!);
      case "missing-ios-bundle-id":
        return MissingIosBundleIdException(firebaseException.message!);
      case "invalid-continue-uri":
        return InvalidContinueUriException(firebaseException.message!);
      case "unauthorized-continue-uri":
        return UnauthorizedContinueUriException(firebaseException.message!);
      case "user-not-found":
        return UserNotFoundException(firebaseException.message!);
      case "user-disabled":
        return UserDisabledException(firebaseException.message!);
      case "wrong-password":
        return WrongPasswordException(firebaseException.message!);
      case "email-already-in-use":
        return EmailAlreadyInUseException(firebaseException.message!);
      case "operation-not-allowed":
        return OperationNotAllowedException(firebaseException.message!);
      case "weak-password":
        return WeakPasswordException(firebaseException.message!);
      case "expired-action-code":
        return ExpiredActionCodeException(firebaseException.message!);
      case "invalid-action-code":
        return InvalidActionCodeException(firebaseException.message!);
      case "user-not-connected":
        return UserNotConnectedException(firebaseException.message!);
      default:
        return UnknownAuthCodeException(
            firebaseException.message!, firebaseException.code);
    }
  }

  @override
  String get message {
    return msg;
  }

  // String get message {
  //   switch (this) {
  //     case InvalidEmailException():
  //       return Strings.invalidEmail;
  //     case InvalidPhoneNumberException():
  //       return Strings.invalidPhoneNumber;
  //     case MissingAndroidPkgNameException():
  //       return Strings.missingAndroidPkgName;
  //     case MissingContinueUriException():
  //       return Strings.missingContinueUri;
  //     case MissingIosBundleIdException():
  //       return Strings.missingIosBundleId;
  //     case InvalidContinueUriException():
  //       return Strings.invalidContinueUri;
  //     case UnauthorizedContinueUriException():
  //       return Strings.unauthorizedContinueUri;
  //     case UserNotFoundException():
  //       return Strings.userNotFound;
  //     case UserDisabledException():
  //       return Strings.userDisabled;
  //     case WrongPasswordException():
  //       return Strings.wrongPassword;
  //     case EmailAlreadyInUseException():
  //       return Strings.emailAlreadyInUseException;
  //     case OperationNotAllowedException():
  //       return Strings.operationNotAllowedException;
  //     case WeakPasswordException():
  //       return Strings.weakPassword;
  //     case ExpiredActionCodeException():
  //       return Strings.expiredActionCode;
  //     case InvalidActionCodeException():
  //       return Strings.invalidActionCode;
  //     case UserNotConnectedException():
  //       return Strings.userNotConnected;
  //     case UnknownAuthCodeException(:final String code):
  //       return "${Strings.unknownErrorCode} : $code";
  //   }
  // }
}

// extension FirebaseAuthCodeIdentifier on FirebaseAuthException {
//   AppAuthException convertToAppException() {
//     switch (code) {
//       case "invalid-email":
//         return const InvalidEmailException();
//       case "invalid-phone-number":
//         return const InvalidPhoneNumberException();
//       case "missing-android-pkg-name":
//         return const MissingAndroidPkgNameException();
//       case "missing-continue-uri":
//         return const MissingContinueUriException();
//       case "missing-ios-bundle-id":
//         return const MissingIosBundleIdException();
//       case "invalid-continue-uri":
//         return const InvalidContinueUriException();
//       case "unauthorized-continue-uri":
//         return const UnauthorizedContinueUriException();
//       case "user-not-found":
//         return const UserNotFoundException();
//       case "user-disabled":
//         return const UserDisabledException();
//       case "wrong-password":
//         return const WrongPasswordException();
//       case "email-already-in-use":
//         return const EmailAlreadyInUseException();
//       case "operation-not-allowed":
//         return const OperationNotAllowedException();
//       case "weak-password":
//         return const WeakPasswordException();
//       case "expired-action-code":
//         return const ExpiredActionCodeException();
//       case "invalid-action-code":
//         return const InvalidActionCodeException();
//       case "user-not-connected":
//         return UserNotConnectedException();
//       default:
//         return UnknownAuthCodeException(code);
//     }
//   }
// }
