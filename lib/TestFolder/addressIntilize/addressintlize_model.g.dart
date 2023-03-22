// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addressintlize_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressInitializeModel _$AddressInitializeModelFromJson(
        Map<String, dynamic> json) =>
    AddressInitializeModel(
      provinces: (json['provinces'] as List<dynamic>)
          .map((e) => ProvinceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressInitializeModelToJson(
        AddressInitializeModel instance) =>
    <String, dynamic>{
      'provinces': instance.provinces,
    };
