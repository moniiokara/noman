
import 'package:json_annotation/json_annotation.dart';
part 'dispatchInfo_model.g.dart';

@JsonSerializable()
class DispatchInfo {
  int driverNo;
  int vehicalNo;
  DateTime time;

  DispatchInfo(
      {required this.driverNo, required this.vehicalNo, required this.time});

  factory DispatchInfo.fromJson(Map<String, dynamic> json) =>
      _$DispatchInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DispatchInfoToJson(this);
}
