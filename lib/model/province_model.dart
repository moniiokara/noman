import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/model/district_model.dart';
part 'province_model.g.dart';


@JsonSerializable()
class Province {
  String name;
  List<District> district;

  Province({required this.name, required this.district});

  factory Province.fromJson(Map<String, dynamic> map) =>
      _$ProvinceFromJson(map);
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
