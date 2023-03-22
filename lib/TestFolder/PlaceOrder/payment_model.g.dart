// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      bankName: json['bankName'] as String,
      amount: json['amount'] as int,
      image: json['image'] as String,
      creditLimit: json['creditLimit'] as int,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'bankName': instance.bankName,
      'amount': instance.amount,
      'creditLimit': instance.creditLimit,
      'image': instance.image,
    };
