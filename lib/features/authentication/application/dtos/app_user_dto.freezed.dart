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
mixin _$AppUserDTO {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function(
            String uid,
            String email,
            String password,
            String fullname,
            String phoneNumber,
            DateTime? createdAt,
            DateTime? modifiedAt)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function(
            String uid,
            String email,
            String password,
            String fullname,
            String phoneNumber,
            DateTime? createdAt,
            DateTime? modifiedAt)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function(String uid, String email, String password, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotConnectedDTO value) notConnected,
    required TResult Function(UserDataDTO value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnectedDTO value)? notConnected,
    TResult? Function(UserDataDTO value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnectedDTO value)? notConnected,
    TResult Function(UserDataDTO value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserDTOCopyWith<$Res> {
  factory $AppUserDTOCopyWith(
          AppUserDTO value, $Res Function(AppUserDTO) then) =
      _$AppUserDTOCopyWithImpl<$Res, AppUserDTO>;
}

/// @nodoc
class _$AppUserDTOCopyWithImpl<$Res, $Val extends AppUserDTO>
    implements $AppUserDTOCopyWith<$Res> {
  _$AppUserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserNotConnectedDTOCopyWith<$Res> {
  factory _$$UserNotConnectedDTOCopyWith(_$UserNotConnectedDTO value,
          $Res Function(_$UserNotConnectedDTO) then) =
      __$$UserNotConnectedDTOCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNotConnectedDTOCopyWithImpl<$Res>
    extends _$AppUserDTOCopyWithImpl<$Res, _$UserNotConnectedDTO>
    implements _$$UserNotConnectedDTOCopyWith<$Res> {
  __$$UserNotConnectedDTOCopyWithImpl(
      _$UserNotConnectedDTO _value, $Res Function(_$UserNotConnectedDTO) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserNotConnectedDTO implements UserNotConnectedDTO {
  const _$UserNotConnectedDTO();

  @override
  String toString() {
    return 'AppUserDTO.notConnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserNotConnectedDTO);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function(
            String uid,
            String email,
            String password,
            String fullname,
            String phoneNumber,
            DateTime? createdAt,
            DateTime? modifiedAt)
        data,
  }) {
    return notConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function(
            String uid,
            String email,
            String password,
            String fullname,
            String phoneNumber,
            DateTime? createdAt,
            DateTime? modifiedAt)?
        data,
  }) {
    return notConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function(String uid, String email, String password, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)?
        data,
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
    required TResult Function(UserNotConnectedDTO value) notConnected,
    required TResult Function(UserDataDTO value) data,
  }) {
    return notConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnectedDTO value)? notConnected,
    TResult? Function(UserDataDTO value)? data,
  }) {
    return notConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnectedDTO value)? notConnected,
    TResult Function(UserDataDTO value)? data,
    required TResult orElse(),
  }) {
    if (notConnected != null) {
      return notConnected(this);
    }
    return orElse();
  }
}

abstract class UserNotConnectedDTO implements AppUserDTO {
  const factory UserNotConnectedDTO() = _$UserNotConnectedDTO;
}

/// @nodoc
abstract class _$$UserDataDTOCopyWith<$Res> {
  factory _$$UserDataDTOCopyWith(
          _$UserDataDTO value, $Res Function(_$UserDataDTO) then) =
      __$$UserDataDTOCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String password,
      String fullname,
      String phoneNumber,
      DateTime? createdAt,
      DateTime? modifiedAt});
}

/// @nodoc
class __$$UserDataDTOCopyWithImpl<$Res>
    extends _$AppUserDTOCopyWithImpl<$Res, _$UserDataDTO>
    implements _$$UserDataDTOCopyWith<$Res> {
  __$$UserDataDTOCopyWithImpl(
      _$UserDataDTO _value, $Res Function(_$UserDataDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? password = null,
    Object? fullname = null,
    Object? phoneNumber = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_$UserDataDTO(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
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

class _$UserDataDTO implements UserDataDTO {
  const _$UserDataDTO(
      {required this.uid,
      required this.email,
      required this.password,
      required this.fullname,
      required this.phoneNumber,
      this.createdAt,
      this.modifiedAt});

  @override
  final String uid;
  @override
  final String email;
  @override
  final String password;
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
    return 'AppUserDTO.data(uid: $uid, email: $email, password: $password, fullname: $fullname, phoneNumber: $phoneNumber, createdAt: $createdAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataDTO &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
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
  int get hashCode => Object.hash(runtimeType, uid, email, password, fullname,
      phoneNumber, createdAt, modifiedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataDTOCopyWith<_$UserDataDTO> get copyWith =>
      __$$UserDataDTOCopyWithImpl<_$UserDataDTO>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function(
            String uid,
            String email,
            String password,
            String fullname,
            String phoneNumber,
            DateTime? createdAt,
            DateTime? modifiedAt)
        data,
  }) {
    return data(
        uid, email, password, fullname, phoneNumber, createdAt, modifiedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function(
            String uid,
            String email,
            String password,
            String fullname,
            String phoneNumber,
            DateTime? createdAt,
            DateTime? modifiedAt)?
        data,
  }) {
    return data?.call(
        uid, email, password, fullname, phoneNumber, createdAt, modifiedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function(String uid, String email, String password, String fullname,
            String phoneNumber, DateTime? createdAt, DateTime? modifiedAt)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(
          uid, email, password, fullname, phoneNumber, createdAt, modifiedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotConnectedDTO value) notConnected,
    required TResult Function(UserDataDTO value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnectedDTO value)? notConnected,
    TResult? Function(UserDataDTO value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnectedDTO value)? notConnected,
    TResult Function(UserDataDTO value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class UserDataDTO implements AppUserDTO {
  const factory UserDataDTO(
      {required final String uid,
      required final String email,
      required final String password,
      required final String fullname,
      required final String phoneNumber,
      final DateTime? createdAt,
      final DateTime? modifiedAt}) = _$UserDataDTO;

  String get uid;
  String get email;
  String get password;
  String get fullname;
  String get phoneNumber;
  DateTime? get createdAt;
  DateTime? get modifiedAt;
  @JsonKey(ignore: true)
  _$$UserDataDTOCopyWith<_$UserDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
