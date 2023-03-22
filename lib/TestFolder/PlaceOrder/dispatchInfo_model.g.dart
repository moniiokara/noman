// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispatchInfo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DispatchInfo _$DispatchInfoFromJson(Map<String, dynamic> json) => DispatchInfo(
      driverNo: json['driverNo'] as int,
      vehicalNo: json['vehicalNo'] as int,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$DispatchInfoToJson(DispatchInfo instance) =>
    <String, dynamic>{
      'driverNo': instance.driverNo,
      'vehicalNo': instance.vehicalNo,
      'time': instance.time.toIso8601String(),
    };
