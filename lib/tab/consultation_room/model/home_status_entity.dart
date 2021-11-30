import 'dart:convert';
import 'package:flutter_demo/generated/json/base/json_field.dart';
import 'package:flutter_demo/generated/json/home_status_entity.g.dart';

@JsonSerializable()
class HomeStatusEntity {

	HomeStatusInfo? info;
  
  HomeStatusEntity();

  factory HomeStatusEntity.fromJson(Map<String, dynamic> json) => $HomeStatusEntityFromJson(json);

  Map<String, dynamic> toJson() => $HomeStatusEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeStatusInfo {

	int? referralCount;
	int? consultCount;
	HomeStatusInfoMsgInfo? msgInfo;
	int? waitAcceptOrderCount;
	List<HomeStatusInfoMenulist>? menulist;
	int? queryPrescriptionNum;
  
  HomeStatusInfo();

  factory HomeStatusInfo.fromJson(Map<String, dynamic> json) => $HomeStatusInfoFromJson(json);

  Map<String, dynamic> toJson() => $HomeStatusInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeStatusInfoMsgInfo {

	String? sysId;
	String? tag;
	String? title;
	String? detail;
	String? time;
  
  HomeStatusInfoMsgInfo();

  factory HomeStatusInfoMsgInfo.fromJson(Map<String, dynamic> json) => $HomeStatusInfoMsgInfoFromJson(json);

  Map<String, dynamic> toJson() => $HomeStatusInfoMsgInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeStatusInfoMenulist {

	int? id;
	int? cateId;
	int? isOpen;
	String? menuTitle;
	String? maxImage;
	String? thumbImage;
	String? maxImageClose;
	String? thumbImageClose;
	int? unReadCount;
  
  HomeStatusInfoMenulist();

  factory HomeStatusInfoMenulist.fromJson(Map<String, dynamic> json) => $HomeStatusInfoMenulistFromJson(json);

  Map<String, dynamic> toJson() => $HomeStatusInfoMenulistToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}