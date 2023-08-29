// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingMessageDto {
  String get imageSvgPath => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingMessageDtoCopyWith<OnboardingMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingMessageDtoCopyWith<$Res> {
  factory $OnboardingMessageDtoCopyWith(OnboardingMessageDto value,
          $Res Function(OnboardingMessageDto) then) =
      _$OnboardingMessageDtoCopyWithImpl<$Res, OnboardingMessageDto>;
  @useResult
  $Res call({String imageSvgPath, String title, String message});
}

/// @nodoc
class _$OnboardingMessageDtoCopyWithImpl<$Res,
        $Val extends OnboardingMessageDto>
    implements $OnboardingMessageDtoCopyWith<$Res> {
  _$OnboardingMessageDtoCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingMessageDtoCopyWith<$Res>
    implements $OnboardingMessageDtoCopyWith<$Res> {
  factory _$$_OnboardingMessageDtoCopyWith(_$_OnboardingMessageDto value,
          $Res Function(_$_OnboardingMessageDto) then) =
      __$$_OnboardingMessageDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageSvgPath, String title, String message});
}

/// @nodoc
class __$$_OnboardingMessageDtoCopyWithImpl<$Res>
    extends _$OnboardingMessageDtoCopyWithImpl<$Res, _$_OnboardingMessageDto>
    implements _$$_OnboardingMessageDtoCopyWith<$Res> {
  __$$_OnboardingMessageDtoCopyWithImpl(_$_OnboardingMessageDto _value,
      $Res Function(_$_OnboardingMessageDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageSvgPath = null,
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_$_OnboardingMessageDto(
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
    ));
  }
}

/// @nodoc

class _$_OnboardingMessageDto extends _OnboardingMessageDto {
  const _$_OnboardingMessageDto(
      {required this.imageSvgPath, required this.title, required this.message})
      : super._();

  @override
  final String imageSvgPath;
  @override
  final String title;
  @override
  final String message;

  @override
  String toString() {
    return 'OnboardingMessageDto(imageSvgPath: $imageSvgPath, title: $title, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingMessageDto &&
            (identical(other.imageSvgPath, imageSvgPath) ||
                other.imageSvgPath == imageSvgPath) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageSvgPath, title, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingMessageDtoCopyWith<_$_OnboardingMessageDto> get copyWith =>
      __$$_OnboardingMessageDtoCopyWithImpl<_$_OnboardingMessageDto>(
          this, _$identity);
}

abstract class _OnboardingMessageDto extends OnboardingMessageDto {
  const factory _OnboardingMessageDto(
      {required final String imageSvgPath,
      required final String title,
      required final String message}) = _$_OnboardingMessageDto;
  const _OnboardingMessageDto._() : super._();

  @override
  String get imageSvgPath;
  @override
  String get title;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingMessageDtoCopyWith<_$_OnboardingMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}
