import 'package:fluro/fluro.dart';
import 'package:flutter_demo/login/page/login_page.dart';
import 'package:flutter_demo/login/page/sms_login_page.dart';
import 'package:flutter_demo/routers/i_router.dart';

class LoginRouter implements IRouterProvider {
  static String loginPage = '/login';
  static String smsLoginPage = '/smsLoginPage';
  @override
  void initRouter(FluroRouter router) {
    router.define(loginPage,
        handler: Handler(handlerFunc: (_, __) => const LoginPage()));
    router.define(smsLoginPage,
        handler: Handler(handlerFunc: (_, __) => const SmsLoginPage()));
  }
}
