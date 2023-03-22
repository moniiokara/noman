
import 'package:json_annotation/json_annotation.dart';
part 'address_model.g.dart';

@JsonSerializable()
class Address {
  String province;
  String district;
  String city;


  Address({required this.province, required this.district, required this.city});

  factory Address.fromJson(Map<String, dynamic> map) =>
      _$AddressFromJson(map);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
