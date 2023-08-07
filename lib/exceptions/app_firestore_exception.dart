// import 'package:freezed_annotation/freezed_annotation.dart';

// @freezed
// sealed class AppFirestoreException
//     with _$AppFirestoreException
//     implements Exception {
//   const AppFirestoreException._();

//   const factory AppFirestoreException.invalidEmail() = InvalidEmailException;
//   const factory AppFirestoreException.invalidPhoneNumber() =
//       InvalidPhoneNumberException;
//   const factory AppFirestoreException.missingAndroidPkgName() =
//       MissingAndroidPkgNameException;
//   const factory AppFirestoreException.missingContinueUri() =
//       MissingContinueUriException;
//   const factory AppFirestoreException.missingIosBundleId() =
//       MissingIosBundleIdException;
//   const factory AppFirestoreException.invalidContinueUri() =
//       InvalidContinueUriException;
//   const factory AppFirestoreException.unauthorizedContinueUri() =
//       UnauthorizedContinueUriException;
//   const factory AppFirestoreException.userNotFound() = UserNotFoundException;
//   const factory AppFirestoreException.userDisabled() = UserDisabledException;
//   const factory AppFirestoreException.wrongPassword() = WrongPasswordException;
//   const factory AppFirestoreException.emailAlreadyInUseException() =
//       EmailAlreadyInUseException;
//   const factory AppFirestoreException.operationNotAllowedException() =
//       OperationNotAllowedException;
//   const factory AppFirestoreException.weakPassword() = WeakPasswordException;
//   const factory AppFirestoreException.expiredActionCode() =
//       ExpiredActionCodeException;
//   const factory AppFirestoreException.invalidActionCode() =
//       InvalidActionCodeException;
//   const factory AppFirestoreException.unknownAuthCode(String code) =
//       UnknownAuthCodeException;

//   @override
//   String toString() {
//     return message;
//   }

//   String get message {
//     switch (this) {
//       case InvalidEmailException():
//         return Strings.invalidEmail;
//       case InvalidPhoneNumberException():
//         return Strings.invalidPhoneNumber;
//       case MissingAndroidPkgNameException():
//         return Strings.missingAndroidPkgName;
//       case MissingContinueUriException():
//         return Strings.missingContinueUri;
//       case MissingIosBundleIdException():
//         return Strings.missingIosBundleId;
//       case InvalidContinueUriException():
//         return Strings.invalidContinueUri;
//       case UnauthorizedContinueUriException():
//         return Strings.unauthorizedContinueUri;
//       case UserNotFoundException():
//         return Strings.userNotFound;
//       case UserDisabledException():
//         return Strings.userDisabled;
//       case WrongPasswordException():
//         return Strings.wrongPassword;
//       case EmailAlreadyInUseException():
//         return Strings.emailAlreadyInUseException;
//       case OperationNotAllowedException():
//         return Strings.operationNotAllowedException;
//       case WeakPasswordException():
//         return Strings.weakPassword;
//       case ExpiredActionCodeException():
//         return Strings.expiredActionCode;
//       case InvalidActionCodeException():
//         return Strings.invalidActionCode;
//       case UnknownAuthCodeException(:final String code):
//         return "${Strings.unknownErrorCode} : $code";
//     }
//   }
// }