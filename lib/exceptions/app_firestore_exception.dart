import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_api_exception.dart';

@freezed
sealed class AppFirestoreException
    with _$AppFirestoreException
    implements AppApiException {
  const AppFirestoreException._();

  const factory AppFirestoreException.invalidEmail() = InvalidEmailException;
  const factory AppFirestoreException.invalidPhoneNumber() =
      InvalidPhoneNumberException;
  const factory AppFirestoreException.missingAndroidPkgName() =
      MissingAndroidPkgNameException;
  const factory AppFirestoreException.missingContinueUri() =
      MissingContinueUriException;
  const factory AppFirestoreException.missingIosBundleId() =
      MissingIosBundleIdException;
  const factory AppFirestoreException.invalidContinueUri() =
      InvalidContinueUriException;
  const factory AppFirestoreException.unauthorizedContinueUri() =
      UnauthorizedContinueUriException;
  const factory AppFirestoreException.userNotFound() = UserNotFoundException;
  const factory AppFirestoreException.userDisabled() = UserDisabledException;
  const factory AppFirestoreException.wrongPassword() = WrongPasswordException;
  const factory AppFirestoreException.emailAlreadyInUseException() =
      EmailAlreadyInUseException;
  const factory AppFirestoreException.operationNotAllowedException() =
      OperationNotAllowedException;
  const factory AppFirestoreException.weakPassword() = WeakPasswordException;
  const factory AppFirestoreException.expiredActionCode() =
      ExpiredActionCodeException;
  const factory AppFirestoreException.invalidActionCode() =
      InvalidActionCodeException;
  const factory AppFirestoreException.unknownAuthCode(String code) =
      UnknownAuthCodeException;

  factory AppFirestoreException.fromFirebaseException(
      FirebaseException firebaseException) {
    switch (firebaseException.code) {
      case "aborted":
        break;
      case "already_exists":
        break;
      case "cancelled":
        break;
      case "data-loss":
        break;
      case "deadline-exceeded":
        break;
      case "failed-precondition":
        break;
      case "internal":
        break;
      case "invalid-argument":
        break;
      case "not-found":
        break;
      case "ok":
        break;
      case "out-of-range":
        break;
      case "permission-denied":
        break;
      case "resource-exhausted":
        break;
      case "unauthenticated":
        break;
      case "unavailable":
        break;
      case "unimplemented":
        break;
      default: //UNKNOWN
    }
  }

  @override
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
