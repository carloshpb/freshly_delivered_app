// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingScreenState {
  int get pagePosition => throw _privateConstructorUsedError;
  List<OnboardingMessageDto> get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingScreenStateCopyWith<OnboardingScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingScreenStateCopyWith<$Res> {
  factory $OnboardingScreenStateCopyWith(OnboardingScreenState value,
          $Res Function(OnboardingScreenState) then) =
      _$OnboardingScreenStateCopyWithImpl<$Res, OnboardingScreenState>;
  @useResult
  $Res call({int pagePosition, List<OnboardingMessageDto> messages});
}

/// @nodoc
class _$OnboardingScreenStateCopyWithImpl<$Res,
        $Val extends OnboardingScreenState>
    implements $OnboardingScreenStateCopyWith<$Res> {
  _$OnboardingScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagePosition = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      pagePosition: null == pagePosition
          ? _value.pagePosition
          : pagePosition // ignore: cast_nullable_to_non_nullable
              as int,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<OnboardingMessageDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingScreenStateCopyWith<$Res>
    implements $OnboardingScreenStateCopyWith<$Res> {
  factory _$$_OnboardingScreenStateCopyWith(_$_OnboardingScreenState value,
          $Res Function(_$_OnboardingScreenState) then) =
      __$$_OnboardingScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pagePosition, List<OnboardingMessageDto> messages});
}

/// @nodoc
class __$$_OnboardingScreenStateCopyWithImpl<$Res>
    extends _$OnboardingScreenStateCopyWithImpl<$Res, _$_OnboardingScreenState>
    implements _$$_OnboardingScreenStateCopyWith<$Res> {
  __$$_OnboardingScreenStateCopyWithImpl(_$_OnboardingScreenState _value,
      $Res Function(_$_OnboardingScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagePosition = null,
    Object? messages = null,
  }) {
    return _then(_$_OnboardingScreenState(
      pagePosition: null == pagePosition
          ? _value.pagePosition
          : pagePosition // ignore: cast_nullable_to_non_nullable
              as int,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<OnboardingMessageDto>,
    ));
  }
}

/// @nodoc

class _$_OnboardingScreenState implements _OnboardingScreenState {
  const _$_OnboardingScreenState(
      {required this.pagePosition,
      required final List<OnboardingMessageDto> messages})
      : _messages = messages;

  @override
  final int pagePosition;
  final List<OnboardingMessageDto> _messages;
  @override
  List<OnboardingMessageDto> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'OnboardingScreenState(pagePosition: $pagePosition, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingScreenState &&
            (identical(other.pagePosition, pagePosition) ||
                other.pagePosition == pagePosition) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pagePosition,
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingScreenStateCopyWith<_$_OnboardingScreenState> get copyWith =>
      __$$_OnboardingScreenStateCopyWithImpl<_$_OnboardingScreenState>(
          this, _$identity);
}

abstract class _OnboardingScreenState implements OnboardingScreenState {
  const factory _OnboardingScreenState(
          {required final int pagePosition,
          required final List<OnboardingMessageDto> messages}) =
      _$_OnboardingScreenState;

  @override
  int get pagePosition;
  @override
  List<OnboardingMessageDto> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingScreenStateCopyWith<_$_OnboardingScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
