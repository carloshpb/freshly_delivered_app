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
    case 'notConnected':
      return UserNotConnected.fromJson(json);
    case 'connecting':
      return UserConnecting.fromJson(json);
    case 'data':
      return UserData.fromJson(json);
    case 'noPersonalData':
      return UserNoPersonalData.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AppUser',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AppUser {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function() connecting,
    required TResult Function(String uid, String email, String password,
            String fullname, String phoneNumber)
        data,
    required TResult Function(String uid, String email) noPersonalData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function()? connecting,
    TResult? Function(String uid, String email, String password,
            String fullname, String phoneNumber)?
        data,
    TResult? Function(String uid, String email)? noPersonalData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function()? connecting,
    TResult Function(String uid, String email, String password, String fullname,
            String phoneNumber)?
        data,
    TResult Function(String uid, String email)? noPersonalData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotConnected value) notConnected,
    required TResult Function(UserConnecting value) connecting,
    required TResult Function(UserData value) data,
    required TResult Function(UserNoPersonalData value) noPersonalData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnected value)? notConnected,
    TResult? Function(UserConnecting value)? connecting,
    TResult? Function(UserData value)? data,
    TResult? Function(UserNoPersonalData value)? noPersonalData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnected value)? notConnected,
    TResult Function(UserConnecting value)? connecting,
    TResult Function(UserData value)? data,
    TResult Function(UserNoPersonalData value)? noPersonalData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserNotConnectedCopyWith<$Res> {
  factory _$$UserNotConnectedCopyWith(
          _$UserNotConnected value, $Res Function(_$UserNotConnected) then) =
      __$$UserNotConnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNotConnectedCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$UserNotConnected>
    implements _$$UserNotConnectedCopyWith<$Res> {
  __$$UserNotConnectedCopyWithImpl(
      _$UserNotConnected _value, $Res Function(_$UserNotConnected) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$UserNotConnected implements UserNotConnected {
  const _$UserNotConnected({final String? $type})
      : $type = $type ?? 'notConnected';

  factory _$UserNotConnected.fromJson(Map<String, dynamic> json) =>
      _$$UserNotConnectedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUser.notConnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserNotConnected);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function() connecting,
    required TResult Function(String uid, String email, String password,
            String fullname, String phoneNumber)
        data,
    required TResult Function(String uid, String email) noPersonalData,
  }) {
    return notConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function()? connecting,
    TResult? Function(String uid, String email, String password,
            String fullname, String phoneNumber)?
        data,
    TResult? Function(String uid, String email)? noPersonalData,
  }) {
    return notConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function()? connecting,
    TResult Function(String uid, String email, String password, String fullname,
            String phoneNumber)?
        data,
    TResult Function(String uid, String email)? noPersonalData,
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
    required TResult Function(UserNotConnected value) notConnected,
    required TResult Function(UserConnecting value) connecting,
    required TResult Function(UserData value) data,
    required TResult Function(UserNoPersonalData value) noPersonalData,
  }) {
    return notConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnected value)? notConnected,
    TResult? Function(UserConnecting value)? connecting,
    TResult? Function(UserData value)? data,
    TResult? Function(UserNoPersonalData value)? noPersonalData,
  }) {
    return notConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnected value)? notConnected,
    TResult Function(UserConnecting value)? connecting,
    TResult Function(UserData value)? data,
    TResult Function(UserNoPersonalData value)? noPersonalData,
    required TResult orElse(),
  }) {
    if (notConnected != null) {
      return notConnected(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserNotConnectedToJson(
      this,
    );
  }
}

abstract class UserNotConnected implements AppUser {
  const factory UserNotConnected() = _$UserNotConnected;

  factory UserNotConnected.fromJson(Map<String, dynamic> json) =
      _$UserNotConnected.fromJson;
}

/// @nodoc
abstract class _$$UserConnectingCopyWith<$Res> {
  factory _$$UserConnectingCopyWith(
          _$UserConnecting value, $Res Function(_$UserConnecting) then) =
      __$$UserConnectingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserConnectingCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$UserConnecting>
    implements _$$UserConnectingCopyWith<$Res> {
  __$$UserConnectingCopyWithImpl(
      _$UserConnecting _value, $Res Function(_$UserConnecting) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$UserConnecting implements UserConnecting {
  const _$UserConnecting({final String? $type}) : $type = $type ?? 'connecting';

  factory _$UserConnecting.fromJson(Map<String, dynamic> json) =>
      _$$UserConnectingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUser.connecting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserConnecting);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function() connecting,
    required TResult Function(String uid, String email, String password,
            String fullname, String phoneNumber)
        data,
    required TResult Function(String uid, String email) noPersonalData,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function()? connecting,
    TResult? Function(String uid, String email, String password,
            String fullname, String phoneNumber)?
        data,
    TResult? Function(String uid, String email)? noPersonalData,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function()? connecting,
    TResult Function(String uid, String email, String password, String fullname,
            String phoneNumber)?
        data,
    TResult Function(String uid, String email)? noPersonalData,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotConnected value) notConnected,
    required TResult Function(UserConnecting value) connecting,
    required TResult Function(UserData value) data,
    required TResult Function(UserNoPersonalData value) noPersonalData,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnected value)? notConnected,
    TResult? Function(UserConnecting value)? connecting,
    TResult? Function(UserData value)? data,
    TResult? Function(UserNoPersonalData value)? noPersonalData,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnected value)? notConnected,
    TResult Function(UserConnecting value)? connecting,
    TResult Function(UserData value)? data,
    TResult Function(UserNoPersonalData value)? noPersonalData,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserConnectingToJson(
      this,
    );
  }
}

abstract class UserConnecting implements AppUser {
  const factory UserConnecting() = _$UserConnecting;

  factory UserConnecting.fromJson(Map<String, dynamic> json) =
      _$UserConnecting.fromJson;
}

/// @nodoc
abstract class _$$UserDataCopyWith<$Res> {
  factory _$$UserDataCopyWith(
          _$UserData value, $Res Function(_$UserData) then) =
      __$$UserDataCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String password,
      String fullname,
      String phoneNumber});
}

/// @nodoc
class __$$UserDataCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$UserData>
    implements _$$UserDataCopyWith<$Res> {
  __$$UserDataCopyWithImpl(_$UserData _value, $Res Function(_$UserData) _then)
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
    return _then(_$UserData(
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
class _$UserData implements UserData {
  const _$UserData(
      {required this.uid,
      required this.email,
      required this.password,
      required this.fullname,
      required this.phoneNumber,
      final String? $type})
      : $type = $type ?? 'data';

  factory _$UserData.fromJson(Map<String, dynamic> json) =>
      _$$UserDataFromJson(json);

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
    return 'AppUser.data(uid: $uid, email: $email, password: $password, fullname: $fullname, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserData &&
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
  _$$UserDataCopyWith<_$UserData> get copyWith =>
      __$$UserDataCopyWithImpl<_$UserData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function() connecting,
    required TResult Function(String uid, String email, String password,
            String fullname, String phoneNumber)
        data,
    required TResult Function(String uid, String email) noPersonalData,
  }) {
    return data(uid, email, password, fullname, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function()? connecting,
    TResult? Function(String uid, String email, String password,
            String fullname, String phoneNumber)?
        data,
    TResult? Function(String uid, String email)? noPersonalData,
  }) {
    return data?.call(uid, email, password, fullname, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function()? connecting,
    TResult Function(String uid, String email, String password, String fullname,
            String phoneNumber)?
        data,
    TResult Function(String uid, String email)? noPersonalData,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(uid, email, password, fullname, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotConnected value) notConnected,
    required TResult Function(UserConnecting value) connecting,
    required TResult Function(UserData value) data,
    required TResult Function(UserNoPersonalData value) noPersonalData,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnected value)? notConnected,
    TResult? Function(UserConnecting value)? connecting,
    TResult? Function(UserData value)? data,
    TResult? Function(UserNoPersonalData value)? noPersonalData,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnected value)? notConnected,
    TResult Function(UserConnecting value)? connecting,
    TResult Function(UserData value)? data,
    TResult Function(UserNoPersonalData value)? noPersonalData,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataToJson(
      this,
    );
  }
}

abstract class UserData implements AppUser {
  const factory UserData(
      {required final String uid,
      required final String email,
      required final String password,
      required final String fullname,
      required final String phoneNumber}) = _$UserData;

  factory UserData.fromJson(Map<String, dynamic> json) = _$UserData.fromJson;

  String get uid;
  String get email;
  String get password;
  String get fullname;
  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$UserDataCopyWith<_$UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserNoPersonalDataCopyWith<$Res> {
  factory _$$UserNoPersonalDataCopyWith(_$UserNoPersonalData value,
          $Res Function(_$UserNoPersonalData) then) =
      __$$UserNoPersonalDataCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid, String email});
}

/// @nodoc
class __$$UserNoPersonalDataCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$UserNoPersonalData>
    implements _$$UserNoPersonalDataCopyWith<$Res> {
  __$$UserNoPersonalDataCopyWithImpl(
      _$UserNoPersonalData _value, $Res Function(_$UserNoPersonalData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
  }) {
    return _then(_$UserNoPersonalData(
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
class _$UserNoPersonalData implements UserNoPersonalData {
  const _$UserNoPersonalData(
      {required this.uid, required this.email, final String? $type})
      : $type = $type ?? 'noPersonalData';

  factory _$UserNoPersonalData.fromJson(Map<String, dynamic> json) =>
      _$$UserNoPersonalDataFromJson(json);

  @override
  final String uid;
  @override
  final String email;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUser.noPersonalData(uid: $uid, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNoPersonalData &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNoPersonalDataCopyWith<_$UserNoPersonalData> get copyWith =>
      __$$UserNoPersonalDataCopyWithImpl<_$UserNoPersonalData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function() connecting,
    required TResult Function(String uid, String email, String password,
            String fullname, String phoneNumber)
        data,
    required TResult Function(String uid, String email) noPersonalData,
  }) {
    return noPersonalData(uid, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function()? connecting,
    TResult? Function(String uid, String email, String password,
            String fullname, String phoneNumber)?
        data,
    TResult? Function(String uid, String email)? noPersonalData,
  }) {
    return noPersonalData?.call(uid, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function()? connecting,
    TResult Function(String uid, String email, String password, String fullname,
            String phoneNumber)?
        data,
    TResult Function(String uid, String email)? noPersonalData,
    required TResult orElse(),
  }) {
    if (noPersonalData != null) {
      return noPersonalData(uid, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotConnected value) notConnected,
    required TResult Function(UserConnecting value) connecting,
    required TResult Function(UserData value) data,
    required TResult Function(UserNoPersonalData value) noPersonalData,
  }) {
    return noPersonalData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnected value)? notConnected,
    TResult? Function(UserConnecting value)? connecting,
    TResult? Function(UserData value)? data,
    TResult? Function(UserNoPersonalData value)? noPersonalData,
  }) {
    return noPersonalData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnected value)? notConnected,
    TResult Function(UserConnecting value)? connecting,
    TResult Function(UserData value)? data,
    TResult Function(UserNoPersonalData value)? noPersonalData,
    required TResult orElse(),
  }) {
    if (noPersonalData != null) {
      return noPersonalData(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserNoPersonalDataToJson(
      this,
    );
  }
}

abstract class UserNoPersonalData implements AppUser {
  const factory UserNoPersonalData(
      {required final String uid,
      required final String email}) = _$UserNoPersonalData;

  factory UserNoPersonalData.fromJson(Map<String, dynamic> json) =
      _$UserNoPersonalData.fromJson;

  String get uid;
  String get email;
  @JsonKey(ignore: true)
  _$$UserNoPersonalDataCopyWith<_$UserNoPersonalData> get copyWith =>
      throw _privateConstructorUsedError;
}
