import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/widgets/token_invalid_dialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Toast工具类
class Toast {
  static void showExitLogin() {
    final BuildContext? context = MyApp.navigatorKey.currentContext;
    if (context != null) {
      showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (_) => const TokenInvalidDialog());
    }
  }

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
