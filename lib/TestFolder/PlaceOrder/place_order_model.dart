import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/TestFolder/PlaceOrder/dispatchInfo_model.dart';
import 'package:maximagri/TestFolder/PlaceOrder/orderItem_model.dart';
import 'package:maximagri/TestFolder/PlaceOrder/orderuid_model.dart';
import 'package:maximagri/TestFolder/PlaceOrder/payment_model.dart';
import 'package:maximagri/TestFolder/PlaceOrder/stop_model.dart';
part 'place_order_model.g.dart';

@JsonSerializable()
class PlaceOrderModel {


  String customerName;

  int orderNum;
  List<Stop> stops;
  OrderUid orderUid;
  int orderTotal;
  int orderQuantity;
  DateTime dateTime;
  Payment payment;
  DispatchInfo dispatchInfo;

  PlaceOrderModel({
    required this.dispatchInfo,
    required this.orderTotal,
    required this.orderQuantity,
    required this.customerName,
    required this.orderNum,
    required this.dateTime,
    required this.payment,
    required this.stops,
    required this.orderUid,
  });

  factory PlaceOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderModelToJson(this);
}
