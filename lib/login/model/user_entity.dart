import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity extends Object {
  @JsonKey(name: 'list')
  UserModel list;

  UserEntity(
    this.list,
  );

  factory UserEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$UserEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

@JsonSerializable()
class UserModel extends Object {
  @JsonKey(name: 'docInfo')
  DocInfo docInfo;

  @JsonKey(name: 'loginInfo')
  LoginInfo loginInfo;

  @JsonKey(name: 'registerInfo')
  RegisterInfo registerInfo;

  UserModel(
    this.docInfo,
    this.loginInfo,
    this.registerInfo,
  );

  factory UserModel.fromJson(Map<String, dynamic> srcJson) =>
      _$UserModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class DocInfo extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'doctor_id')
  String doctorId;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id_card')
  String idCard;

  @JsonKey(name: 'hospital_name')
  String hospitalName;

  @JsonKey(name: 'dep_nameId')
  String depNameId;

  @JsonKey(name: 'dep_name')
  String depName;

  @JsonKey(name: 'dep_childId')
  String depChildId;

  @JsonKey(name: 'dep_child')
  String depChild;

  @JsonKey(name: 'is_pass')
  String isPass;

  @JsonKey(name: 'cert_file')
  String certFile;

  @JsonKey(name: 'doctor_title')
  String doctorTitle;

  @JsonKey(name: 'doctor_level')
  int doctorLevel;

  @JsonKey(name: 'created_time')
  String createdTime;

  @JsonKey(name: 'cert_no')
  String certNo;

  @JsonKey(name: 'netHospital_id')
  String netHospitalId;

  @JsonKey(name: 'netHospital_name')
  String netHospitalName;

  @JsonKey(name: 'netdept_nameId')
  String netdeptNameId;

  @JsonKey(name: 'netdept_name')
  String netdeptName;

  @JsonKey(name: 'netdept_childId')
  String netdeptChildId;

  @JsonKey(name: 'netdept_child')
  String netdeptChild;

  @JsonKey(name: 'platdept_name')
  String platdeptName;

  @JsonKey(name: 'platdept_child')
  String platdeptChild;

  @JsonKey(name: 'pass_reason')
  String passReason;

  @JsonKey(name: 'tel')
  String tel;

  @JsonKey(name: 'photoDoc')
  String photoDoc;

  @JsonKey(name: 'qr_ticket')
  String qrTicket;

  @JsonKey(name: 'video_id')
  String videoId;

  @JsonKey(name: 'source')
  int source;

  @JsonKey(name: 'open_id')
  String openId;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'openid')
  String openid;

  @JsonKey(name: 'sign_status')
  int signStatus;

  @JsonKey(name: 'avartor')
  String avartor;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'passwd')
  String passwd;

  @JsonKey(name: 'salt_code')
  String saltCode;

  @JsonKey(name: 'isUpdate')
  int isUpdate;

  @JsonKey(name: 'firstLogin')
  int firstLogin;

  @JsonKey(name: 'messageStatus')
  int messageStatus;

  @JsonKey(name: 'workStatus')
  int workStatus;

  DocInfo(
    this.id,
    this.doctorId,
    this.name,
    this.idCard,
    this.hospitalName,
    this.depNameId,
    this.depName,
    this.depChildId,
    this.depChild,
    this.isPass,
    this.certFile,
    this.doctorTitle,
    this.doctorLevel,
    this.createdTime,
    this.certNo,
    this.netHospitalId,
    this.netHospitalName,
    this.netdeptNameId,
    this.netdeptName,
    this.netdeptChildId,
    this.netdeptChild,
    this.platdeptName,
    this.platdeptChild,
    this.passReason,
    this.tel,
    this.photoDoc,
    this.qrTicket,
    this.videoId,
    this.source,
    this.openId,
    this.channel,
    this.openid,
    this.signStatus,
    this.avartor,
    this.status,
    this.passwd,
    this.saltCode,
    this.isUpdate,
    this.firstLogin,
    this.messageStatus,
    this.workStatus,
  );

  factory DocInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$DocInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DocInfoToJson(this);
}

@JsonSerializable()
class LoginInfo extends Object {
  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'hospitalTag')
  String hospitalTag;

  LoginInfo(
    this.token,
    this.hospitalTag,
  );

  factory LoginInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$LoginInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);
}

@JsonSerializable()
class RegisterInfo extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'tel')
  String tel;

  @JsonKey(name: 'created_time')
  String createdTime;

  RegisterInfo(
    this.id,
    this.userId,
    this.token,
    this.nickname,
    this.tel,
    this.createdTime,
  );

  factory RegisterInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$RegisterInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RegisterInfoToJson(this);
}
