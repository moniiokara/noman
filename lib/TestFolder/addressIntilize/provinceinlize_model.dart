
import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/TestFolder/addressIntilize/districtinlize_model.dart';
part 'provinceinlize_model.g.dart';


@JsonSerializable()
class ProvinceModel {
  String name;
  List<DistrictModel> districts;

  ProvinceModel({required this.name, required this.districts});

  factory ProvinceModel.fromJson(Map<String, dynamic> map) =>
      _$ProvinceModelFromJson(map);

  Map<String, dynamic> toJson() => _$ProvinceModelToJson(this);
}