// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../exceptions/to_json_exception.dart';
import '../../../../utils/converters/datetime_timestamp_converter.dart';
import '../../../../utils/converters/datetime_to_milliseconds_since_epoch_converter.dart';
import 'product.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

/// if CartItem amount is zero (0), it should be removed from local and remote DB
@freezed
class CartItem with _$CartItem {
  const CartItem._();

  @JsonSerializable(explicitToJson: true)
  const factory CartItem.empty() = EmptyCartItem;

  @JsonSerializable(explicitToJson: true)
  // @Assert('id != ""', 'id cannot be empty')
  @Assert('amount >= 0', 'amount cannot negative')
  factory CartItem.normal({
    // required String id,
    required NormalProduct product,
    @Default(1) int amount,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'created_at')
    DateTime? createdAt,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'modified_at')
    DateTime? modifiedAt,
  }) = NormalCartItem;

  factory CartItem.fromJson(Map<String, Object?> json) =>
      _$CartItemFromJson(json);

  factory CartItem.fromSqliteJson(Map<String, Object?> json) {
    var datetimeConverter = const DateTimeToMillisecondsSinceEpochConverter();

    switch (json['runtimeType']) {
      case 'empty':
        return EmptyCartItem.fromJson(json);
      case 'normal':
        return NormalCartItem(
          amount: json["amount"] as int,
          product: NormalProduct(
            id: json["id"] as String,
            title: json["title"] as String,
            price: json["price"] as double,
            description: json["description"] as String,
            imagePath: json["image_path"] as String,
            category: json["category"] as String,
            unitsSold: json["units_sold"] as int,
            advertisementId: json["advertisement_id"] as String,
            discount: json["discount"] as int,
            createdAt: datetimeConverter.fromJson(json["created_at"] as int),
            modifiedAt: datetimeConverter.fromJson(json["modified_at"] as int),
          ),
        );

      default:
        throw CheckedFromJsonException(json, 'runtimeType', 'CartItem',
            'Invalid union type "${json['runtimeType']}"!');
    }
  }

  Map<String, dynamic> toSqliteJson() {
    var datetimeConverter = const DateTimeToMillisecondsSinceEpochConverter();

    switch (this) {
      case EmptyCartItem():
        return toJson();
      case NormalCartItem():
        return <String, dynamic>{
          'id': (this as NormalCartItem).product.id,
          'amount': (this as NormalCartItem).amount,
          'created_at':
              datetimeConverter.toJson((this as NormalCartItem).createdAt),
          'modified_at':
              datetimeConverter.toJson((this as NormalCartItem).modifiedAt),
          'runtimeType': "normal",
        };
      default:
        var thisJson = toJson();
        throw CheckedToJsonException(thisJson, 'runtimeType', 'CartItem',
            'Invalid union type "${thisJson['runtimeType']}"!');
    }
  }

  Map<String, dynamic> toFirestoreJson() {
    return switch (this) {
      NormalCartItem() => <String, dynamic>{
          'id': (this as NormalCartItem).product.id,
          'amount': (this as NormalCartItem).amount,
          'runtimeType': "normal",
        },
      _ => {},
    };
  }
}
