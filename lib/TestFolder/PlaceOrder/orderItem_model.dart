
import 'package:json_annotation/json_annotation.dart';
part 'orderItem_model.g.dart';

@JsonSerializable()
class OrderItem {
  String productName;
  int productPrice;
  int productTotal;
  int productQuantity;

  OrderItem(
      {required this.productName,
        required this.productPrice,
        required this.productTotal,
        required this.productQuantity});

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}