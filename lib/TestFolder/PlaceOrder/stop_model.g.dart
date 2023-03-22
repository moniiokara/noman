// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stop _$StopFromJson(Map<String, dynamic> json) => Stop(
      stopName: json['stopName'] as String,
      shopName: json['shopName'] as String,
      orderItem: (json['orderItem'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StopToJson(Stop instance) => <String, dynamic>{
      'stopName': instance.stopName,
      'shopName': instance.shopName,
      'orderItem': instance.orderItem.map((e) => e.toJson()),
    };
