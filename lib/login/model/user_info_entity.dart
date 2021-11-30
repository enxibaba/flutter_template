import 'dart:convert';
import 'package:flutter_demo/generated/json/base/json_field.dart';
import 'package:flutter_demo/generated/json/user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {

	UserInfoList? list;
  
  UserInfoEntity();

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) => $UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoList {

	UserInfoListDocInfo? docInfo;
	UserInfoListLoginInfo? loginInfo;
	UserInfoListRegisterInfo? registerInfo;
  
  UserInfoList();

  factory UserInfoList.fromJson(Map<String, dynamic> json) => $UserInfoListFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoListDocInfo {

	@JSONField(name: "doctor_level")
	int? doctorLevel;
	@JSONField(name: "netdept_nameId")
	String? netdeptNameid;
	@JSONField(name: "netdept_child")
	String? netdeptChild;
	String? id;
	@JSONField(name: "netdept_name")
	String? netdeptName;
	@JSONField(name: "dep_nameId")
	String? depNameid;
	@JSONField(name: "hospital_name")
	String? hospitalName;
	@JSONField(name: "cert_file")
	String? certFile;
	@JSONField(name: "platdept_name")
	String? platdeptName;
	@JSONField(name: "netHospital_id")
	String? nethospitalId;
	int? isUpdate;
	@JSONField(name: "doctor_title")
	String? doctorTitle;
	@JSONField(name: "open_id")
	String? openId;
	@JSONField(name: "dep_child")
	String? depChild;
	String? tel;
	@JSONField(name: "doctor_id")
	String? doctorId;
	@JSONField(name: "updated_time")
	dynamic? updatedTime;
	@JSONField(name: "platdept_child")
	String? platdeptChild;
	@JSONField(name: "video_id")
	String? videoId;
	String? channel;
	@JSONField(name: "id_card")
	String? idCard;
	@JSONField(name: "cert_no")
	String? certNo;
	@JSONField(name: "source")
	int? xSource;
	int? messageStatus;
	String? name;
	@JSONField(name: "cert_time")
	dynamic? certTime;
	@JSONField(name: "doctor_code")
	dynamic? doctorCode;
	String? photoDoc;
	int? status;
	String? avartor;
	int? workStatus;
	@JSONField(name: "is_pass")
	String? isPass;
	@JSONField(name: "hospital_level")
	dynamic? hospitalLevel;
	@JSONField(name: "netHospital_name")
	String? nethospitalName;
	@JSONField(name: "qr_ticket")
	String? qrTicket;
	@JSONField(name: "sign_status")
	int? signStatus;
	int? firstLogin;
	String? openid;
	@JSONField(name: "pass_reason")
	String? passReason;
	@JSONField(name: "dep_childId")
	String? depChildid;
	@JSONField(name: "created_time")
	String? createdTime;
	@JSONField(name: "salt_code")
	String? saltCode;
	@JSONField(name: "dep_name")
	String? depName;
	String? passwd;
	@JSONField(name: "netdept_childId")
	String? netdeptChildid;
  
  UserInfoListDocInfo();

  factory UserInfoListDocInfo.fromJson(Map<String, dynamic> json) => $UserInfoListDocInfoFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoListDocInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoListLoginInfo {

	String? token;
	String? hospitalTag;
  
  UserInfoListLoginInfo();

  factory UserInfoListLoginInfo.fromJson(Map<String, dynamic> json) => $UserInfoListLoginInfoFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoListLoginInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoListRegisterInfo {

	@JSONField(name: "created_time")
	String? createdTime;
	String? id;
	@JSONField(name: "user_id")
	String? userId;
	String? nickname;
	String? token;
	String? tel;
  
  UserInfoListRegisterInfo();

  factory UserInfoListRegisterInfo.fromJson(Map<String, dynamic> json) => $UserInfoListRegisterInfoFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoListRegisterInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}