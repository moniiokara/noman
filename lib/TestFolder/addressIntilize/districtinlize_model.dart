import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/TestFolder/addressIntilize/city_model.dart';
part 'districtinlize_model.g.dart';

@JsonSerializable()
class DistrictModel {
  String districtName;
  List<String> cities;

  DistrictModel({required this.districtName, required this.cities});

  factory DistrictModel.fromJson(Map<String, dynamic> map) =>
      _$DistrictModelFromJson(map);

  Map<String, dynamic> toJson() => _$DistrictModelToJson(this);
}
