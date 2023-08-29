// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OnboardingMessage _$OnboardingMessageFromJson(Map<String, dynamic> json) {
  return _OnboardingMessage.fromJson(json);
}

/// @nodoc
mixin _$OnboardingMessage {
  String get imageSvgPath => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime? get modifiedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnboardingMessageCopyWith<OnboardingMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingMessageCopyWith<$Res> {
  factory $OnboardingMessageCopyWith(
          OnboardingMessage value, $Res Function(OnboardingMessage) then) =
      _$OnboardingMessageCopyWithImpl<$Res, OnboardingMessage>;
  @useResult
  $Res call(
      {String imageSvgPath,
      String title,
      String message,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'created_at')
      DateTime? createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      DateTime? modifiedAt});
}

/// @nodoc
class _$OnboardingMessageCopyWithImpl<$Res, $Val extends OnboardingMessage>
    implements $OnboardingMessageCopyWith<$Res> {
  _$OnboardingMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageSvgPath = null,
    Object? title = null,
    Object? message = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_value.copyWith(
      imageSvgPath: null == imageSvgPath
          ? _value.imageSvgPath
          : imageSvgPath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingMessageCopyWith<$Res>
    implements $OnboardingMessageCopyWith<$Res> {
  factory _$$_OnboardingMessageCopyWith(_$_OnboardingMessage value,
          $Res Function(_$_OnboardingMessage) then) =
      __$$_OnboardingMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imageSvgPath,
      String title,
      String message,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'created_at')
      DateTime? createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      DateTime? modifiedAt});
}

/// @nodoc
class __$$_OnboardingMessageCopyWithImpl<$Res>
    extends _$OnboardingMessageCopyWithImpl<$Res, _$_OnboardingMessage>
    implements _$$_OnboardingMessageCopyWith<$Res> {
  __$$_OnboardingMessageCopyWithImpl(
      _$_OnboardingMessage _value, $Res Function(_$_OnboardingMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageSvgPath = null,
    Object? title = null,
    Object? message = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_$_OnboardingMessage(
      imageSvgPath: null == imageSvgPath
          ? _value.imageSvgPath
          : imageSvgPath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
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
class _$_OnboardingMessage extends _OnboardingMessage {
  const _$_OnboardingMessage(
      {required this.imageSvgPath,
      required this.title,
      required this.message,
      @DateTimeTimestampConverter() @JsonKey(name: 'created_at') this.createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      this.modifiedAt})
      : super._();

  factory _$_OnboardingMessage.fromJson(Map<String, dynamic> json) =>
      _$$_OnboardingMessageFromJson(json);

  @override
  final String imageSvgPath;
  @override
  final String title;
  @override
  final String message;
  @override
  @DateTimeTimestampConverter()
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @DateTimeTimestampConverter()
  @JsonKey(name: 'modified_at')
  final DateTime? modifiedAt;

  @override
  String toString() {
    return 'OnboardingMessage(imageSvgPath: $imageSvgPath, title: $title, message: $message, createdAt: $createdAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingMessage &&
            (identical(other.imageSvgPath, imageSvgPath) ||
                other.imageSvgPath == imageSvgPath) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, imageSvgPath, title, message, createdAt, modifiedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingMessageCopyWith<_$_OnboardingMessage> get copyWith =>
      __$$_OnboardingMessageCopyWithImpl<_$_OnboardingMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OnboardingMessageToJson(
      this,
    );
  }
}

abstract class _OnboardingMessage extends OnboardingMessage {
  const factory _OnboardingMessage(
      {required final String imageSvgPath,
      required final String title,
      required final String message,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'created_at')
      final DateTime? createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      final DateTime? modifiedAt}) = _$_OnboardingMessage;
  const _OnboardingMessage._() : super._();

  factory _OnboardingMessage.fromJson(Map<String, dynamic> json) =
      _$_OnboardingMessage.fromJson;

  @override
  String get imageSvgPath;
  @override
  String get title;
  @override
  String get message;
  @override
  @DateTimeTimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @DateTimeTimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime? get modifiedAt;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingMessageCopyWith<_$_OnboardingMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
