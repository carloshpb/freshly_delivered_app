import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/advertisement.dart';

part 'advertisement_dto.freezed.dart';

@freezed
class AdvertisementDto with _$AdvertisementDto {
  const AdvertisementDto._();

  const factory AdvertisementDto({
    @Default('') String id,
    @Default('') String description,
    @Default('') String imagePath,
    @Default(false) bool isSpecial,
    @Default([]) List<String> productsIds,
  }) = _AdvertisementDto;

  Advertisement toModel() {
    return Advertisement(
      id: id,
      description: description,
      imagePath: imagePath,
      isSpecial: isSpecial,
      productsIds: productsIds,
      createdAt: DateTime.parse('0000-00-00'),
      modifiedAt: DateTime.parse('0000-00-00'),
    );
  }
}
