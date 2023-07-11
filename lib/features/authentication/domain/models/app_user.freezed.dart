// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _AppUser.fromJson(json);
    case 'fakeBack':
      return FakeAppUser.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AppUser',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AppUser {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String uid, String email) $default, {
    required TResult Function(String uid, String email, String password,
            String fullname, String phoneNumber)
        fakeBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String uid, String email)? $default, {
    TResult? Function(String uid, String email, String password,
            String fullname, String phoneNumber)?
        fakeBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String uid, String email)? $default, {
    TResult Function(String uid, String email, String password, String fullname,
            String phoneNumber)?
        fakeBack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppUser value) $default, {
    required TResult Function(FakeAppUser value) fakeBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppUser value)? $default, {
    TResult? Function(FakeAppUser value)? fakeBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppUser value)? $default, {
    TResult Function(FakeAppUser value)? fakeBack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call({String uid, String email});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String email});
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$_AppUser>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
  }) {
    return _then(_$_AppUser(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser implements _AppUser {
  const _$_AppUser(
      {required this.uid, required this.email, final String? $type})
      : $type = $type ?? 'default';

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  final String uid;
  @override
  final String email;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUser(uid: $uid, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String uid, String email) $default, {
    required TResult Function(String uid, String email, String password,
            String fullname, String phoneNumber)
        fakeBack,
  }) {
    return $default(uid, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String uid, String email)? $default, {
    TResult? Function(String uid, String email, String password,
            String fullname, String phoneNumber)?
        fakeBack,
  }) {
    return $default?.call(uid, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String uid, String email)? $default, {
    TResult Function(String uid, String email, String password, String fullname,
            String phoneNumber)?
        fakeBack,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(uid, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppUser value) $default, {
    required TResult Function(FakeAppUser value) fakeBack,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppUser value)? $default, {
    TResult? Function(FakeAppUser value)? fakeBack,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppUser value)? $default, {
    TResult Function(FakeAppUser value)? fakeBack,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {required final String uid, required final String email}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FakeAppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$FakeAppUserCopyWith(
          _$FakeAppUser value, $Res Function(_$FakeAppUser) then) =
      __$$FakeAppUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String password,
      String fullname,
      String phoneNumber});
}

/// @nodoc
class __$$FakeAppUserCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$FakeAppUser>
    implements _$$FakeAppUserCopyWith<$Res> {
  __$$FakeAppUserCopyWithImpl(
      _$FakeAppUser _value, $Res Function(_$FakeAppUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? password = null,
    Object? fullname = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$FakeAppUser(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FakeAppUser implements FakeAppUser {
  const _$FakeAppUser(
      {required this.uid,
      required this.email,
      required this.password,
      required this.fullname,
      required this.phoneNumber,
      final String? $type})
      : $type = $type ?? 'fakeBack';

  factory _$FakeAppUser.fromJson(Map<String, dynamic> json) =>
      _$$FakeAppUserFromJson(json);

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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUser.fakeBack(uid: $uid, email: $email, password: $password, fullname: $fullname, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FakeAppUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, email, password, fullname, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FakeAppUserCopyWith<_$FakeAppUser> get copyWith =>
      __$$FakeAppUserCopyWithImpl<_$FakeAppUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String uid, String email) $default, {
    required TResult Function(String uid, String email, String password,
            String fullname, String phoneNumber)
        fakeBack,
  }) {
    return fakeBack(uid, email, password, fullname, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String uid, String email)? $default, {
    TResult? Function(String uid, String email, String password,
            String fullname, String phoneNumber)?
        fakeBack,
  }) {
    return fakeBack?.call(uid, email, password, fullname, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String uid, String email)? $default, {
    TResult Function(String uid, String email, String password, String fullname,
            String phoneNumber)?
        fakeBack,
    required TResult orElse(),
  }) {
    if (fakeBack != null) {
      return fakeBack(uid, email, password, fullname, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppUser value) $default, {
    required TResult Function(FakeAppUser value) fakeBack,
  }) {
    return fakeBack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppUser value)? $default, {
    TResult? Function(FakeAppUser value)? fakeBack,
  }) {
    return fakeBack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppUser value)? $default, {
    TResult Function(FakeAppUser value)? fakeBack,
    required TResult orElse(),
  }) {
    if (fakeBack != null) {
      return fakeBack(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FakeAppUserToJson(
      this,
    );
  }
}

abstract class FakeAppUser implements AppUser {
  const factory FakeAppUser(
      {required final String uid,
      required final String email,
      required final String password,
      required final String fullname,
      required final String phoneNumber}) = _$FakeAppUser;

  factory FakeAppUser.fromJson(Map<String, dynamic> json) =
      _$FakeAppUser.fromJson;

  @override
  String get uid;
  @override
  String get email;
  String get password;
  String get fullname;
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$FakeAppUserCopyWith<_$FakeAppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
