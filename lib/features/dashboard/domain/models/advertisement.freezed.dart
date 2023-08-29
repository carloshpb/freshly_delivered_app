// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advertisement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Advertisement _$AdvertisementFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'empty':
      return EmptyAdvertisement.fromJson(json);
    case 'normal':
      return NormalAdvertisement.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Advertisement',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Advertisement {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            String id,
            String description,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'is_special') bool isSpecial,
            int discount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)
        normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(
            String id,
            String description,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'is_special') bool isSpecial,
            int discount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(
            String id,
            String description,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'is_special') bool isSpecial,
            int discount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyAdvertisement value) empty,
    required TResult Function(NormalAdvertisement value) normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyAdvertisement value)? empty,
    TResult? Function(NormalAdvertisement value)? normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyAdvertisement value)? empty,
    TResult Function(NormalAdvertisement value)? normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertisementCopyWith<$Res> {
  factory $AdvertisementCopyWith(
          Advertisement value, $Res Function(Advertisement) then) =
      _$AdvertisementCopyWithImpl<$Res, Advertisement>;
}

/// @nodoc
class _$AdvertisementCopyWithImpl<$Res, $Val extends Advertisement>
    implements $AdvertisementCopyWith<$Res> {
  _$AdvertisementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyAdvertisementCopyWith<$Res> {
  factory _$$EmptyAdvertisementCopyWith(_$EmptyAdvertisement value,
          $Res Function(_$EmptyAdvertisement) then) =
      __$$EmptyAdvertisementCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyAdvertisementCopyWithImpl<$Res>
    extends _$AdvertisementCopyWithImpl<$Res, _$EmptyAdvertisement>
    implements _$$EmptyAdvertisementCopyWith<$Res> {
  __$$EmptyAdvertisementCopyWithImpl(
      _$EmptyAdvertisement _value, $Res Function(_$EmptyAdvertisement) _then)
      : super(_value, _then);
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EmptyAdvertisement extends EmptyAdvertisement {
  const _$EmptyAdvertisement({final String? $type})
      : $type = $type ?? 'empty',
        super._();

  factory _$EmptyAdvertisement.fromJson(Map<String, dynamic> json) =>
      _$$EmptyAdvertisementFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Advertisement.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyAdvertisement);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            String id,
            String description,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'is_special') bool isSpecial,
            int discount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)
        normal,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(
            String id,
            String description,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'is_special') bool isSpecial,
            int discount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        normal,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(
            String id,
            String description,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'is_special') bool isSpecial,
            int discount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        normal,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyAdvertisement value) empty,
    required TResult Function(NormalAdvertisement value) normal,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyAdvertisement value)? empty,
    TResult? Function(NormalAdvertisement value)? normal,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyAdvertisement value)? empty,
    TResult Function(NormalAdvertisement value)? normal,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptyAdvertisementToJson(
      this,
    );
  }
}

abstract class EmptyAdvertisement extends Advertisement {
  const factory EmptyAdvertisement() = _$EmptyAdvertisement;
  const EmptyAdvertisement._() : super._();

  factory EmptyAdvertisement.fromJson(Map<String, dynamic> json) =
      _$EmptyAdvertisement.fromJson;
}

/// @nodoc
abstract class _$$NormalAdvertisementCopyWith<$Res> {
  factory _$$NormalAdvertisementCopyWith(_$NormalAdvertisement value,
          $Res Function(_$NormalAdvertisement) then) =
      __$$NormalAdvertisementCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String id,
      String description,
      @JsonKey(name: 'image_path') String imagePath,
      @JsonKey(name: 'is_special') bool isSpecial,
      int discount,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'created_at')
      DateTime? createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      DateTime? modifiedAt});
}

/// @nodoc
class __$$NormalAdvertisementCopyWithImpl<$Res>
    extends _$AdvertisementCopyWithImpl<$Res, _$NormalAdvertisement>
    implements _$$NormalAdvertisementCopyWith<$Res> {
  __$$NormalAdvertisementCopyWithImpl(
      _$NormalAdvertisement _value, $Res Function(_$NormalAdvertisement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? imagePath = null,
    Object? isSpecial = null,
    Object? discount = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_$NormalAdvertisement(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      isSpecial: null == isSpecial
          ? _value.isSpecial
          : isSpecial // ignore: cast_nullable_to_non_nullable
              as bool,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$NormalAdvertisement extends NormalAdvertisement {
  _$NormalAdvertisement(
      {required this.id,
      required this.description,
      @JsonKey(name: 'image_path') required this.imagePath,
      @JsonKey(name: 'is_special') this.isSpecial = false,
      this.discount = 0,
      @DateTimeTimestampConverter() @JsonKey(name: 'created_at') this.createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      this.modifiedAt,
      final String? $type})
      : assert(discount >= 0, 'discount cannot be negative'),
        assert(id != "", 'id cannot be empty'),
        assert(description != "", 'description cannot be empty'),
        assert(imagePath != "", 'imagePath cannot be empty'),
        $type = $type ?? 'normal',
        super._();

  factory _$NormalAdvertisement.fromJson(Map<String, dynamic> json) =>
      _$$NormalAdvertisementFromJson(json);

  @override
  final String id;
  @override
  final String description;
  @override
  @JsonKey(name: 'image_path')
  final String imagePath;
  @override
  @JsonKey(name: 'is_special')
  final bool isSpecial;
  @override
  @JsonKey()
  final int discount;
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
    return 'Advertisement.normal(id: $id, description: $description, imagePath: $imagePath, isSpecial: $isSpecial, discount: $discount, createdAt: $createdAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormalAdvertisement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.isSpecial, isSpecial) ||
                other.isSpecial == isSpecial) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, imagePath,
      isSpecial, discount, createdAt, modifiedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NormalAdvertisementCopyWith<_$NormalAdvertisement> get copyWith =>
      __$$NormalAdvertisementCopyWithImpl<_$NormalAdvertisement>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            String id,
            String description,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'is_special') bool isSpecial,
            int discount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)
        normal,
  }) {
    return normal(
        id, description, imagePath, isSpecial, discount, createdAt, modifiedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(
            String id,
            String description,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'is_special') bool isSpecial,
            int discount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        normal,
  }) {
    return normal?.call(
        id, description, imagePath, isSpecial, discount, createdAt, modifiedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(
            String id,
            String description,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'is_special') bool isSpecial,
            int discount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(id, description, imagePath, isSpecial, discount, createdAt,
          modifiedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyAdvertisement value) empty,
    required TResult Function(NormalAdvertisement value) normal,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyAdvertisement value)? empty,
    TResult? Function(NormalAdvertisement value)? normal,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyAdvertisement value)? empty,
    TResult Function(NormalAdvertisement value)? normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NormalAdvertisementToJson(
      this,
    );
  }
}

abstract class NormalAdvertisement extends Advertisement {
  factory NormalAdvertisement(
      {required final String id,
      required final String description,
      @JsonKey(name: 'image_path') required final String imagePath,
      @JsonKey(name: 'is_special') final bool isSpecial,
      final int discount,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'created_at')
      final DateTime? createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      final DateTime? modifiedAt}) = _$NormalAdvertisement;
  NormalAdvertisement._() : super._();

  factory NormalAdvertisement.fromJson(Map<String, dynamic> json) =
      _$NormalAdvertisement.fromJson;

  String get id;
  String get description;
  @JsonKey(name: 'image_path')
  String get imagePath;
  @JsonKey(name: 'is_special')
  bool get isSpecial;
  int get discount;
  @DateTimeTimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @DateTimeTimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime? get modifiedAt;
  @JsonKey(ignore: true)
  _$$NormalAdvertisementCopyWith<_$NormalAdvertisement> get copyWith =>
      throw _privateConstructorUsedError;
}
