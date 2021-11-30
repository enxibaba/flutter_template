import 'package:flutter_demo/generated/json/base/json_convert_content.dart';
import 'package:flutter_demo/net/error_handle.dart';
import 'package:flutter_demo/res/constant.dart';
import 'package:flutter_demo/util/toast_utils.dart';
import 'package:flutter_demo/util/userdefault_utils.dart';

class BaseEntity {
  BaseEntity(this.code, this.message, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[Constant.code] as int?;

    /// 当前项目通过拦截 data[code] = 601
    if (code == ExceptionHandle.token_invalid) {
      UserDefaultUtils.removeAllInfo();
      Toast.showExitLogin();
    }

    message = json[Constant.message] as String;

    data = json[Constant.data] as Map<String, dynamic>;
  }

  int? code;
  late String message;
  Map<String, dynamic>? data;

  // T _generateOBJ<O>(Object json) {
  //   if (T.toString() == 'String') {
  //     return json.toString() as T;
  //   } else if (T.toString() == 'Map<dynamic, dynamic>') {
  //     return json as T;
  //   } else {
  //     /// List类型数据由fromJsonAsT判断处理
  //     return JsonConvert.fromJsonAsT<T>(json);
  //   }
  // }
}
