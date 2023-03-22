

import 'package:json_annotation/json_annotation.dart';
part 'orderuid_model.g.dart';

@JsonSerializable()
class OrderUid {
  String asmUid;
  String dealerUid;
  String asoUid;
  String zsmUid;

  OrderUid(
      {required this.asmUid,
        required this.dealerUid,
        required this.asoUid,
        required this.zsmUid});

  factory OrderUid.fromJson(Map<String, dynamic> json) =>
      _$OrderUidFromJson(json);

  Map<String, dynamic> toJson() => _$OrderUidToJson(this);
}