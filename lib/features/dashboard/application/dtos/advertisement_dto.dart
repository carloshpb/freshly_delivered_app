import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/advertisement.dart';

part 'advertisement_dto.freezed.dart';

@freezed
class AdvertisementDto with _$AdvertisementDto {
  const AdvertisementDto._();

  const factory AdvertisementDto({
    @Default(-1) int id,
    @Default('') String description,
    @Default('') String image,
  }) = _AdvertisementDto;

  Advertisement toModel() {
    return Advertisement(
      id: id,
      description: description,
      image: image,
    );
  }
}
