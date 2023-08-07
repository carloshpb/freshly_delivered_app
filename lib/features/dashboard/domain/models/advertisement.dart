import 'package:freezed_annotation/freezed_annotation.dart';

import '../../application/dtos/advertisement_dto.dart';

part 'advertisement.freezed.dart';
part 'advertisement.g.dart';

@JsonSerializable(explicitToJson: true)
@Freezed(toJson: false, fromJson: false)
class Advertisement with _$Advertisement {
  const Advertisement._();

  factory Advertisement({
    @Default('') String id,
    @Default('') String description,
    @Default('') String imagePath,
    @Default(false) bool isSpecial,
    required DateTime createdAt,
    required DateTime modifiedAt,
  }) = _Advertisement;

  factory Advertisement.fromJson(Map<String, Object?> json) =>
      _$AdvertisementFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementToJson(this);

  AdvertisementDto toDto() {
    return AdvertisementDto(
      id: id,
      description: description,
      imagePath: imagePath,
      isSpecial: isSpecial,
    );
  }
}
