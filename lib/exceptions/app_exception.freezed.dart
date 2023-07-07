// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() incompleteVerificationCode,
    required TResult Function() userNotSignedIn,
    required TResult Function() invalidEmailOrPasswordSignIn,
    required TResult Function() internetOff,
    required TResult Function() serverOff,
    required TResult Function() wrongFormat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? incompleteVerificationCode,
    TResult? Function()? userNotSignedIn,
    TResult? Function()? invalidEmailOrPasswordSignIn,
    TResult? Function()? internetOff,
    TResult? Function()? serverOff,
    TResult? Function()? wrongFormat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? incompleteVerificationCode,
    TResult Function()? userNotSignedIn,
    TResult Function()? invalidEmailOrPasswordSignIn,
    TResult Function()? internetOff,
    TResult Function()? serverOff,
    TResult Function()? wrongFormat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncompleteVerificationCodeException value)
        incompleteVerificationCode,
    required TResult Function(UserNotSignedInException value) userNotSignedIn,
    required TResult Function(InvalidEmailOrPasswordSignInException value)
        invalidEmailOrPasswordSignIn,
    required TResult Function(InternetOffException value) internetOff,
    required TResult Function(ServerOffException value) serverOff,
    required TResult Function(WrongFormatException value) wrongFormat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult? Function(UserNotSignedInException value)? userNotSignedIn,
    TResult? Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult? Function(InternetOffException value)? internetOff,
    TResult? Function(ServerOffException value)? serverOff,
    TResult? Function(WrongFormatException value)? wrongFormat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult Function(UserNotSignedInException value)? userNotSignedIn,
    TResult Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult Function(InternetOffException value)? internetOff,
    TResult Function(ServerOffException value)? serverOff,
    TResult Function(WrongFormatException value)? wrongFormat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IncompleteVerificationCodeExceptionCopyWith<$Res> {
  factory _$$IncompleteVerificationCodeExceptionCopyWith(
          _$IncompleteVerificationCodeException value,
          $Res Function(_$IncompleteVerificationCodeException) then) =
      __$$IncompleteVerificationCodeExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IncompleteVerificationCodeExceptionCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res,
        _$IncompleteVerificationCodeException>
    implements _$$IncompleteVerificationCodeExceptionCopyWith<$Res> {
  __$$IncompleteVerificationCodeExceptionCopyWithImpl(
      _$IncompleteVerificationCodeException _value,
      $Res Function(_$IncompleteVerificationCodeException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IncompleteVerificationCodeException
    implements IncompleteVerificationCodeException {
  const _$IncompleteVerificationCodeException();

  @override
  String toString() {
    return 'AppException.incompleteVerificationCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncompleteVerificationCodeException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() incompleteVerificationCode,
    required TResult Function() userNotSignedIn,
    required TResult Function() invalidEmailOrPasswordSignIn,
    required TResult Function() internetOff,
    required TResult Function() serverOff,
    required TResult Function() wrongFormat,
  }) {
    return incompleteVerificationCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? incompleteVerificationCode,
    TResult? Function()? userNotSignedIn,
    TResult? Function()? invalidEmailOrPasswordSignIn,
    TResult? Function()? internetOff,
    TResult? Function()? serverOff,
    TResult? Function()? wrongFormat,
  }) {
    return incompleteVerificationCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? incompleteVerificationCode,
    TResult Function()? userNotSignedIn,
    TResult Function()? invalidEmailOrPasswordSignIn,
    TResult Function()? internetOff,
    TResult Function()? serverOff,
    TResult Function()? wrongFormat,
    required TResult orElse(),
  }) {
    if (incompleteVerificationCode != null) {
      return incompleteVerificationCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncompleteVerificationCodeException value)
        incompleteVerificationCode,
    required TResult Function(UserNotSignedInException value) userNotSignedIn,
    required TResult Function(InvalidEmailOrPasswordSignInException value)
        invalidEmailOrPasswordSignIn,
    required TResult Function(InternetOffException value) internetOff,
    required TResult Function(ServerOffException value) serverOff,
    required TResult Function(WrongFormatException value) wrongFormat,
  }) {
    return incompleteVerificationCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult? Function(UserNotSignedInException value)? userNotSignedIn,
    TResult? Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult? Function(InternetOffException value)? internetOff,
    TResult? Function(ServerOffException value)? serverOff,
    TResult? Function(WrongFormatException value)? wrongFormat,
  }) {
    return incompleteVerificationCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult Function(UserNotSignedInException value)? userNotSignedIn,
    TResult Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult Function(InternetOffException value)? internetOff,
    TResult Function(ServerOffException value)? serverOff,
    TResult Function(WrongFormatException value)? wrongFormat,
    required TResult orElse(),
  }) {
    if (incompleteVerificationCode != null) {
      return incompleteVerificationCode(this);
    }
    return orElse();
  }
}

abstract class IncompleteVerificationCodeException implements AppException {
  const factory IncompleteVerificationCodeException() =
      _$IncompleteVerificationCodeException;
}

/// @nodoc
abstract class _$$UserNotSignedInExceptionCopyWith<$Res> {
  factory _$$UserNotSignedInExceptionCopyWith(_$UserNotSignedInException value,
          $Res Function(_$UserNotSignedInException) then) =
      __$$UserNotSignedInExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNotSignedInExceptionCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UserNotSignedInException>
    implements _$$UserNotSignedInExceptionCopyWith<$Res> {
  __$$UserNotSignedInExceptionCopyWithImpl(_$UserNotSignedInException _value,
      $Res Function(_$UserNotSignedInException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserNotSignedInException implements UserNotSignedInException {
  const _$UserNotSignedInException();

  @override
  String toString() {
    return 'AppException.userNotSignedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNotSignedInException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() incompleteVerificationCode,
    required TResult Function() userNotSignedIn,
    required TResult Function() invalidEmailOrPasswordSignIn,
    required TResult Function() internetOff,
    required TResult Function() serverOff,
    required TResult Function() wrongFormat,
  }) {
    return userNotSignedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? incompleteVerificationCode,
    TResult? Function()? userNotSignedIn,
    TResult? Function()? invalidEmailOrPasswordSignIn,
    TResult? Function()? internetOff,
    TResult? Function()? serverOff,
    TResult? Function()? wrongFormat,
  }) {
    return userNotSignedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? incompleteVerificationCode,
    TResult Function()? userNotSignedIn,
    TResult Function()? invalidEmailOrPasswordSignIn,
    TResult Function()? internetOff,
    TResult Function()? serverOff,
    TResult Function()? wrongFormat,
    required TResult orElse(),
  }) {
    if (userNotSignedIn != null) {
      return userNotSignedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncompleteVerificationCodeException value)
        incompleteVerificationCode,
    required TResult Function(UserNotSignedInException value) userNotSignedIn,
    required TResult Function(InvalidEmailOrPasswordSignInException value)
        invalidEmailOrPasswordSignIn,
    required TResult Function(InternetOffException value) internetOff,
    required TResult Function(ServerOffException value) serverOff,
    required TResult Function(WrongFormatException value) wrongFormat,
  }) {
    return userNotSignedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult? Function(UserNotSignedInException value)? userNotSignedIn,
    TResult? Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult? Function(InternetOffException value)? internetOff,
    TResult? Function(ServerOffException value)? serverOff,
    TResult? Function(WrongFormatException value)? wrongFormat,
  }) {
    return userNotSignedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult Function(UserNotSignedInException value)? userNotSignedIn,
    TResult Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult Function(InternetOffException value)? internetOff,
    TResult Function(ServerOffException value)? serverOff,
    TResult Function(WrongFormatException value)? wrongFormat,
    required TResult orElse(),
  }) {
    if (userNotSignedIn != null) {
      return userNotSignedIn(this);
    }
    return orElse();
  }
}

abstract class UserNotSignedInException implements AppException {
  const factory UserNotSignedInException() = _$UserNotSignedInException;
}

/// @nodoc
abstract class _$$InvalidEmailOrPasswordSignInExceptionCopyWith<$Res> {
  factory _$$InvalidEmailOrPasswordSignInExceptionCopyWith(
          _$InvalidEmailOrPasswordSignInException value,
          $Res Function(_$InvalidEmailOrPasswordSignInException) then) =
      __$$InvalidEmailOrPasswordSignInExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidEmailOrPasswordSignInExceptionCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res,
        _$InvalidEmailOrPasswordSignInException>
    implements _$$InvalidEmailOrPasswordSignInExceptionCopyWith<$Res> {
  __$$InvalidEmailOrPasswordSignInExceptionCopyWithImpl(
      _$InvalidEmailOrPasswordSignInException _value,
      $Res Function(_$InvalidEmailOrPasswordSignInException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidEmailOrPasswordSignInException
    implements InvalidEmailOrPasswordSignInException {
  const _$InvalidEmailOrPasswordSignInException();

  @override
  String toString() {
    return 'AppException.invalidEmailOrPasswordSignIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmailOrPasswordSignInException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() incompleteVerificationCode,
    required TResult Function() userNotSignedIn,
    required TResult Function() invalidEmailOrPasswordSignIn,
    required TResult Function() internetOff,
    required TResult Function() serverOff,
    required TResult Function() wrongFormat,
  }) {
    return invalidEmailOrPasswordSignIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? incompleteVerificationCode,
    TResult? Function()? userNotSignedIn,
    TResult? Function()? invalidEmailOrPasswordSignIn,
    TResult? Function()? internetOff,
    TResult? Function()? serverOff,
    TResult? Function()? wrongFormat,
  }) {
    return invalidEmailOrPasswordSignIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? incompleteVerificationCode,
    TResult Function()? userNotSignedIn,
    TResult Function()? invalidEmailOrPasswordSignIn,
    TResult Function()? internetOff,
    TResult Function()? serverOff,
    TResult Function()? wrongFormat,
    required TResult orElse(),
  }) {
    if (invalidEmailOrPasswordSignIn != null) {
      return invalidEmailOrPasswordSignIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncompleteVerificationCodeException value)
        incompleteVerificationCode,
    required TResult Function(UserNotSignedInException value) userNotSignedIn,
    required TResult Function(InvalidEmailOrPasswordSignInException value)
        invalidEmailOrPasswordSignIn,
    required TResult Function(InternetOffException value) internetOff,
    required TResult Function(ServerOffException value) serverOff,
    required TResult Function(WrongFormatException value) wrongFormat,
  }) {
    return invalidEmailOrPasswordSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult? Function(UserNotSignedInException value)? userNotSignedIn,
    TResult? Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult? Function(InternetOffException value)? internetOff,
    TResult? Function(ServerOffException value)? serverOff,
    TResult? Function(WrongFormatException value)? wrongFormat,
  }) {
    return invalidEmailOrPasswordSignIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult Function(UserNotSignedInException value)? userNotSignedIn,
    TResult Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult Function(InternetOffException value)? internetOff,
    TResult Function(ServerOffException value)? serverOff,
    TResult Function(WrongFormatException value)? wrongFormat,
    required TResult orElse(),
  }) {
    if (invalidEmailOrPasswordSignIn != null) {
      return invalidEmailOrPasswordSignIn(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailOrPasswordSignInException implements AppException {
  const factory InvalidEmailOrPasswordSignInException() =
      _$InvalidEmailOrPasswordSignInException;
}

/// @nodoc
abstract class _$$InternetOffExceptionCopyWith<$Res> {
  factory _$$InternetOffExceptionCopyWith(_$InternetOffException value,
          $Res Function(_$InternetOffException) then) =
      __$$InternetOffExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InternetOffExceptionCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$InternetOffException>
    implements _$$InternetOffExceptionCopyWith<$Res> {
  __$$InternetOffExceptionCopyWithImpl(_$InternetOffException _value,
      $Res Function(_$InternetOffException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InternetOffException implements InternetOffException {
  const _$InternetOffException();

  @override
  String toString() {
    return 'AppException.internetOff()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InternetOffException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() incompleteVerificationCode,
    required TResult Function() userNotSignedIn,
    required TResult Function() invalidEmailOrPasswordSignIn,
    required TResult Function() internetOff,
    required TResult Function() serverOff,
    required TResult Function() wrongFormat,
  }) {
    return internetOff();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? incompleteVerificationCode,
    TResult? Function()? userNotSignedIn,
    TResult? Function()? invalidEmailOrPasswordSignIn,
    TResult? Function()? internetOff,
    TResult? Function()? serverOff,
    TResult? Function()? wrongFormat,
  }) {
    return internetOff?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? incompleteVerificationCode,
    TResult Function()? userNotSignedIn,
    TResult Function()? invalidEmailOrPasswordSignIn,
    TResult Function()? internetOff,
    TResult Function()? serverOff,
    TResult Function()? wrongFormat,
    required TResult orElse(),
  }) {
    if (internetOff != null) {
      return internetOff();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncompleteVerificationCodeException value)
        incompleteVerificationCode,
    required TResult Function(UserNotSignedInException value) userNotSignedIn,
    required TResult Function(InvalidEmailOrPasswordSignInException value)
        invalidEmailOrPasswordSignIn,
    required TResult Function(InternetOffException value) internetOff,
    required TResult Function(ServerOffException value) serverOff,
    required TResult Function(WrongFormatException value) wrongFormat,
  }) {
    return internetOff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult? Function(UserNotSignedInException value)? userNotSignedIn,
    TResult? Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult? Function(InternetOffException value)? internetOff,
    TResult? Function(ServerOffException value)? serverOff,
    TResult? Function(WrongFormatException value)? wrongFormat,
  }) {
    return internetOff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult Function(UserNotSignedInException value)? userNotSignedIn,
    TResult Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult Function(InternetOffException value)? internetOff,
    TResult Function(ServerOffException value)? serverOff,
    TResult Function(WrongFormatException value)? wrongFormat,
    required TResult orElse(),
  }) {
    if (internetOff != null) {
      return internetOff(this);
    }
    return orElse();
  }
}

abstract class InternetOffException implements AppException {
  const factory InternetOffException() = _$InternetOffException;
}

/// @nodoc
abstract class _$$ServerOffExceptionCopyWith<$Res> {
  factory _$$ServerOffExceptionCopyWith(_$ServerOffException value,
          $Res Function(_$ServerOffException) then) =
      __$$ServerOffExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerOffExceptionCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ServerOffException>
    implements _$$ServerOffExceptionCopyWith<$Res> {
  __$$ServerOffExceptionCopyWithImpl(
      _$ServerOffException _value, $Res Function(_$ServerOffException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerOffException implements ServerOffException {
  const _$ServerOffException();

  @override
  String toString() {
    return 'AppException.serverOff()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerOffException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() incompleteVerificationCode,
    required TResult Function() userNotSignedIn,
    required TResult Function() invalidEmailOrPasswordSignIn,
    required TResult Function() internetOff,
    required TResult Function() serverOff,
    required TResult Function() wrongFormat,
  }) {
    return serverOff();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? incompleteVerificationCode,
    TResult? Function()? userNotSignedIn,
    TResult? Function()? invalidEmailOrPasswordSignIn,
    TResult? Function()? internetOff,
    TResult? Function()? serverOff,
    TResult? Function()? wrongFormat,
  }) {
    return serverOff?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? incompleteVerificationCode,
    TResult Function()? userNotSignedIn,
    TResult Function()? invalidEmailOrPasswordSignIn,
    TResult Function()? internetOff,
    TResult Function()? serverOff,
    TResult Function()? wrongFormat,
    required TResult orElse(),
  }) {
    if (serverOff != null) {
      return serverOff();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncompleteVerificationCodeException value)
        incompleteVerificationCode,
    required TResult Function(UserNotSignedInException value) userNotSignedIn,
    required TResult Function(InvalidEmailOrPasswordSignInException value)
        invalidEmailOrPasswordSignIn,
    required TResult Function(InternetOffException value) internetOff,
    required TResult Function(ServerOffException value) serverOff,
    required TResult Function(WrongFormatException value) wrongFormat,
  }) {
    return serverOff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult? Function(UserNotSignedInException value)? userNotSignedIn,
    TResult? Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult? Function(InternetOffException value)? internetOff,
    TResult? Function(ServerOffException value)? serverOff,
    TResult? Function(WrongFormatException value)? wrongFormat,
  }) {
    return serverOff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult Function(UserNotSignedInException value)? userNotSignedIn,
    TResult Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult Function(InternetOffException value)? internetOff,
    TResult Function(ServerOffException value)? serverOff,
    TResult Function(WrongFormatException value)? wrongFormat,
    required TResult orElse(),
  }) {
    if (serverOff != null) {
      return serverOff(this);
    }
    return orElse();
  }
}

abstract class ServerOffException implements AppException {
  const factory ServerOffException() = _$ServerOffException;
}

/// @nodoc
abstract class _$$WrongFormatExceptionCopyWith<$Res> {
  factory _$$WrongFormatExceptionCopyWith(_$WrongFormatException value,
          $Res Function(_$WrongFormatException) then) =
      __$$WrongFormatExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongFormatExceptionCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$WrongFormatException>
    implements _$$WrongFormatExceptionCopyWith<$Res> {
  __$$WrongFormatExceptionCopyWithImpl(_$WrongFormatException _value,
      $Res Function(_$WrongFormatException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WrongFormatException implements WrongFormatException {
  const _$WrongFormatException();

  @override
  String toString() {
    return 'AppException.wrongFormat()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WrongFormatException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() incompleteVerificationCode,
    required TResult Function() userNotSignedIn,
    required TResult Function() invalidEmailOrPasswordSignIn,
    required TResult Function() internetOff,
    required TResult Function() serverOff,
    required TResult Function() wrongFormat,
  }) {
    return wrongFormat();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? incompleteVerificationCode,
    TResult? Function()? userNotSignedIn,
    TResult? Function()? invalidEmailOrPasswordSignIn,
    TResult? Function()? internetOff,
    TResult? Function()? serverOff,
    TResult? Function()? wrongFormat,
  }) {
    return wrongFormat?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? incompleteVerificationCode,
    TResult Function()? userNotSignedIn,
    TResult Function()? invalidEmailOrPasswordSignIn,
    TResult Function()? internetOff,
    TResult Function()? serverOff,
    TResult Function()? wrongFormat,
    required TResult orElse(),
  }) {
    if (wrongFormat != null) {
      return wrongFormat();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncompleteVerificationCodeException value)
        incompleteVerificationCode,
    required TResult Function(UserNotSignedInException value) userNotSignedIn,
    required TResult Function(InvalidEmailOrPasswordSignInException value)
        invalidEmailOrPasswordSignIn,
    required TResult Function(InternetOffException value) internetOff,
    required TResult Function(ServerOffException value) serverOff,
    required TResult Function(WrongFormatException value) wrongFormat,
  }) {
    return wrongFormat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult? Function(UserNotSignedInException value)? userNotSignedIn,
    TResult? Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult? Function(InternetOffException value)? internetOff,
    TResult? Function(ServerOffException value)? serverOff,
    TResult? Function(WrongFormatException value)? wrongFormat,
  }) {
    return wrongFormat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncompleteVerificationCodeException value)?
        incompleteVerificationCode,
    TResult Function(UserNotSignedInException value)? userNotSignedIn,
    TResult Function(InvalidEmailOrPasswordSignInException value)?
        invalidEmailOrPasswordSignIn,
    TResult Function(InternetOffException value)? internetOff,
    TResult Function(ServerOffException value)? serverOff,
    TResult Function(WrongFormatException value)? wrongFormat,
    required TResult orElse(),
  }) {
    if (wrongFormat != null) {
      return wrongFormat(this);
    }
    return orElse();
  }
}

abstract class WrongFormatException implements AppException {
  const factory WrongFormatException() = _$WrongFormatException;
}
