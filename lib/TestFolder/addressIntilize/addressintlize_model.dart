import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/TestFolder/addressIntilize/districtinlize_model.dart';
import 'package:maximagri/TestFolder/addressIntilize/provinceinlize_model.dart';
part 'addressintlize_model.g.dart';

@JsonSerializable()
class AddressInitializeModel {
  List<ProvinceModel> provinces;

  AddressInitializeModel({required this.provinces});

  factory AddressInitializeModel.fromJson(Map<String, dynamic> map) =>
      _$AddressInitializeModelFromJson(map);

  Map<String, dynamic> toJson() => _$AddressInitializeModelToJson(this);
}
