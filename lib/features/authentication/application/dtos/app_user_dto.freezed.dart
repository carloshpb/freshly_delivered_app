// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppUserDto {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function(String id, String email, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)
        data,
    required TResult Function(String id, String email) simple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function(String id, String email, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)?
        data,
    TResult? Function(String id, String email)? simple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function(String id, String email, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)?
        data,
    TResult Function(String id, String email)? simple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotConnectedDto value) notConnected,
    required TResult Function(UserDataDto value) data,
    required TResult Function(UserSimpleDto value) simple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnectedDto value)? notConnected,
    TResult? Function(UserDataDto value)? data,
    TResult? Function(UserSimpleDto value)? simple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnectedDto value)? notConnected,
    TResult Function(UserDataDto value)? data,
    TResult Function(UserSimpleDto value)? simple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserDtoCopyWith<$Res> {
  factory $AppUserDtoCopyWith(
          AppUserDto value, $Res Function(AppUserDto) then) =
      _$AppUserDtoCopyWithImpl<$Res, AppUserDto>;
}

/// @nodoc
class _$AppUserDtoCopyWithImpl<$Res, $Val extends AppUserDto>
    implements $AppUserDtoCopyWith<$Res> {
  _$AppUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserNotConnectedDtoCopyWith<$Res> {
  factory _$$UserNotConnectedDtoCopyWith(_$UserNotConnectedDto value,
          $Res Function(_$UserNotConnectedDto) then) =
      __$$UserNotConnectedDtoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNotConnectedDtoCopyWithImpl<$Res>
    extends _$AppUserDtoCopyWithImpl<$Res, _$UserNotConnectedDto>
    implements _$$UserNotConnectedDtoCopyWith<$Res> {
  __$$UserNotConnectedDtoCopyWithImpl(
      _$UserNotConnectedDto _value, $Res Function(_$UserNotConnectedDto) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserNotConnectedDto extends UserNotConnectedDto {
  const _$UserNotConnectedDto() : super._();

  @override
  String toString() {
    return 'AppUserDto.notConnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserNotConnectedDto);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function(String id, String email, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)
        data,
    required TResult Function(String id, String email) simple,
  }) {
    return notConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function(String id, String email, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)?
        data,
    TResult? Function(String id, String email)? simple,
  }) {
    return notConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function(String id, String email, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)?
        data,
    TResult Function(String id, String email)? simple,
    required TResult orElse(),
  }) {
    if (notConnected != null) {
      return notConnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotConnectedDto value) notConnected,
    required TResult Function(UserDataDto value) data,
    required TResult Function(UserSimpleDto value) simple,
  }) {
    return notConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnectedDto value)? notConnected,
    TResult? Function(UserDataDto value)? data,
    TResult? Function(UserSimpleDto value)? simple,
  }) {
    return notConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnectedDto value)? notConnected,
    TResult Function(UserDataDto value)? data,
    TResult Function(UserSimpleDto value)? simple,
    required TResult orElse(),
  }) {
    if (notConnected != null) {
      return notConnected(this);
    }
    return orElse();
  }
}

abstract class UserNotConnectedDto extends AppUserDto {
  const factory UserNotConnectedDto() = _$UserNotConnectedDto;
  const UserNotConnectedDto._() : super._();
}

/// @nodoc
abstract class _$$UserDataDtoCopyWith<$Res> {
  factory _$$UserDataDtoCopyWith(
          _$UserDataDto value, $Res Function(_$UserDataDto) then) =
      __$$UserDataDtoCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String id,
      String email,
      String fullname,
      String phoneNumber,
      DateTime? createdAt,
      DateTime? modifiedAt});
}

/// @nodoc
class __$$UserDataDtoCopyWithImpl<$Res>
    extends _$AppUserDtoCopyWithImpl<$Res, _$UserDataDto>
    implements _$$UserDataDtoCopyWith<$Res> {
  __$$UserDataDtoCopyWithImpl(
      _$UserDataDto _value, $Res Function(_$UserDataDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullname = null,
    Object? phoneNumber = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_$UserDataDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$UserDataDto extends UserDataDto {
  const _$UserDataDto(
      {required this.id,
      required this.email,
      required this.fullname,
      required this.phoneNumber,
      this.createdAt,
      this.modifiedAt})
      : assert(id != "", 'id cannot be empty'),
        assert(email != "", 'id cannot be empty'),
        assert(fullname != "", 'id cannot be empty'),
        assert(phoneNumber != "", 'id cannot be empty'),
        super._();

  @override
  final String id;
  @override
  final String email;
  @override
  final String fullname;
  @override
  final String phoneNumber;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? modifiedAt;

  @override
  String toString() {
    return 'AppUserDto.data(id: $id, email: $email, fullname: $fullname, phoneNumber: $phoneNumber, createdAt: $createdAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, fullname, phoneNumber, createdAt, modifiedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataDtoCopyWith<_$UserDataDto> get copyWith =>
      __$$UserDataDtoCopyWithImpl<_$UserDataDto>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function(String id, String email, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)
        data,
    required TResult Function(String id, String email) simple,
  }) {
    return data(id, email, fullname, phoneNumber, createdAt, modifiedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function(String id, String email, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)?
        data,
    TResult? Function(String id, String email)? simple,
  }) {
    return data?.call(id, email, fullname, phoneNumber, createdAt, modifiedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function(String id, String email, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)?
        data,
    TResult Function(String id, String email)? simple,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(id, email, fullname, phoneNumber, createdAt, modifiedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotConnectedDto value) notConnected,
    required TResult Function(UserDataDto value) data,
    required TResult Function(UserSimpleDto value) simple,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnectedDto value)? notConnected,
    TResult? Function(UserDataDto value)? data,
    TResult? Function(UserSimpleDto value)? simple,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnectedDto value)? notConnected,
    TResult Function(UserDataDto value)? data,
    TResult Function(UserSimpleDto value)? simple,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class UserDataDto extends AppUserDto {
  const factory UserDataDto(
      {required final String id,
      required final String email,
      required final String fullname,
      required final String phoneNumber,
      final DateTime? createdAt,
      final DateTime? modifiedAt}) = _$UserDataDto;
  const UserDataDto._() : super._();

  String get id;
  String get email;
  String get fullname;
  String get phoneNumber;
  DateTime? get createdAt;
  DateTime? get modifiedAt;
  @JsonKey(ignore: true)
  _$$UserDataDtoCopyWith<_$UserDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserSimpleDtoCopyWith<$Res> {
  factory _$$UserSimpleDtoCopyWith(
          _$UserSimpleDto value, $Res Function(_$UserSimpleDto) then) =
      __$$UserSimpleDtoCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, String email});
}

/// @nodoc
class __$$UserSimpleDtoCopyWithImpl<$Res>
    extends _$AppUserDtoCopyWithImpl<$Res, _$UserSimpleDto>
    implements _$$UserSimpleDtoCopyWith<$Res> {
  __$$UserSimpleDtoCopyWithImpl(
      _$UserSimpleDto _value, $Res Function(_$UserSimpleDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
  }) {
    return _then(_$UserSimpleDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserSimpleDto extends UserSimpleDto {
  const _$UserSimpleDto({required this.id, required this.email})
      : assert(id != "", 'id cannot be empty'),
        assert(email != "", 'id cannot be empty'),
        super._();

  @override
  final String id;
  @override
  final String email;

  @override
  String toString() {
    return 'AppUserDto.simple(id: $id, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSimpleDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSimpleDtoCopyWith<_$UserSimpleDto> get copyWith =>
      __$$UserSimpleDtoCopyWithImpl<_$UserSimpleDto>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function(String id, String email, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)
        data,
    required TResult Function(String id, String email) simple,
  }) {
    return simple(id, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function(String id, String email, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)?
        data,
    TResult? Function(String id, String email)? simple,
  }) {
    return simple?.call(id, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function(String id, String email, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)?
        data,
    TResult Function(String id, String email)? simple,
    required TResult orElse(),
  }) {
    if (simple != null) {
      return simple(id, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotConnectedDto value) notConnected,
    required TResult Function(UserDataDto value) data,
    required TResult Function(UserSimpleDto value) simple,
  }) {
    return simple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnectedDto value)? notConnected,
    TResult? Function(UserDataDto value)? data,
    TResult? Function(UserSimpleDto value)? simple,
  }) {
    return simple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnectedDto value)? notConnected,
    TResult Function(UserDataDto value)? data,
    TResult Function(UserSimpleDto value)? simple,
    required TResult orElse(),
  }) {
    if (simple != null) {
      return simple(this);
    }
    return orElse();
  }
}

abstract class UserSimpleDto extends AppUserDto {
  const factory UserSimpleDto(
      {required final String id,
      required final String email}) = _$UserSimpleDto;
  const UserSimpleDto._() : super._();

  String get id;
  String get email;
  @JsonKey(ignore: true)
  _$$UserSimpleDtoCopyWith<_$UserSimpleDto> get copyWith =>
      throw _privateConstructorUsedError;
}
