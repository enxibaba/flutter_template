import 'package:json_annotation/json_annotation.dart';

part 'home_status.g.dart';

@JsonSerializable()
class HomeStatus extends Object {
  @JsonKey(name: 'info')
  Info info;

  HomeStatus(
    this.info,
  );

  factory HomeStatus.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeStatusFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeStatusToJson(this);
}

@JsonSerializable()
class Info extends Object {
  @JsonKey(name: 'referralCount')
  int referralCount;

  @JsonKey(name: 'consultCount')
  int consultCount;

  @JsonKey(name: 'msgInfo')
  MsgInfo msgInfo;

  @JsonKey(name: 'waitAcceptOrderCount')
  int waitAcceptOrderCount;

  @JsonKey(name: 'menulist')
  List<Menulist> menulist;

  @JsonKey(name: 'queryPrescriptionNum')
  int queryPrescriptionNum;

  Info(
    this.referralCount,
    this.consultCount,
    this.msgInfo,
    this.waitAcceptOrderCount,
    this.menulist,
    this.queryPrescriptionNum,
  );

  factory Info.fromJson(Map<String, dynamic> srcJson) =>
      _$InfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class MsgInfo extends Object {
  @JsonKey(name: 'sysId')
  String sysId;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'detail')
  String detail;

  @JsonKey(name: 'time')
  String time;

  MsgInfo(
    this.sysId,
    this.tag,
    this.title,
    this.detail,
    this.time,
  );

  factory MsgInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$MsgInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MsgInfoToJson(this);
}

@JsonSerializable()
class Menulist extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'cateId')
  int cateId;

  @JsonKey(name: 'isOpen')
  int isOpen;

  @JsonKey(name: 'menuTitle')
  String menuTitle;

  @JsonKey(name: 'maxImage')
  String maxImage;

  @JsonKey(name: 'thumbImage')
  String thumbImage;

  @JsonKey(name: 'maxImageClose')
  String maxImageClose;

  @JsonKey(name: 'thumbImageClose')
  String thumbImageClose;

  @JsonKey(name: 'unReadCount')
  int unReadCount;

  Menulist(
    this.id,
    this.cateId,
    this.isOpen,
    this.menuTitle,
    this.maxImage,
    this.thumbImage,
    this.maxImageClose,
    this.thumbImageClose,
    this.unReadCount,
  );

  factory Menulist.fromJson(Map<String, dynamic> srcJson) =>
      _$MenulistFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MenulistToJson(this);
}
