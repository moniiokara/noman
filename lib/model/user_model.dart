import 'package:json_annotation/json_annotation.dart';
import 'package:maximagri/model/address_model.dart';
import 'package:maximagri/model/uid_tophead_model.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String userName;
  String userType;
  String userUid;
  bool userStatus;
  int userCnic;
  int userPhone;
  Address address;
  UidTopHead uidTopHead;

  UserModel({
    required this.userName,
    required this.userType,
    required this.userUid,
    required this.userStatus,
    required this.userCnic,
    required this.address,
    required this.userPhone,
    required this.uidTopHead,
  });

  // @override
  // String toString() {
  //   return 'UserModel{userName: $userName, userType: $userType, userUid: $userUid, userStatus: $userStatus, userCnic: $userCnic, userPhone: $userPhone, address: $address, uidTopHead: $uidTopHead}';
  // }

  factory UserModel.fromJson(Map<String, dynamic> map) =>
      _$UserModelFromJson(map);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
