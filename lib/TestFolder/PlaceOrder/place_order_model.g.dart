// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderModel _$PlaceOrderModelFromJson(Map<String, dynamic> json) =>
    PlaceOrderModel(
      dispatchInfo:
          DispatchInfo.fromJson(json['dispatchInfo'] as Map<String, dynamic>),
      orderTotal: json['orderTotal'] as int,
      orderQuantity: json['orderQuantity'] as int,
      customerName: json['customerName'] as String,
      orderNum: json['orderNum'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
      stops: (json['stops'] as List<dynamic>)
          .map((e) => Stop.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderUid: OrderUid.fromJson(json['orderUid'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceOrderModelToJson(PlaceOrderModel instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'orderNum': instance.orderNum,
      'stops': instance.stops,
      'orderUid': instance.orderUid,
      'orderTotal': instance.orderTotal,
      'orderQuantity': instance.orderQuantity,
      'dateTime': instance.dateTime.toIso8601String(),
      'payment': instance.payment,
      'dispatchInfo': instance.dispatchInfo,
    };
