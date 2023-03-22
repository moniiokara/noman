// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userName: json['userName'] as String,
      userType: json['userType'] as String,
      userUid: json['userUid'] as String,
      userStatus: json['userStatus'] as bool,
      userCnic: json['userCnic'] as int,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      userPhone: json['userPhone'] as int,
      uidTopHead:
          UidTopHead.fromJson(json['uidTopHead'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userName': instance.userName,
      'userType': instance.userType,
      'userUid': instance.userUid,
      'userStatus': instance.userStatus,
      'userCnic': instance.userCnic,
      'userPhone': instance.userPhone,
      'address': instance.address,
      'uidTopHead': instance.uidTopHead,
    };
