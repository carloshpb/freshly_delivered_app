import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_api_exception.dart';

part 'app_firestore_exception.freezed.dart';

@freezed
sealed class AppFirestoreException
    with _$AppFirestoreException
    implements AppApiException {
  const AppFirestoreException._();

  const factory AppFirestoreException.operationAborted(String msg) =
      OperationAbortedException;
  const factory AppFirestoreException.documentAlreadyExists(String msg) =
      DocumentAlreadyExistsException;
  const factory AppFirestoreException.operationCancelled(String msg) =
      OperationCancelledException;
  const factory AppFirestoreException.dataLoss(String msg) = DataLossException;
  const factory AppFirestoreException.deadlineExceeded(String msg) =
      DeadlineExceededException;
  const factory AppFirestoreException.failedPrecondition(String msg) =
      FailedPreconditionException;
  const factory AppFirestoreException.internal(String msg) = InternalException;
  const factory AppFirestoreException.invalidArgument(String msg) =
      InvalidArgumentException;
  const factory AppFirestoreException.notFound(String msg) = NotFoundException;
  const factory AppFirestoreException.outOfRange(String msg) =
      OutOfRangeException;
  const factory AppFirestoreException.permissionDenied(String msg) =
      PermissionDeniedException;
  const factory AppFirestoreException.resourceExhausted(String msg) =
      ResourceExhaustedException;
  const factory AppFirestoreException.unauthenticated(String msg) =
      UnauthenticatedException;
  const factory AppFirestoreException.unavailable(String msg) =
      UnavailableException;
  const factory AppFirestoreException.unimplemented(String msg) =
      UnimplementedException;
  const factory AppFirestoreException.unknown(String msg) = UnknownException;

  factory AppFirestoreException.fromFirebaseException(
      FirebaseException firebaseException) {
    switch (firebaseException.code) {
      case "aborted":
        return AppFirestoreException.operationAborted(
            firebaseException.message!);
      case "already_exists":
        return AppFirestoreException.documentAlreadyExists(
            firebaseException.message!);
      case "cancelled":
        return AppFirestoreException.operationCancelled(
            firebaseException.message!);
      case "data-loss":
        return AppFirestoreException.dataLoss(firebaseException.message!);
      case "deadline-exceeded":
        return AppFirestoreException.deadlineExceeded(
            firebaseException.message!);
      case "failed-precondition":
        return AppFirestoreException.failedPrecondition(
            firebaseException.message!);
      case "internal":
        return AppFirestoreException.internal(firebaseException.message!);
      case "invalid-argument":
        return AppFirestoreException.invalidArgument(
            firebaseException.message!);
      case "not-found":
        return AppFirestoreException.notFound(firebaseException.message!);
      case "out-of-range":
        return AppFirestoreException.outOfRange(firebaseException.message!);
      case "permission-denied":
        return AppFirestoreException.permissionDenied(
            firebaseException.message!);
      case "resource-exhausted":
        return AppFirestoreException.resourceExhausted(
            firebaseException.message!);
      case "unauthenticated":
        return AppFirestoreException.unauthenticated(
            firebaseException.message!);
      case "unavailable":
        return AppFirestoreException.unavailable(firebaseException.message!);
      case "unimplemented":
        return AppFirestoreException.unimplemented(firebaseException.message!);
      default:
        return AppFirestoreException.unknown(firebaseException.message!);
    }
  }

  @override
  String get message {
    return msg;
  }

  // @override
  // String get message {
  //   return msg;
  // }

  // @override
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
  //     case UnknownAuthCodeException(:final String code):
  //       return "${Strings.unknownErrorCode} : $code";
  //   }
  // }
}
