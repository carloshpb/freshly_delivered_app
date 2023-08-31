// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_sqlite_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppSqliteException {
  String get table => throw _privateConstructorUsedError;
  String get database => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic object, String table, String database)
        dataNotInserted,
    required TResult Function(dynamic object, String table, String database)
        dataNotDeleted,
    required TResult Function(dynamic object, String table, String database)
        dataNotFound,
    required TResult Function(dynamic object, String table, String database)
        dataNotUpdated,
    required TResult Function(String id, String table, String database)
        idNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic object, String table, String database)?
        dataNotInserted,
    TResult? Function(dynamic object, String table, String database)?
        dataNotDeleted,
    TResult? Function(dynamic object, String table, String database)?
        dataNotFound,
    TResult? Function(dynamic object, String table, String database)?
        dataNotUpdated,
    TResult? Function(String id, String table, String database)? idNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic object, String table, String database)?
        dataNotInserted,
    TResult Function(dynamic object, String table, String database)?
        dataNotDeleted,
    TResult Function(dynamic object, String table, String database)?
        dataNotFound,
    TResult Function(dynamic object, String table, String database)?
        dataNotUpdated,
    TResult Function(String id, String table, String database)? idNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataNotInsertedInDbException value)
        dataNotInserted,
    required TResult Function(DataNotDeletedInDbException value) dataNotDeleted,
    required TResult Function(DataNotFoundInDbException value) dataNotFound,
    required TResult Function(DataNotUpdatedInDbException value) dataNotUpdated,
    required TResult Function(IdNotFoundException value) idNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataNotInsertedInDbException value)? dataNotInserted,
    TResult? Function(DataNotDeletedInDbException value)? dataNotDeleted,
    TResult? Function(DataNotFoundInDbException value)? dataNotFound,
    TResult? Function(DataNotUpdatedInDbException value)? dataNotUpdated,
    TResult? Function(IdNotFoundException value)? idNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataNotInsertedInDbException value)? dataNotInserted,
    TResult Function(DataNotDeletedInDbException value)? dataNotDeleted,
    TResult Function(DataNotFoundInDbException value)? dataNotFound,
    TResult Function(DataNotUpdatedInDbException value)? dataNotUpdated,
    TResult Function(IdNotFoundException value)? idNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSqliteExceptionCopyWith<AppSqliteException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSqliteExceptionCopyWith<$Res> {
  factory $AppSqliteExceptionCopyWith(
          AppSqliteException value, $Res Function(AppSqliteException) then) =
      _$AppSqliteExceptionCopyWithImpl<$Res, AppSqliteException>;
  @useResult
  $Res call({String table, String database});
}

/// @nodoc
class _$AppSqliteExceptionCopyWithImpl<$Res, $Val extends AppSqliteException>
    implements $AppSqliteExceptionCopyWith<$Res> {
  _$AppSqliteExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table = null,
    Object? database = null,
  }) {
    return _then(_value.copyWith(
      table: null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      database: null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataNotInsertedInDbExceptionCopyWith<$Res>
    implements $AppSqliteExceptionCopyWith<$Res> {
  factory _$$DataNotInsertedInDbExceptionCopyWith(
          _$DataNotInsertedInDbException value,
          $Res Function(_$DataNotInsertedInDbException) then) =
      __$$DataNotInsertedInDbExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic object, String table, String database});
}

/// @nodoc
class __$$DataNotInsertedInDbExceptionCopyWithImpl<$Res>
    extends _$AppSqliteExceptionCopyWithImpl<$Res,
        _$DataNotInsertedInDbException>
    implements _$$DataNotInsertedInDbExceptionCopyWith<$Res> {
  __$$DataNotInsertedInDbExceptionCopyWithImpl(
      _$DataNotInsertedInDbException _value,
      $Res Function(_$DataNotInsertedInDbException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = freezed,
    Object? table = null,
    Object? database = null,
  }) {
    return _then(_$DataNotInsertedInDbException(
      freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as dynamic,
      null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataNotInsertedInDbException extends DataNotInsertedInDbException {
  const _$DataNotInsertedInDbException(this.object, this.table, this.database)
      : super._();

  @override
  final dynamic object;
  @override
  final String table;
  @override
  final String database;

  @override
  String toString() {
    return 'AppSqliteException.dataNotInserted(object: $object, table: $table, database: $database)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataNotInsertedInDbException &&
            const DeepCollectionEquality().equals(other.object, object) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.database, database) ||
                other.database == database));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(object), table, database);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataNotInsertedInDbExceptionCopyWith<_$DataNotInsertedInDbException>
      get copyWith => __$$DataNotInsertedInDbExceptionCopyWithImpl<
          _$DataNotInsertedInDbException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic object, String table, String database)
        dataNotInserted,
    required TResult Function(dynamic object, String table, String database)
        dataNotDeleted,
    required TResult Function(dynamic object, String table, String database)
        dataNotFound,
    required TResult Function(dynamic object, String table, String database)
        dataNotUpdated,
    required TResult Function(String id, String table, String database)
        idNotFound,
  }) {
    return dataNotInserted(object, table, database);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic object, String table, String database)?
        dataNotInserted,
    TResult? Function(dynamic object, String table, String database)?
        dataNotDeleted,
    TResult? Function(dynamic object, String table, String database)?
        dataNotFound,
    TResult? Function(dynamic object, String table, String database)?
        dataNotUpdated,
    TResult? Function(String id, String table, String database)? idNotFound,
  }) {
    return dataNotInserted?.call(object, table, database);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic object, String table, String database)?
        dataNotInserted,
    TResult Function(dynamic object, String table, String database)?
        dataNotDeleted,
    TResult Function(dynamic object, String table, String database)?
        dataNotFound,
    TResult Function(dynamic object, String table, String database)?
        dataNotUpdated,
    TResult Function(String id, String table, String database)? idNotFound,
    required TResult orElse(),
  }) {
    if (dataNotInserted != null) {
      return dataNotInserted(object, table, database);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataNotInsertedInDbException value)
        dataNotInserted,
    required TResult Function(DataNotDeletedInDbException value) dataNotDeleted,
    required TResult Function(DataNotFoundInDbException value) dataNotFound,
    required TResult Function(DataNotUpdatedInDbException value) dataNotUpdated,
    required TResult Function(IdNotFoundException value) idNotFound,
  }) {
    return dataNotInserted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataNotInsertedInDbException value)? dataNotInserted,
    TResult? Function(DataNotDeletedInDbException value)? dataNotDeleted,
    TResult? Function(DataNotFoundInDbException value)? dataNotFound,
    TResult? Function(DataNotUpdatedInDbException value)? dataNotUpdated,
    TResult? Function(IdNotFoundException value)? idNotFound,
  }) {
    return dataNotInserted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataNotInsertedInDbException value)? dataNotInserted,
    TResult Function(DataNotDeletedInDbException value)? dataNotDeleted,
    TResult Function(DataNotFoundInDbException value)? dataNotFound,
    TResult Function(DataNotUpdatedInDbException value)? dataNotUpdated,
    TResult Function(IdNotFoundException value)? idNotFound,
    required TResult orElse(),
  }) {
    if (dataNotInserted != null) {
      return dataNotInserted(this);
    }
    return orElse();
  }
}

abstract class DataNotInsertedInDbException extends AppSqliteException {
  const factory DataNotInsertedInDbException(
          final dynamic object, final String table, final String database) =
      _$DataNotInsertedInDbException;
  const DataNotInsertedInDbException._() : super._();

  dynamic get object;
  @override
  String get table;
  @override
  String get database;
  @override
  @JsonKey(ignore: true)
  _$$DataNotInsertedInDbExceptionCopyWith<_$DataNotInsertedInDbException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataNotDeletedInDbExceptionCopyWith<$Res>
    implements $AppSqliteExceptionCopyWith<$Res> {
  factory _$$DataNotDeletedInDbExceptionCopyWith(
          _$DataNotDeletedInDbException value,
          $Res Function(_$DataNotDeletedInDbException) then) =
      __$$DataNotDeletedInDbExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic object, String table, String database});
}

/// @nodoc
class __$$DataNotDeletedInDbExceptionCopyWithImpl<$Res>
    extends _$AppSqliteExceptionCopyWithImpl<$Res,
        _$DataNotDeletedInDbException>
    implements _$$DataNotDeletedInDbExceptionCopyWith<$Res> {
  __$$DataNotDeletedInDbExceptionCopyWithImpl(
      _$DataNotDeletedInDbException _value,
      $Res Function(_$DataNotDeletedInDbException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = freezed,
    Object? table = null,
    Object? database = null,
  }) {
    return _then(_$DataNotDeletedInDbException(
      freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as dynamic,
      null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataNotDeletedInDbException extends DataNotDeletedInDbException {
  const _$DataNotDeletedInDbException(this.object, this.table, this.database)
      : super._();

  @override
  final dynamic object;
  @override
  final String table;
  @override
  final String database;

  @override
  String toString() {
    return 'AppSqliteException.dataNotDeleted(object: $object, table: $table, database: $database)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataNotDeletedInDbException &&
            const DeepCollectionEquality().equals(other.object, object) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.database, database) ||
                other.database == database));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(object), table, database);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataNotDeletedInDbExceptionCopyWith<_$DataNotDeletedInDbException>
      get copyWith => __$$DataNotDeletedInDbExceptionCopyWithImpl<
          _$DataNotDeletedInDbException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic object, String table, String database)
        dataNotInserted,
    required TResult Function(dynamic object, String table, String database)
        dataNotDeleted,
    required TResult Function(dynamic object, String table, String database)
        dataNotFound,
    required TResult Function(dynamic object, String table, String database)
        dataNotUpdated,
    required TResult Function(String id, String table, String database)
        idNotFound,
  }) {
    return dataNotDeleted(object, table, database);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic object, String table, String database)?
        dataNotInserted,
    TResult? Function(dynamic object, String table, String database)?
        dataNotDeleted,
    TResult? Function(dynamic object, String table, String database)?
        dataNotFound,
    TResult? Function(dynamic object, String table, String database)?
        dataNotUpdated,
    TResult? Function(String id, String table, String database)? idNotFound,
  }) {
    return dataNotDeleted?.call(object, table, database);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic object, String table, String database)?
        dataNotInserted,
    TResult Function(dynamic object, String table, String database)?
        dataNotDeleted,
    TResult Function(dynamic object, String table, String database)?
        dataNotFound,
    TResult Function(dynamic object, String table, String database)?
        dataNotUpdated,
    TResult Function(String id, String table, String database)? idNotFound,
    required TResult orElse(),
  }) {
    if (dataNotDeleted != null) {
      return dataNotDeleted(object, table, database);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataNotInsertedInDbException value)
        dataNotInserted,
    required TResult Function(DataNotDeletedInDbException value) dataNotDeleted,
    required TResult Function(DataNotFoundInDbException value) dataNotFound,
    required TResult Function(DataNotUpdatedInDbException value) dataNotUpdated,
    required TResult Function(IdNotFoundException value) idNotFound,
  }) {
    return dataNotDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataNotInsertedInDbException value)? dataNotInserted,
    TResult? Function(DataNotDeletedInDbException value)? dataNotDeleted,
    TResult? Function(DataNotFoundInDbException value)? dataNotFound,
    TResult? Function(DataNotUpdatedInDbException value)? dataNotUpdated,
    TResult? Function(IdNotFoundException value)? idNotFound,
  }) {
    return dataNotDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataNotInsertedInDbException value)? dataNotInserted,
    TResult Function(DataNotDeletedInDbException value)? dataNotDeleted,
    TResult Function(DataNotFoundInDbException value)? dataNotFound,
    TResult Function(DataNotUpdatedInDbException value)? dataNotUpdated,
    TResult Function(IdNotFoundException value)? idNotFound,
    required TResult orElse(),
  }) {
    if (dataNotDeleted != null) {
      return dataNotDeleted(this);
    }
    return orElse();
  }
}

abstract class DataNotDeletedInDbException extends AppSqliteException {
  const factory DataNotDeletedInDbException(
          final dynamic object, final String table, final String database) =
      _$DataNotDeletedInDbException;
  const DataNotDeletedInDbException._() : super._();

  dynamic get object;
  @override
  String get table;
  @override
  String get database;
  @override
  @JsonKey(ignore: true)
  _$$DataNotDeletedInDbExceptionCopyWith<_$DataNotDeletedInDbException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataNotFoundInDbExceptionCopyWith<$Res>
    implements $AppSqliteExceptionCopyWith<$Res> {
  factory _$$DataNotFoundInDbExceptionCopyWith(
          _$DataNotFoundInDbException value,
          $Res Function(_$DataNotFoundInDbException) then) =
      __$$DataNotFoundInDbExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic object, String table, String database});
}

/// @nodoc
class __$$DataNotFoundInDbExceptionCopyWithImpl<$Res>
    extends _$AppSqliteExceptionCopyWithImpl<$Res, _$DataNotFoundInDbException>
    implements _$$DataNotFoundInDbExceptionCopyWith<$Res> {
  __$$DataNotFoundInDbExceptionCopyWithImpl(_$DataNotFoundInDbException _value,
      $Res Function(_$DataNotFoundInDbException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = freezed,
    Object? table = null,
    Object? database = null,
  }) {
    return _then(_$DataNotFoundInDbException(
      freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as dynamic,
      null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataNotFoundInDbException extends DataNotFoundInDbException {
  const _$DataNotFoundInDbException(this.object, this.table, this.database)
      : super._();

  @override
  final dynamic object;
  @override
  final String table;
  @override
  final String database;

  @override
  String toString() {
    return 'AppSqliteException.dataNotFound(object: $object, table: $table, database: $database)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataNotFoundInDbException &&
            const DeepCollectionEquality().equals(other.object, object) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.database, database) ||
                other.database == database));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(object), table, database);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataNotFoundInDbExceptionCopyWith<_$DataNotFoundInDbException>
      get copyWith => __$$DataNotFoundInDbExceptionCopyWithImpl<
          _$DataNotFoundInDbException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic object, String table, String database)
        dataNotInserted,
    required TResult Function(dynamic object, String table, String database)
        dataNotDeleted,
    required TResult Function(dynamic object, String table, String database)
        dataNotFound,
    required TResult Function(dynamic object, String table, String database)
        dataNotUpdated,
    required TResult Function(String id, String table, String database)
        idNotFound,
  }) {
    return dataNotFound(object, table, database);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic object, String table, String database)?
        dataNotInserted,
    TResult? Function(dynamic object, String table, String database)?
        dataNotDeleted,
    TResult? Function(dynamic object, String table, String database)?
        dataNotFound,
    TResult? Function(dynamic object, String table, String database)?
        dataNotUpdated,
    TResult? Function(String id, String table, String database)? idNotFound,
  }) {
    return dataNotFound?.call(object, table, database);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic object, String table, String database)?
        dataNotInserted,
    TResult Function(dynamic object, String table, String database)?
        dataNotDeleted,
    TResult Function(dynamic object, String table, String database)?
        dataNotFound,
    TResult Function(dynamic object, String table, String database)?
        dataNotUpdated,
    TResult Function(String id, String table, String database)? idNotFound,
    required TResult orElse(),
  }) {
    if (dataNotFound != null) {
      return dataNotFound(object, table, database);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataNotInsertedInDbException value)
        dataNotInserted,
    required TResult Function(DataNotDeletedInDbException value) dataNotDeleted,
    required TResult Function(DataNotFoundInDbException value) dataNotFound,
    required TResult Function(DataNotUpdatedInDbException value) dataNotUpdated,
    required TResult Function(IdNotFoundException value) idNotFound,
  }) {
    return dataNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataNotInsertedInDbException value)? dataNotInserted,
    TResult? Function(DataNotDeletedInDbException value)? dataNotDeleted,
    TResult? Function(DataNotFoundInDbException value)? dataNotFound,
    TResult? Function(DataNotUpdatedInDbException value)? dataNotUpdated,
    TResult? Function(IdNotFoundException value)? idNotFound,
  }) {
    return dataNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataNotInsertedInDbException value)? dataNotInserted,
    TResult Function(DataNotDeletedInDbException value)? dataNotDeleted,
    TResult Function(DataNotFoundInDbException value)? dataNotFound,
    TResult Function(DataNotUpdatedInDbException value)? dataNotUpdated,
    TResult Function(IdNotFoundException value)? idNotFound,
    required TResult orElse(),
  }) {
    if (dataNotFound != null) {
      return dataNotFound(this);
    }
    return orElse();
  }
}

abstract class DataNotFoundInDbException extends AppSqliteException {
  const factory DataNotFoundInDbException(
          final dynamic object, final String table, final String database) =
      _$DataNotFoundInDbException;
  const DataNotFoundInDbException._() : super._();

  dynamic get object;
  @override
  String get table;
  @override
  String get database;
  @override
  @JsonKey(ignore: true)
  _$$DataNotFoundInDbExceptionCopyWith<_$DataNotFoundInDbException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataNotUpdatedInDbExceptionCopyWith<$Res>
    implements $AppSqliteExceptionCopyWith<$Res> {
  factory _$$DataNotUpdatedInDbExceptionCopyWith(
          _$DataNotUpdatedInDbException value,
          $Res Function(_$DataNotUpdatedInDbException) then) =
      __$$DataNotUpdatedInDbExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic object, String table, String database});
}

/// @nodoc
class __$$DataNotUpdatedInDbExceptionCopyWithImpl<$Res>
    extends _$AppSqliteExceptionCopyWithImpl<$Res,
        _$DataNotUpdatedInDbException>
    implements _$$DataNotUpdatedInDbExceptionCopyWith<$Res> {
  __$$DataNotUpdatedInDbExceptionCopyWithImpl(
      _$DataNotUpdatedInDbException _value,
      $Res Function(_$DataNotUpdatedInDbException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = freezed,
    Object? table = null,
    Object? database = null,
  }) {
    return _then(_$DataNotUpdatedInDbException(
      freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as dynamic,
      null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataNotUpdatedInDbException extends DataNotUpdatedInDbException {
  const _$DataNotUpdatedInDbException(this.object, this.table, this.database)
      : super._();

  @override
  final dynamic object;
  @override
  final String table;
  @override
  final String database;

  @override
  String toString() {
    return 'AppSqliteException.dataNotUpdated(object: $object, table: $table, database: $database)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataNotUpdatedInDbException &&
            const DeepCollectionEquality().equals(other.object, object) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.database, database) ||
                other.database == database));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(object), table, database);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataNotUpdatedInDbExceptionCopyWith<_$DataNotUpdatedInDbException>
      get copyWith => __$$DataNotUpdatedInDbExceptionCopyWithImpl<
          _$DataNotUpdatedInDbException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic object, String table, String database)
        dataNotInserted,
    required TResult Function(dynamic object, String table, String database)
        dataNotDeleted,
    required TResult Function(dynamic object, String table, String database)
        dataNotFound,
    required TResult Function(dynamic object, String table, String database)
        dataNotUpdated,
    required TResult Function(String id, String table, String database)
        idNotFound,
  }) {
    return dataNotUpdated(object, table, database);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic object, String table, String database)?
        dataNotInserted,
    TResult? Function(dynamic object, String table, String database)?
        dataNotDeleted,
    TResult? Function(dynamic object, String table, String database)?
        dataNotFound,
    TResult? Function(dynamic object, String table, String database)?
        dataNotUpdated,
    TResult? Function(String id, String table, String database)? idNotFound,
  }) {
    return dataNotUpdated?.call(object, table, database);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic object, String table, String database)?
        dataNotInserted,
    TResult Function(dynamic object, String table, String database)?
        dataNotDeleted,
    TResult Function(dynamic object, String table, String database)?
        dataNotFound,
    TResult Function(dynamic object, String table, String database)?
        dataNotUpdated,
    TResult Function(String id, String table, String database)? idNotFound,
    required TResult orElse(),
  }) {
    if (dataNotUpdated != null) {
      return dataNotUpdated(object, table, database);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataNotInsertedInDbException value)
        dataNotInserted,
    required TResult Function(DataNotDeletedInDbException value) dataNotDeleted,
    required TResult Function(DataNotFoundInDbException value) dataNotFound,
    required TResult Function(DataNotUpdatedInDbException value) dataNotUpdated,
    required TResult Function(IdNotFoundException value) idNotFound,
  }) {
    return dataNotUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataNotInsertedInDbException value)? dataNotInserted,
    TResult? Function(DataNotDeletedInDbException value)? dataNotDeleted,
    TResult? Function(DataNotFoundInDbException value)? dataNotFound,
    TResult? Function(DataNotUpdatedInDbException value)? dataNotUpdated,
    TResult? Function(IdNotFoundException value)? idNotFound,
  }) {
    return dataNotUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataNotInsertedInDbException value)? dataNotInserted,
    TResult Function(DataNotDeletedInDbException value)? dataNotDeleted,
    TResult Function(DataNotFoundInDbException value)? dataNotFound,
    TResult Function(DataNotUpdatedInDbException value)? dataNotUpdated,
    TResult Function(IdNotFoundException value)? idNotFound,
    required TResult orElse(),
  }) {
    if (dataNotUpdated != null) {
      return dataNotUpdated(this);
    }
    return orElse();
  }
}

abstract class DataNotUpdatedInDbException extends AppSqliteException {
  const factory DataNotUpdatedInDbException(
          final dynamic object, final String table, final String database) =
      _$DataNotUpdatedInDbException;
  const DataNotUpdatedInDbException._() : super._();

  dynamic get object;
  @override
  String get table;
  @override
  String get database;
  @override
  @JsonKey(ignore: true)
  _$$DataNotUpdatedInDbExceptionCopyWith<_$DataNotUpdatedInDbException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IdNotFoundExceptionCopyWith<$Res>
    implements $AppSqliteExceptionCopyWith<$Res> {
  factory _$$IdNotFoundExceptionCopyWith(_$IdNotFoundException value,
          $Res Function(_$IdNotFoundException) then) =
      __$$IdNotFoundExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String table, String database});
}

/// @nodoc
class __$$IdNotFoundExceptionCopyWithImpl<$Res>
    extends _$AppSqliteExceptionCopyWithImpl<$Res, _$IdNotFoundException>
    implements _$$IdNotFoundExceptionCopyWith<$Res> {
  __$$IdNotFoundExceptionCopyWithImpl(
      _$IdNotFoundException _value, $Res Function(_$IdNotFoundException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? table = null,
    Object? database = null,
  }) {
    return _then(_$IdNotFoundException(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      null == database
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IdNotFoundException extends IdNotFoundException {
  const _$IdNotFoundException(this.id, this.table, this.database) : super._();

  @override
  final String id;
  @override
  final String table;
  @override
  final String database;

  @override
  String toString() {
    return 'AppSqliteException.idNotFound(id: $id, table: $table, database: $database)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdNotFoundException &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.database, database) ||
                other.database == database));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, table, database);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdNotFoundExceptionCopyWith<_$IdNotFoundException> get copyWith =>
      __$$IdNotFoundExceptionCopyWithImpl<_$IdNotFoundException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic object, String table, String database)
        dataNotInserted,
    required TResult Function(dynamic object, String table, String database)
        dataNotDeleted,
    required TResult Function(dynamic object, String table, String database)
        dataNotFound,
    required TResult Function(dynamic object, String table, String database)
        dataNotUpdated,
    required TResult Function(String id, String table, String database)
        idNotFound,
  }) {
    return idNotFound(id, table, database);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic object, String table, String database)?
        dataNotInserted,
    TResult? Function(dynamic object, String table, String database)?
        dataNotDeleted,
    TResult? Function(dynamic object, String table, String database)?
        dataNotFound,
    TResult? Function(dynamic object, String table, String database)?
        dataNotUpdated,
    TResult? Function(String id, String table, String database)? idNotFound,
  }) {
    return idNotFound?.call(id, table, database);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic object, String table, String database)?
        dataNotInserted,
    TResult Function(dynamic object, String table, String database)?
        dataNotDeleted,
    TResult Function(dynamic object, String table, String database)?
        dataNotFound,
    TResult Function(dynamic object, String table, String database)?
        dataNotUpdated,
    TResult Function(String id, String table, String database)? idNotFound,
    required TResult orElse(),
  }) {
    if (idNotFound != null) {
      return idNotFound(id, table, database);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataNotInsertedInDbException value)
        dataNotInserted,
    required TResult Function(DataNotDeletedInDbException value) dataNotDeleted,
    required TResult Function(DataNotFoundInDbException value) dataNotFound,
    required TResult Function(DataNotUpdatedInDbException value) dataNotUpdated,
    required TResult Function(IdNotFoundException value) idNotFound,
  }) {
    return idNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataNotInsertedInDbException value)? dataNotInserted,
    TResult? Function(DataNotDeletedInDbException value)? dataNotDeleted,
    TResult? Function(DataNotFoundInDbException value)? dataNotFound,
    TResult? Function(DataNotUpdatedInDbException value)? dataNotUpdated,
    TResult? Function(IdNotFoundException value)? idNotFound,
  }) {
    return idNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataNotInsertedInDbException value)? dataNotInserted,
    TResult Function(DataNotDeletedInDbException value)? dataNotDeleted,
    TResult Function(DataNotFoundInDbException value)? dataNotFound,
    TResult Function(DataNotUpdatedInDbException value)? dataNotUpdated,
    TResult Function(IdNotFoundException value)? idNotFound,
    required TResult orElse(),
  }) {
    if (idNotFound != null) {
      return idNotFound(this);
    }
    return orElse();
  }
}

abstract class IdNotFoundException extends AppSqliteException {
  const factory IdNotFoundException(
          final String id, final String table, final String database) =
      _$IdNotFoundException;
  const IdNotFoundException._() : super._();

  String get id;
  @override
  String get table;
  @override
  String get database;
  @override
  @JsonKey(ignore: true)
  _$$IdNotFoundExceptionCopyWith<_$IdNotFoundException> get copyWith =>
      throw _privateConstructorUsedError;
}
