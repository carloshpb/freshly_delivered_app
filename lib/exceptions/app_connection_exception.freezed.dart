// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_connection_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppConnectionException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() internetOff,
    required TResult Function() serverOff,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? internetOff,
    TResult? Function()? serverOff,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? internetOff,
    TResult Function()? serverOff,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InternetOffException value) internetOff,
    required TResult Function(ServerOffException value) serverOff,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternetOffException value)? internetOff,
    TResult? Function(ServerOffException value)? serverOff,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternetOffException value)? internetOff,
    TResult Function(ServerOffException value)? serverOff,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConnectionExceptionCopyWith<$Res> {
  factory $AppConnectionExceptionCopyWith(AppConnectionException value,
          $Res Function(AppConnectionException) then) =
      _$AppConnectionExceptionCopyWithImpl<$Res, AppConnectionException>;
}

/// @nodoc
class _$AppConnectionExceptionCopyWithImpl<$Res,
        $Val extends AppConnectionException>
    implements $AppConnectionExceptionCopyWith<$Res> {
  _$AppConnectionExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InternetOffExceptionCopyWith<$Res> {
  factory _$$InternetOffExceptionCopyWith(_$InternetOffException value,
          $Res Function(_$InternetOffException) then) =
      __$$InternetOffExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InternetOffExceptionCopyWithImpl<$Res>
    extends _$AppConnectionExceptionCopyWithImpl<$Res, _$InternetOffException>
    implements _$$InternetOffExceptionCopyWith<$Res> {
  __$$InternetOffExceptionCopyWithImpl(_$InternetOffException _value,
      $Res Function(_$InternetOffException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InternetOffException extends InternetOffException {
  const _$InternetOffException() : super._();

  @override
  String toString() {
    return 'AppConnectionException.internetOff()';
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
    required TResult Function() internetOff,
    required TResult Function() serverOff,
  }) {
    return internetOff();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? internetOff,
    TResult? Function()? serverOff,
  }) {
    return internetOff?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? internetOff,
    TResult Function()? serverOff,
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
    required TResult Function(InternetOffException value) internetOff,
    required TResult Function(ServerOffException value) serverOff,
  }) {
    return internetOff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternetOffException value)? internetOff,
    TResult? Function(ServerOffException value)? serverOff,
  }) {
    return internetOff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternetOffException value)? internetOff,
    TResult Function(ServerOffException value)? serverOff,
    required TResult orElse(),
  }) {
    if (internetOff != null) {
      return internetOff(this);
    }
    return orElse();
  }
}

abstract class InternetOffException extends AppConnectionException {
  const factory InternetOffException() = _$InternetOffException;
  const InternetOffException._() : super._();
}

/// @nodoc
abstract class _$$ServerOffExceptionCopyWith<$Res> {
  factory _$$ServerOffExceptionCopyWith(_$ServerOffException value,
          $Res Function(_$ServerOffException) then) =
      __$$ServerOffExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerOffExceptionCopyWithImpl<$Res>
    extends _$AppConnectionExceptionCopyWithImpl<$Res, _$ServerOffException>
    implements _$$ServerOffExceptionCopyWith<$Res> {
  __$$ServerOffExceptionCopyWithImpl(
      _$ServerOffException _value, $Res Function(_$ServerOffException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerOffException extends ServerOffException {
  const _$ServerOffException() : super._();

  @override
  String toString() {
    return 'AppConnectionException.serverOff()';
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
    required TResult Function() internetOff,
    required TResult Function() serverOff,
  }) {
    return serverOff();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? internetOff,
    TResult? Function()? serverOff,
  }) {
    return serverOff?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? internetOff,
    TResult Function()? serverOff,
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
    required TResult Function(InternetOffException value) internetOff,
    required TResult Function(ServerOffException value) serverOff,
  }) {
    return serverOff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InternetOffException value)? internetOff,
    TResult? Function(ServerOffException value)? serverOff,
  }) {
    return serverOff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InternetOffException value)? internetOff,
    TResult Function(ServerOffException value)? serverOff,
    required TResult orElse(),
  }) {
    if (serverOff != null) {
      return serverOff(this);
    }
    return orElse();
  }
}

abstract class ServerOffException extends AppConnectionException {
  const factory ServerOffException() = _$ServerOffException;
  const ServerOffException._() : super._();
}
