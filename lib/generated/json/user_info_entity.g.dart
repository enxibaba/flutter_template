import 'package:flutter_demo/generated/json/base/json_convert_content.dart';
import 'package:flutter_demo/login/model/user_info_entity.dart';

UserInfoEntity $UserInfoEntityFromJson(Map<String, dynamic> json) {
	UserInfoEntity userInfoEntity = UserInfoEntity();
	var list = jsonConvert.convert<UserInfoList>(json['list']);
	if (list != null) {
		userInfoEntity.list = list;
	}
	return userInfoEntity;
}

Map<String, dynamic> $UserInfoEntityToJson(UserInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['list'] = entity.list?.toJson();
	return data;
}

UserInfoList $UserInfoListFromJson(Map<String, dynamic> json) {
	UserInfoList userInfoList = UserInfoList();
	var docInfo = jsonConvert.convert<UserInfoListDocInfo>(json['docInfo']);
	if (docInfo != null) {
		userInfoList.docInfo = docInfo;
	}
	var loginInfo = jsonConvert.convert<UserInfoListLoginInfo>(json['loginInfo']);
	if (loginInfo != null) {
		userInfoList.loginInfo = loginInfo;
	}
	var registerInfo = jsonConvert.convert<UserInfoListRegisterInfo>(json['registerInfo']);
	if (registerInfo != null) {
		userInfoList.registerInfo = registerInfo;
	}
	return userInfoList;
}

Map<String, dynamic> $UserInfoListToJson(UserInfoList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['docInfo'] = entity.docInfo?.toJson();
	data['loginInfo'] = entity.loginInfo?.toJson();
	data['registerInfo'] = entity.registerInfo?.toJson();
	return data;
}

UserInfoListDocInfo $UserInfoListDocInfoFromJson(Map<String, dynamic> json) {
	UserInfoListDocInfo userInfoListDocInfo = UserInfoListDocInfo();
	var doctorLevel = jsonConvert.convert<int>(json['doctor_level']);
	if (doctorLevel != null) {
		userInfoListDocInfo.doctorLevel = doctorLevel;
	}
	var netdeptNameid = jsonConvert.convert<String>(json['netdept_nameId']);
	if (netdeptNameid != null) {
		userInfoListDocInfo.netdeptNameid = netdeptNameid;
	}
	var netdeptChild = jsonConvert.convert<String>(json['netdept_child']);
	if (netdeptChild != null) {
		userInfoListDocInfo.netdeptChild = netdeptChild;
	}
	var id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userInfoListDocInfo.id = id;
	}
	var netdeptName = jsonConvert.convert<String>(json['netdept_name']);
	if (netdeptName != null) {
		userInfoListDocInfo.netdeptName = netdeptName;
	}
	var depNameid = jsonConvert.convert<String>(json['dep_nameId']);
	if (depNameid != null) {
		userInfoListDocInfo.depNameid = depNameid;
	}
	var hospitalName = jsonConvert.convert<String>(json['hospital_name']);
	if (hospitalName != null) {
		userInfoListDocInfo.hospitalName = hospitalName;
	}
	var certFile = jsonConvert.convert<String>(json['cert_file']);
	if (certFile != null) {
		userInfoListDocInfo.certFile = certFile;
	}
	var platdeptName = jsonConvert.convert<String>(json['platdept_name']);
	if (platdeptName != null) {
		userInfoListDocInfo.platdeptName = platdeptName;
	}
	var nethospitalId = jsonConvert.convert<String>(json['netHospital_id']);
	if (nethospitalId != null) {
		userInfoListDocInfo.nethospitalId = nethospitalId;
	}
	var isUpdate = jsonConvert.convert<int>(json['isUpdate']);
	if (isUpdate != null) {
		userInfoListDocInfo.isUpdate = isUpdate;
	}
	var doctorTitle = jsonConvert.convert<String>(json['doctor_title']);
	if (doctorTitle != null) {
		userInfoListDocInfo.doctorTitle = doctorTitle;
	}
	var openId = jsonConvert.convert<String>(json['open_id']);
	if (openId != null) {
		userInfoListDocInfo.openId = openId;
	}
	var depChild = jsonConvert.convert<String>(json['dep_child']);
	if (depChild != null) {
		userInfoListDocInfo.depChild = depChild;
	}
	var tel = jsonConvert.convert<String>(json['tel']);
	if (tel != null) {
		userInfoListDocInfo.tel = tel;
	}
	var doctorId = jsonConvert.convert<String>(json['doctor_id']);
	if (doctorId != null) {
		userInfoListDocInfo.doctorId = doctorId;
	}
	var updatedTime = jsonConvert.convert<dynamic>(json['updated_time']);
	if (updatedTime != null) {
		userInfoListDocInfo.updatedTime = updatedTime;
	}
	var platdeptChild = jsonConvert.convert<String>(json['platdept_child']);
	if (platdeptChild != null) {
		userInfoListDocInfo.platdeptChild = platdeptChild;
	}
	var videoId = jsonConvert.convert<String>(json['video_id']);
	if (videoId != null) {
		userInfoListDocInfo.videoId = videoId;
	}
	var channel = jsonConvert.convert<String>(json['channel']);
	if (channel != null) {
		userInfoListDocInfo.channel = channel;
	}
	var idCard = jsonConvert.convert<String>(json['id_card']);
	if (idCard != null) {
		userInfoListDocInfo.idCard = idCard;
	}
	var certNo = jsonConvert.convert<String>(json['cert_no']);
	if (certNo != null) {
		userInfoListDocInfo.certNo = certNo;
	}
	var xSource = jsonConvert.convert<int>(json['source']);
	if (xSource != null) {
		userInfoListDocInfo.xSource = xSource;
	}
	var messageStatus = jsonConvert.convert<int>(json['messageStatus']);
	if (messageStatus != null) {
		userInfoListDocInfo.messageStatus = messageStatus;
	}
	var name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		userInfoListDocInfo.name = name;
	}
	var certTime = jsonConvert.convert<dynamic>(json['cert_time']);
	if (certTime != null) {
		userInfoListDocInfo.certTime = certTime;
	}
	var doctorCode = jsonConvert.convert<dynamic>(json['doctor_code']);
	if (doctorCode != null) {
		userInfoListDocInfo.doctorCode = doctorCode;
	}
	var photoDoc = jsonConvert.convert<String>(json['photoDoc']);
	if (photoDoc != null) {
		userInfoListDocInfo.photoDoc = photoDoc;
	}
	var status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		userInfoListDocInfo.status = status;
	}
	var avartor = jsonConvert.convert<String>(json['avartor']);
	if (avartor != null) {
		userInfoListDocInfo.avartor = avartor;
	}
	var workStatus = jsonConvert.convert<int>(json['workStatus']);
	if (workStatus != null) {
		userInfoListDocInfo.workStatus = workStatus;
	}
	var isPass = jsonConvert.convert<String>(json['is_pass']);
	if (isPass != null) {
		userInfoListDocInfo.isPass = isPass;
	}
	var hospitalLevel = jsonConvert.convert<dynamic>(json['hospital_level']);
	if (hospitalLevel != null) {
		userInfoListDocInfo.hospitalLevel = hospitalLevel;
	}
	var nethospitalName = jsonConvert.convert<String>(json['netHospital_name']);
	if (nethospitalName != null) {
		userInfoListDocInfo.nethospitalName = nethospitalName;
	}
	var qrTicket = jsonConvert.convert<String>(json['qr_ticket']);
	if (qrTicket != null) {
		userInfoListDocInfo.qrTicket = qrTicket;
	}
	var signStatus = jsonConvert.convert<int>(json['sign_status']);
	if (signStatus != null) {
		userInfoListDocInfo.signStatus = signStatus;
	}
	var firstLogin = jsonConvert.convert<int>(json['firstLogin']);
	if (firstLogin != null) {
		userInfoListDocInfo.firstLogin = firstLogin;
	}
	var openid = jsonConvert.convert<String>(json['openid']);
	if (openid != null) {
		userInfoListDocInfo.openid = openid;
	}
	var passReason = jsonConvert.convert<String>(json['pass_reason']);
	if (passReason != null) {
		userInfoListDocInfo.passReason = passReason;
	}
	var depChildid = jsonConvert.convert<String>(json['dep_childId']);
	if (depChildid != null) {
		userInfoListDocInfo.depChildid = depChildid;
	}
	var createdTime = jsonConvert.convert<String>(json['created_time']);
	if (createdTime != null) {
		userInfoListDocInfo.createdTime = createdTime;
	}
	var saltCode = jsonConvert.convert<String>(json['salt_code']);
	if (saltCode != null) {
		userInfoListDocInfo.saltCode = saltCode;
	}
	var depName = jsonConvert.convert<String>(json['dep_name']);
	if (depName != null) {
		userInfoListDocInfo.depName = depName;
	}
	var passwd = jsonConvert.convert<String>(json['passwd']);
	if (passwd != null) {
		userInfoListDocInfo.passwd = passwd;
	}
	var netdeptChildid = jsonConvert.convert<String>(json['netdept_childId']);
	if (netdeptChildid != null) {
		userInfoListDocInfo.netdeptChildid = netdeptChildid;
	}
	return userInfoListDocInfo;
}

Map<String, dynamic> $UserInfoListDocInfoToJson(UserInfoListDocInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['doctor_level'] = entity.doctorLevel;
	data['netdept_nameId'] = entity.netdeptNameid;
	data['netdept_child'] = entity.netdeptChild;
	data['id'] = entity.id;
	data['netdept_name'] = entity.netdeptName;
	data['dep_nameId'] = entity.depNameid;
	data['hospital_name'] = entity.hospitalName;
	data['cert_file'] = entity.certFile;
	data['platdept_name'] = entity.platdeptName;
	data['netHospital_id'] = entity.nethospitalId;
	data['isUpdate'] = entity.isUpdate;
	data['doctor_title'] = entity.doctorTitle;
	data['open_id'] = entity.openId;
	data['dep_child'] = entity.depChild;
	data['tel'] = entity.tel;
	data['doctor_id'] = entity.doctorId;
	data['updated_time'] = entity.updatedTime;
	data['platdept_child'] = entity.platdeptChild;
	data['video_id'] = entity.videoId;
	data['channel'] = entity.channel;
	data['id_card'] = entity.idCard;
	data['cert_no'] = entity.certNo;
	data['source'] = entity.xSource;
	data['messageStatus'] = entity.messageStatus;
	data['name'] = entity.name;
	data['cert_time'] = entity.certTime;
	data['doctor_code'] = entity.doctorCode;
	data['photoDoc'] = entity.photoDoc;
	data['status'] = entity.status;
	data['avartor'] = entity.avartor;
	data['workStatus'] = entity.workStatus;
	data['is_pass'] = entity.isPass;
	data['hospital_level'] = entity.hospitalLevel;
	data['netHospital_name'] = entity.nethospitalName;
	data['qr_ticket'] = entity.qrTicket;
	data['sign_status'] = entity.signStatus;
	data['firstLogin'] = entity.firstLogin;
	data['openid'] = entity.openid;
	data['pass_reason'] = entity.passReason;
	data['dep_childId'] = entity.depChildid;
	data['created_time'] = entity.createdTime;
	data['salt_code'] = entity.saltCode;
	data['dep_name'] = entity.depName;
	data['passwd'] = entity.passwd;
	data['netdept_childId'] = entity.netdeptChildid;
	return data;
}

UserInfoListLoginInfo $UserInfoListLoginInfoFromJson(Map<String, dynamic> json) {
	UserInfoListLoginInfo userInfoListLoginInfo = UserInfoListLoginInfo();
	var token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		userInfoListLoginInfo.token = token;
	}
	var hospitalTag = jsonConvert.convert<String>(json['hospitalTag']);
	if (hospitalTag != null) {
		userInfoListLoginInfo.hospitalTag = hospitalTag;
	}
	return userInfoListLoginInfo;
}

Map<String, dynamic> $UserInfoListLoginInfoToJson(UserInfoListLoginInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['token'] = entity.token;
	data['hospitalTag'] = entity.hospitalTag;
	return data;
}

UserInfoListRegisterInfo $UserInfoListRegisterInfoFromJson(Map<String, dynamic> json) {
	UserInfoListRegisterInfo userInfoListRegisterInfo = UserInfoListRegisterInfo();
	var createdTime = jsonConvert.convert<String>(json['created_time']);
	if (createdTime != null) {
		userInfoListRegisterInfo.createdTime = createdTime;
	}
	var id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userInfoListRegisterInfo.id = id;
	}
	var userId = jsonConvert.convert<String>(json['user_id']);
	if (userId != null) {
		userInfoListRegisterInfo.userId = userId;
	}
	var nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		userInfoListRegisterInfo.nickname = nickname;
	}
	var token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		userInfoListRegisterInfo.token = token;
	}
	var tel = jsonConvert.convert<String>(json['tel']);
	if (tel != null) {
		userInfoListRegisterInfo.tel = tel;
	}
	return userInfoListRegisterInfo;
}

Map<String, dynamic> $UserInfoListRegisterInfoToJson(UserInfoListRegisterInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['created_time'] = entity.createdTime;
	data['id'] = entity.id;
	data['user_id'] = entity.userId;
	data['nickname'] = entity.nickname;
	data['token'] = entity.token;
	data['tel'] = entity.tel;
	return data;
}