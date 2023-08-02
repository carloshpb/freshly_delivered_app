import 'package:freezed_annotation/freezed_annotation.dart';

import '../../application/dtos/advertisement_dto.dart';

part 'advertisement.freezed.dart';
part 'advertisement.g.dart';

@JsonSerializable(explicitToJson: true)
@Freezed(toJson: false, fromJson: false)
class Advertisement with _$Advertisement {
  const Advertisement._();

  factory Advertisement({
    required int id,
    required String description,
    required String image,
  }) = _Advertisement;

  factory Advertisement.fromJson(Map<String, Object?> json) =>
      _$AdvertisementFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementToJson(this);

  AdvertisementDto toDto() {
    return AdvertisementDto(
      id: id,
      description: description,
      image: image,
    );
  }
}
