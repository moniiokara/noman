// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provinceinlize_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvinceModel _$ProvinceModelFromJson(Map<String, dynamic> json) =>
    ProvinceModel(
      name: json['name'] as String,
      districts: (json['districts'] as List<dynamic>)
          .map((e) => DistrictModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProvinceModelToJson(ProvinceModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'districts': instance.districts.map((e) => e.toJson()),
    };
