import 'package:flutter_demo/generated/json/base/json_convert_content.dart';
import 'package:flutter_demo/tab/consultation_room/model/home_status_entity.dart';

HomeStatusEntity $HomeStatusEntityFromJson(Map<String, dynamic> json) {
	HomeStatusEntity homeStatusEntity = HomeStatusEntity();
	var info = jsonConvert.convert<HomeStatusInfo>(json['info']);
	if (info != null) {
		homeStatusEntity.info = info;
	}
	return homeStatusEntity;
}

Map<String, dynamic> $HomeStatusEntityToJson(HomeStatusEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['info'] = entity.info?.toJson();
	return data;
}

HomeStatusInfo $HomeStatusInfoFromJson(Map<String, dynamic> json) {
	HomeStatusInfo homeStatusInfo = HomeStatusInfo();
	var referralCount = jsonConvert.convert<int>(json['referralCount']);
	if (referralCount != null) {
		homeStatusInfo.referralCount = referralCount;
	}
	var consultCount = jsonConvert.convert<int>(json['consultCount']);
	if (consultCount != null) {
		homeStatusInfo.consultCount = consultCount;
	}
	var msgInfo = jsonConvert.convert<HomeStatusInfoMsgInfo>(json['msgInfo']);
	if (msgInfo != null) {
		homeStatusInfo.msgInfo = msgInfo;
	}
	var waitAcceptOrderCount = jsonConvert.convert<int>(json['waitAcceptOrderCount']);
	if (waitAcceptOrderCount != null) {
		homeStatusInfo.waitAcceptOrderCount = waitAcceptOrderCount;
	}
	var menulist = jsonConvert.convertListNotNull<HomeStatusInfoMenulist>(json['menulist']);
	if (menulist != null) {
		homeStatusInfo.menulist = menulist;
	}
	var queryPrescriptionNum = jsonConvert.convert<int>(json['queryPrescriptionNum']);
	if (queryPrescriptionNum != null) {
		homeStatusInfo.queryPrescriptionNum = queryPrescriptionNum;
	}
	return homeStatusInfo;
}

Map<String, dynamic> $HomeStatusInfoToJson(HomeStatusInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['referralCount'] = entity.referralCount;
	data['consultCount'] = entity.consultCount;
	data['msgInfo'] = entity.msgInfo?.toJson();
	data['waitAcceptOrderCount'] = entity.waitAcceptOrderCount;
	data['menulist'] =  entity.menulist?.map((v) => v.toJson()).toList();
	data['queryPrescriptionNum'] = entity.queryPrescriptionNum;
	return data;
}

HomeStatusInfoMsgInfo $HomeStatusInfoMsgInfoFromJson(Map<String, dynamic> json) {
	HomeStatusInfoMsgInfo homeStatusInfoMsgInfo = HomeStatusInfoMsgInfo();
	var sysId = jsonConvert.convert<String>(json['sysId']);
	if (sysId != null) {
		homeStatusInfoMsgInfo.sysId = sysId;
	}
	var tag = jsonConvert.convert<String>(json['tag']);
	if (tag != null) {
		homeStatusInfoMsgInfo.tag = tag;
	}
	var title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		homeStatusInfoMsgInfo.title = title;
	}
	var detail = jsonConvert.convert<String>(json['detail']);
	if (detail != null) {
		homeStatusInfoMsgInfo.detail = detail;
	}
	var time = jsonConvert.convert<String>(json['time']);
	if (time != null) {
		homeStatusInfoMsgInfo.time = time;
	}
	return homeStatusInfoMsgInfo;
}

Map<String, dynamic> $HomeStatusInfoMsgInfoToJson(HomeStatusInfoMsgInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['sysId'] = entity.sysId;
	data['tag'] = entity.tag;
	data['title'] = entity.title;
	data['detail'] = entity.detail;
	data['time'] = entity.time;
	return data;
}

HomeStatusInfoMenulist $HomeStatusInfoMenulistFromJson(Map<String, dynamic> json) {
	HomeStatusInfoMenulist homeStatusInfoMenulist = HomeStatusInfoMenulist();
	var id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		homeStatusInfoMenulist.id = id;
	}
	var cateId = jsonConvert.convert<int>(json['cateId']);
	if (cateId != null) {
		homeStatusInfoMenulist.cateId = cateId;
	}
	var isOpen = jsonConvert.convert<int>(json['isOpen']);
	if (isOpen != null) {
		homeStatusInfoMenulist.isOpen = isOpen;
	}
	var menuTitle = jsonConvert.convert<String>(json['menuTitle']);
	if (menuTitle != null) {
		homeStatusInfoMenulist.menuTitle = menuTitle;
	}
	var maxImage = jsonConvert.convert<String>(json['maxImage']);
	if (maxImage != null) {
		homeStatusInfoMenulist.maxImage = maxImage;
	}
	var thumbImage = jsonConvert.convert<String>(json['thumbImage']);
	if (thumbImage != null) {
		homeStatusInfoMenulist.thumbImage = thumbImage;
	}
	var maxImageClose = jsonConvert.convert<String>(json['maxImageClose']);
	if (maxImageClose != null) {
		homeStatusInfoMenulist.maxImageClose = maxImageClose;
	}
	var thumbImageClose = jsonConvert.convert<String>(json['thumbImageClose']);
	if (thumbImageClose != null) {
		homeStatusInfoMenulist.thumbImageClose = thumbImageClose;
	}
	var unReadCount = jsonConvert.convert<int>(json['unReadCount']);
	if (unReadCount != null) {
		homeStatusInfoMenulist.unReadCount = unReadCount;
	}
	return homeStatusInfoMenulist;
}

Map<String, dynamic> $HomeStatusInfoMenulistToJson(HomeStatusInfoMenulist entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['cateId'] = entity.cateId;
	data['isOpen'] = entity.isOpen;
	data['menuTitle'] = entity.menuTitle;
	data['maxImage'] = entity.maxImage;
	data['thumbImage'] = entity.thumbImage;
	data['maxImageClose'] = entity.maxImageClose;
	data['thumbImageClose'] = entity.thumbImageClose;
	data['unReadCount'] = entity.unReadCount;
	return data;
}