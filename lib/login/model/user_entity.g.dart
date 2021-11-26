// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      UserModel.fromJson(json['list'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      DocInfo.fromJson(json['docInfo'] as Map<String, dynamic>),
      LoginInfo.fromJson(json['loginInfo'] as Map<String, dynamic>),
      RegisterInfo.fromJson(json['registerInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'docInfo': instance.docInfo,
      'loginInfo': instance.loginInfo,
      'registerInfo': instance.registerInfo,
    };

DocInfo _$DocInfoFromJson(Map<String, dynamic> json) => DocInfo(
      json['id'] as String,
      json['doctor_id'] as String,
      json['name'] as String,
      json['id_card'] as String,
      json['hospital_name'] as String,
      json['dep_nameId'] as String,
      json['dep_name'] as String,
      json['dep_childId'] as String,
      json['dep_child'] as String,
      json['is_pass'] as String,
      json['cert_file'] as String,
      json['doctor_title'] as String,
      json['doctor_level'] as int,
      json['created_time'] as String,
      json['cert_no'] as String,
      json['netHospital_id'] as String,
      json['netHospital_name'] as String,
      json['netdept_nameId'] as String,
      json['netdept_name'] as String,
      json['netdept_childId'] as String,
      json['netdept_child'] as String,
      json['platdept_name'] as String,
      json['platdept_child'] as String,
      json['pass_reason'] as String,
      json['tel'] as String,
      json['photoDoc'] as String,
      json['qr_ticket'] as String,
      json['video_id'] as String,
      json['source'] as int,
      json['open_id'] as String,
      json['channel'] as String,
      json['openid'] as String,
      json['sign_status'] as int,
      json['avartor'] as String,
      json['status'] as int,
      json['passwd'] as String,
      json['salt_code'] as String,
      json['isUpdate'] as int,
      json['firstLogin'] as int,
      json['messageStatus'] as int,
      json['workStatus'] as int,
    );

Map<String, dynamic> _$DocInfoToJson(DocInfo instance) => <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctorId,
      'name': instance.name,
      'id_card': instance.idCard,
      'hospital_name': instance.hospitalName,
      'dep_nameId': instance.depNameId,
      'dep_name': instance.depName,
      'dep_childId': instance.depChildId,
      'dep_child': instance.depChild,
      'is_pass': instance.isPass,
      'cert_file': instance.certFile,
      'doctor_title': instance.doctorTitle,
      'doctor_level': instance.doctorLevel,
      'created_time': instance.createdTime,
      'cert_no': instance.certNo,
      'netHospital_id': instance.netHospitalId,
      'netHospital_name': instance.netHospitalName,
      'netdept_nameId': instance.netdeptNameId,
      'netdept_name': instance.netdeptName,
      'netdept_childId': instance.netdeptChildId,
      'netdept_child': instance.netdeptChild,
      'platdept_name': instance.platdeptName,
      'platdept_child': instance.platdeptChild,
      'pass_reason': instance.passReason,
      'tel': instance.tel,
      'photoDoc': instance.photoDoc,
      'qr_ticket': instance.qrTicket,
      'video_id': instance.videoId,
      'source': instance.source,
      'open_id': instance.openId,
      'channel': instance.channel,
      'openid': instance.openid,
      'sign_status': instance.signStatus,
      'avartor': instance.avartor,
      'status': instance.status,
      'passwd': instance.passwd,
      'salt_code': instance.saltCode,
      'isUpdate': instance.isUpdate,
      'firstLogin': instance.firstLogin,
      'messageStatus': instance.messageStatus,
      'workStatus': instance.workStatus,
    };

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) => LoginInfo(
      json['token'] as String,
      json['hospitalTag'] as String,
    );

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
      'token': instance.token,
      'hospitalTag': instance.hospitalTag,
    };

RegisterInfo _$RegisterInfoFromJson(Map<String, dynamic> json) => RegisterInfo(
      json['id'] as String,
      json['user_id'] as String,
      json['token'] as String,
      json['nickname'] as String,
      json['tel'] as String,
      json['created_time'] as String,
    );

Map<String, dynamic> _$RegisterInfoToJson(RegisterInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'token': instance.token,
      'nickname': instance.nickname,
      'tel': instance.tel,
      'created_time': instance.createdTime,
    };
