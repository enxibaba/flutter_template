import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/login/widgets/my_text_field.dart';
import 'package:flutter_demo/res/constant.dart';
import 'package:flutter_demo/res/resources.dart';
import 'package:flutter_demo/routers/fluro_navigator.dart';
import 'package:flutter_demo/widgets/my_app_bar.dart';
import 'package:flutter_demo/widgets/my_button.dart';
import 'package:sp_util/sp_util.dart';

import '../login_router.dart';

/// design/1注册登录/index.html
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      /// 显示状态栏和导航栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          isBack: false,
          onPressed: () {
            // NavigatorUtils.push(context, LoginRouter.smsLoginPage);
          },
        ),
        body: Container(
          child: Text("login_page"),
        ));
  }
}
