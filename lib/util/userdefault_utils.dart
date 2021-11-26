import 'package:flustars/flustars.dart';
import 'package:flutter_demo/login/model/user_entity.dart';
import 'package:flutter_demo/res/constant.dart';

class UserDefaultUtils {
  static void synchInfo(UserEntity info) {
    final UserModel model = info.list;
    SpUtil.putString('doctorId', model.docInfo.doctorId);
    SpUtil.putString('dockerName', model.docInfo.name);
    SpUtil.putString('dockerTitle', model.docInfo.doctorTitle);
    SpUtil.putString('netHospitalName', model.docInfo.netHospitalName);
    SpUtil.putString('netHospitalId', model.docInfo.netHospitalId);
    SpUtil.putString('netdeptChild', model.docInfo.netdeptChild);
    SpUtil.putString('netdeptChildId', model.docInfo.netdeptChildId);
    SpUtil.putString('netdeptName', model.docInfo.netdeptName);
    SpUtil.putString('netdeptNameId', model.docInfo.netdeptNameId);
    SpUtil.putString('tel', model.docInfo.tel);
    SpUtil.putString('openId', model.docInfo.openId);
    SpUtil.putInt('signStatus', model.docInfo.signStatus);
    SpUtil.putString('photoDoc', model.docInfo.photoDoc);
    SpUtil.putString('certNo', model.docInfo.certNo);
    SpUtil.putInt('messageStatus', model.docInfo.messageStatus);
    SpUtil.putInt('firstLogin', model.docInfo.firstLogin);
    SpUtil.putString('isPass', model.docInfo.isPass);
    SpUtil.putString(Constant.accessToken, model.loginInfo.token);
    SpUtil.putString('netEasyToken', model.registerInfo.token);
  }

  static void removeAllInfo() {
    final String? phone = UserDefaultUtils.tel;
    SpUtil.clear();
    SpUtil.putString('tel', phone ?? '');
  }

  /// Token
  static String? get token => SpUtil.getString(Constant.accessToken);

  /// 医生ID
  static String? get doctorId => SpUtil.getString('doctorId');

  /// 医生姓名
  static String? get dockerName => SpUtil.getString('dockerName');

  /// 医生头像
  static String? get photoDoc => SpUtil.getString('photoDoc');

  /// 医生电话
  static String? get tel => SpUtil.getString('tel');

  /// 医生医网签openId
  static String? get openId => SpUtil.getString('openId');

  /// 医生医网签signStatus
  static int? get signStatus => SpUtil.getInt('signStatus');

  /// 医生状态
  static String? get isPass => SpUtil.getString('isPass');

  /// 医生状态
  static int? get firstLogin => SpUtil.getInt('firstLogin');

  /// 职称
  static String? get dockerTitle => SpUtil.getString('dockerTitle');

  /// 互联网医院名称
  static String? get netHospitalName => SpUtil.getString('netHospitalName');

  /// 互联网医院ID
  static String? get netHospitalId => SpUtil.getString('netHospitalId');

  /// 互联网一级科室
  static String? get netdeptChild => SpUtil.getString('netdeptChild');

  /// 互联网一级科室ID
  static String? get netdeptChildId => SpUtil.getString('netdeptChildId');
}
