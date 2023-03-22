


import 'package:json_annotation/json_annotation.dart';
part 'district_model.g.dart';

@JsonSerializable()
class District {
  String name;
  List<String> cities;

  District({required this.name, required this.cities});

  factory District.fromJson(Map<String, dynamic> map) =>
      _$DistrictFromJson(map);
  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
