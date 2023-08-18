// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_sqflite_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppSqfliteException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failInsert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? failInsert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failInsert,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FailInsertSQLException value) failInsert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FailInsertSQLException value)? failInsert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FailInsertSQLException value)? failInsert,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSqfliteExceptionCopyWith<$Res> {
  factory $AppSqfliteExceptionCopyWith(
          AppSqfliteException value, $Res Function(AppSqfliteException) then) =
      _$AppSqfliteExceptionCopyWithImpl<$Res, AppSqfliteException>;
}

/// @nodoc
class _$AppSqfliteExceptionCopyWithImpl<$Res, $Val extends AppSqfliteException>
    implements $AppSqfliteExceptionCopyWith<$Res> {
  _$AppSqfliteExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FailInsertSQLExceptionCopyWith<$Res> {
  factory _$$FailInsertSQLExceptionCopyWith(_$FailInsertSQLException value,
          $Res Function(_$FailInsertSQLException) then) =
      __$$FailInsertSQLExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailInsertSQLExceptionCopyWithImpl<$Res>
    extends _$AppSqfliteExceptionCopyWithImpl<$Res, _$FailInsertSQLException>
    implements _$$FailInsertSQLExceptionCopyWith<$Res> {
  __$$FailInsertSQLExceptionCopyWithImpl(_$FailInsertSQLException _value,
      $Res Function(_$FailInsertSQLException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FailInsertSQLException extends FailInsertSQLException {
  const _$FailInsertSQLException() : super._();

  @override
  String toString() {
    return 'AppSqfliteException.failInsert()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailInsertSQLException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failInsert,
  }) {
    return failInsert();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? failInsert,
  }) {
    return failInsert?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failInsert,
    required TResult orElse(),
  }) {
    if (failInsert != null) {
      return failInsert();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FailInsertSQLException value) failInsert,
  }) {
    return failInsert(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FailInsertSQLException value)? failInsert,
  }) {
    return failInsert?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FailInsertSQLException value)? failInsert,
    required TResult orElse(),
  }) {
    if (failInsert != null) {
      return failInsert(this);
    }
    return orElse();
  }
}

abstract class FailInsertSQLException extends AppSqfliteException {
  const factory FailInsertSQLException() = _$FailInsertSQLException;
  const FailInsertSQLException._() : super._();
}
