// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      userId: json['user_id'] as String,
      totalPrice: (json['total_price'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => _$recordConvert(
                e,
                ($jsonValue) => (
                  amount: ($jsonValue['amount'] as num).toDouble(),
                  product: Product.fromJson(
                      $jsonValue['product'] as Map<String, dynamic>),
                ),
              ))
          .toList(),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'user_id': instance.userId,
      'total_price': instance.totalPrice,
      'items': instance.items
          .map((e) => {
                'amount': e.amount,
                'product': e.product.toJson(),
              })
          .toList(),
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
