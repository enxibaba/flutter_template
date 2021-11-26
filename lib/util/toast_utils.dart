import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Toast工具类
class Toast {
  static void show(String? msg) {
    if (msg == null) {
      return;
    }
    EasyLoading.showToast(msg);
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }

  static void showLoading(String? msg) {
    EasyLoading.show(status: msg ?? '加载中');
  }
}
