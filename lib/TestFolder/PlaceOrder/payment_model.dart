
import 'package:json_annotation/json_annotation.dart';
part 'payment_model.g.dart';

@JsonSerializable()
class Payment {
  String bankName;
  int amount;
  int creditLimit;
  String image;

  Payment({required this.bankName, required this.amount, required this.image, required this.creditLimit});

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}