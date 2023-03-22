import 'package:json_annotation/json_annotation.dart';
part 'uid_tophead_model.g.dart';

@JsonSerializable()
class UidTopHead {
  String oprUid;
  String zsmUid;
  String asmUid;
  String asoUid;
  String drlUid;

  UidTopHead(this.oprUid, this.zsmUid, this.asmUid, this.asoUid, this.drlUid);

  factory UidTopHead.fromJson(Map<String, dynamic> map) =>
      _$UidTopHeadFromJson(map);
  Map<String, dynamic> toJson() => _$UidTopHeadToJson(this);
}
