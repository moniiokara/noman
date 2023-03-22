
import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/TestFolder/PlaceOrder/orderItem_model.dart';
part 'stop_model.g.dart';

@JsonSerializable()
class Stop {
  String stopName;
  String shopName;
  List<OrderItem> orderItem;

  Stop({required this.stopName, required this.shopName, required this.orderItem});

  factory Stop.fromJson(Map<String, dynamic> json) =>
      _$StopFromJson(json);

  Map<String, dynamic> toJson() => _$StopToJson(this);
}