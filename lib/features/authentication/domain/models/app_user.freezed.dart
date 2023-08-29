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
    case 'data':
      return UserData.fromJson(json);
    case 'simple':
      return UserSimple.fromJson(json);

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
    required TResult Function(
            String id,
            String email,
            String password,
            String fullname,
            @JsonKey(name: 'phone_number') String phoneNumber,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)
        data,
    required TResult Function(String id, String email) simple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function(
            String id,
            String email,
            String password,
            String fullname,
            @JsonKey(name: 'phone_number') String phoneNumber,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        data,
    TResult? Function(String id, String email)? simple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function(
            String id,
            String email,
            String password,
            String fullname,
            @JsonKey(name: 'phone_number') String phoneNumber,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        data,
    TResult Function(String id, String email)? simple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotConnected value) notConnected,
    required TResult Function(UserData value) data,
    required TResult Function(UserSimple value) simple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnected value)? notConnected,
    TResult? Function(UserData value)? data,
    TResult? Function(UserSimple value)? simple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnected value)? notConnected,
    TResult Function(UserData value)? data,
    TResult Function(UserSimple value)? simple,
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
class _$UserNotConnected extends UserNotConnected {
  const _$UserNotConnected({final String? $type})
      : $type = $type ?? 'notConnected',
        super._();

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
    required TResult Function(
            String id,
            String email,
            String password,
            String fullname,
            @JsonKey(name: 'phone_number') String phoneNumber,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)
        data,
    required TResult Function(String id, String email) simple,
  }) {
    return notConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function(
            String id,
            String email,
            String password,
            String fullname,
            @JsonKey(name: 'phone_number') String phoneNumber,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        data,
    TResult? Function(String id, String email)? simple,
  }) {
    return notConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function(
            String id,
            String email,
            String password,
            String fullname,
            @JsonKey(name: 'phone_number') String phoneNumber,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
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
    required TResult Function(UserNotConnected value) notConnected,
    required TResult Function(UserData value) data,
    required TResult Function(UserSimple value) simple,
  }) {
    return notConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnected value)? notConnected,
    TResult? Function(UserData value)? data,
    TResult? Function(UserSimple value)? simple,
  }) {
    return notConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnected value)? notConnected,
    TResult Function(UserData value)? data,
    TResult Function(UserSimple value)? simple,
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

abstract class UserNotConnected extends AppUser {
  const factory UserNotConnected() = _$UserNotConnected;
  const UserNotConnected._() : super._();

  factory UserNotConnected.fromJson(Map<String, dynamic> json) =
      _$UserNotConnected.fromJson;
}

/// @nodoc
abstract class _$$UserDataCopyWith<$Res> {
  factory _$$UserDataCopyWith(
          _$UserData value, $Res Function(_$UserData) then) =
      __$$UserDataCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String id,
      String email,
      String password,
      String fullname,
      @JsonKey(name: 'phone_number') String phoneNumber,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'created_at')
      DateTime? createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      DateTime? modifiedAt});
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
    Object? id = null,
    Object? email = null,
    Object? password = null,
    Object? fullname = null,
    Object? phoneNumber = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_$UserData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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

@JsonSerializable(explicitToJson: true)
class _$UserData extends UserData {
  const _$UserData(
      {required this.id,
      required this.email,
      required this.password,
      required this.fullname,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      @DateTimeTimestampConverter() @JsonKey(name: 'created_at') this.createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      this.modifiedAt,
      final String? $type})
      : assert(id != "", 'id cannot be empty'),
        assert(email != "", 'id cannot be empty'),
        assert(password != "", 'id cannot be empty'),
        assert(fullname != "", 'id cannot be empty'),
        assert(phoneNumber != "", 'id cannot be empty'),
        $type = $type ?? 'data',
        super._();

  factory _$UserData.fromJson(Map<String, dynamic> json) =>
      _$$UserDataFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String password;
  @override
  final String fullname;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  @DateTimeTimestampConverter()
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @DateTimeTimestampConverter()
  @JsonKey(name: 'modified_at')
  final DateTime? modifiedAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUser.data(id: $id, email: $email, password: $password, fullname: $fullname, phoneNumber: $phoneNumber, createdAt: $createdAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserData &&
            (identical(other.id, id) || other.id == id) &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, password, fullname,
      phoneNumber, createdAt, modifiedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataCopyWith<_$UserData> get copyWith =>
      __$$UserDataCopyWithImpl<_$UserData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function(
            String id,
            String email,
            String password,
            String fullname,
            @JsonKey(name: 'phone_number') String phoneNumber,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)
        data,
    required TResult Function(String id, String email) simple,
  }) {
    return data(
        id, email, password, fullname, phoneNumber, createdAt, modifiedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function(
            String id,
            String email,
            String password,
            String fullname,
            @JsonKey(name: 'phone_number') String phoneNumber,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        data,
    TResult? Function(String id, String email)? simple,
  }) {
    return data?.call(
        id, email, password, fullname, phoneNumber, createdAt, modifiedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function(
            String id,
            String email,
            String password,
            String fullname,
            @JsonKey(name: 'phone_number') String phoneNumber,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        data,
    TResult Function(String id, String email)? simple,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(
          id, email, password, fullname, phoneNumber, createdAt, modifiedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNotConnected value) notConnected,
    required TResult Function(UserData value) data,
    required TResult Function(UserSimple value) simple,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnected value)? notConnected,
    TResult? Function(UserData value)? data,
    TResult? Function(UserSimple value)? simple,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnected value)? notConnected,
    TResult Function(UserData value)? data,
    TResult Function(UserSimple value)? simple,
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

abstract class UserData extends AppUser {
  const factory UserData(
      {required final String id,
      required final String email,
      required final String password,
      required final String fullname,
      @JsonKey(name: 'phone_number') required final String phoneNumber,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'created_at')
      final DateTime? createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      final DateTime? modifiedAt}) = _$UserData;
  const UserData._() : super._();

  factory UserData.fromJson(Map<String, dynamic> json) = _$UserData.fromJson;

  String get id;
  String get email;
  String get password;
  String get fullname;
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @DateTimeTimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @DateTimeTimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime? get modifiedAt;
  @JsonKey(ignore: true)
  _$$UserDataCopyWith<_$UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserSimpleCopyWith<$Res> {
  factory _$$UserSimpleCopyWith(
          _$UserSimple value, $Res Function(_$UserSimple) then) =
      __$$UserSimpleCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, String email});
}

/// @nodoc
class __$$UserSimpleCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$UserSimple>
    implements _$$UserSimpleCopyWith<$Res> {
  __$$UserSimpleCopyWithImpl(
      _$UserSimple _value, $Res Function(_$UserSimple) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
  }) {
    return _then(_$UserSimple(
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

@JsonSerializable(explicitToJson: true)
class _$UserSimple extends UserSimple {
  const _$UserSimple(
      {required this.id, required this.email, final String? $type})
      : assert(id != "", 'id cannot be empty'),
        assert(email != "", 'id cannot be empty'),
        $type = $type ?? 'simple',
        super._();

  factory _$UserSimple.fromJson(Map<String, dynamic> json) =>
      _$$UserSimpleFromJson(json);

  @override
  final String id;
  @override
  final String email;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUser.simple(id: $id, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSimple &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSimpleCopyWith<_$UserSimple> get copyWith =>
      __$$UserSimpleCopyWithImpl<_$UserSimple>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notConnected,
    required TResult Function(
            String id,
            String email,
            String password,
            String fullname,
            @JsonKey(name: 'phone_number') String phoneNumber,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)
        data,
    required TResult Function(String id, String email) simple,
  }) {
    return simple(id, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notConnected,
    TResult? Function(
            String id,
            String email,
            String password,
            String fullname,
            @JsonKey(name: 'phone_number') String phoneNumber,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        data,
    TResult? Function(String id, String email)? simple,
  }) {
    return simple?.call(id, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notConnected,
    TResult Function(
            String id,
            String email,
            String password,
            String fullname,
            @JsonKey(name: 'phone_number') String phoneNumber,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
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
    required TResult Function(UserNotConnected value) notConnected,
    required TResult Function(UserData value) data,
    required TResult Function(UserSimple value) simple,
  }) {
    return simple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserNotConnected value)? notConnected,
    TResult? Function(UserData value)? data,
    TResult? Function(UserSimple value)? simple,
  }) {
    return simple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNotConnected value)? notConnected,
    TResult Function(UserData value)? data,
    TResult Function(UserSimple value)? simple,
    required TResult orElse(),
  }) {
    if (simple != null) {
      return simple(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSimpleToJson(
      this,
    );
  }
}

abstract class UserSimple extends AppUser {
  const factory UserSimple(
      {required final String id, required final String email}) = _$UserSimple;
  const UserSimple._() : super._();

  factory UserSimple.fromJson(Map<String, dynamic> json) =
      _$UserSimple.fromJson;

  String get id;
  String get email;
  @JsonKey(ignore: true)
  _$$UserSimpleCopyWith<_$UserSimple> get copyWith =>
      throw _privateConstructorUsedError;
}
