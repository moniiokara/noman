// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderItem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      productName: json['productName'] as String,
      productPrice: json['productPrice'] as int,
      productTotal: json['productTotal'] as int,
      productQuantity: json['productQuantity'] as int,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productTotal': instance.productTotal,
      'productQuantity': instance.productQuantity,
    };
