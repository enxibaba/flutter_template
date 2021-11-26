import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/login/model/user_entity.dart';
import 'package:flutter_demo/login/widgets/my_text_field.dart';
import 'package:flutter_demo/net/net.dart';
import 'package:flutter_demo/res/constant.dart';
import 'package:flutter_demo/res/resources.dart';
import 'package:flutter_demo/routers/fluro_navigator.dart';
import 'package:flutter_demo/routers/routers.dart';
import 'package:flutter_demo/util/change_notifier_manage.dart';
import 'package:flutter_demo/util/log_utils.dart';
import 'package:flutter_demo/util/other_utils.dart';
import 'package:flutter_demo/util/theme_utils.dart';
import 'package:flutter_demo/util/toast_utils.dart';
import 'package:flutter_demo/util/userdefault_utils.dart';
import 'package:flutter_demo/widgets/my_app_bar.dart';
import 'package:flutter_demo/widgets/my_button.dart';
import 'package:flutter_demo/widgets/my_scroll_view.dart';
import 'package:sp_util/sp_util.dart';

import '../login_router.dart';

/// design/1注册登录/index.html
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with ChangeNotifierMixin<LoginPage> {
  // 定义一个controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeName = FocusNode();
  final FocusNode _nodePwd = FocusNode();
  bool _clickable = false;

  @override
  Map<ChangeNotifier, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> callbacks = <VoidCallback>[_verify];
    return <ChangeNotifier, List<VoidCallback>?>{
      _nameController: callbacks,
      _passwordController: callbacks,
      _nodeName: null,
      _nodePwd: null,
    };
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      /// 显示状态栏和导航栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });

    _nameController.text = SpUtil.getString(Constant.phone) ?? '';
  }

  /// 验证输入
  void _verify() {
    final String name = _nameController.text;
    final String password = _passwordController.text;
    bool clickable = true;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
    }
    if (password.isEmpty || password.length < 6) {
      clickable = false;
    }

    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  Future<void> _login() async {
    final String name = _nameController.text;
    final String password = _passwordController.text;
    Toast.showLoading('登录中');
    await DioUtils.instance.requestFormNetwork<UserEntity>(
        Method.post, HttpApi.pwdLogin,
        params: {'tel': name, 'password': password}, onSuccess: (data) async {
      if (data != null) {
        UserDefaultUtils.synchInfo(data);
        Toast.dismiss();
        NavigatorUtils.push(context, Routes.home, replace: true);
      } else {
        Toast.dismiss();
      }
    }, onError: (_, __) {
      Toast.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDark;

    return Scaffold(
        appBar: const MyAppBar(isBack: false),
        body: MyScrollView(
          keyboardConfig: Utils.getKeyboardActionsConfig(
              context, <FocusNode>[_nodeName, _nodePwd]),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
          children: _buildBody,
          bottomButton: _textWidget(context, isDark),
        ));
  }

  RichText _textWidget(BuildContext context, bool isDark) {
    final Color textColor =
        isDark ? Colours.dark_text_secondary : Colours.text_secondary;
    final Color mainColor = isDark ? Colours.dark_app_main : Colours.app_main;

    return RichText(
      text: TextSpan(children: [
        TextSpan(text: '登录即代表你已同意', style: TextStyle(color: textColor)),
        TextSpan(
            text: '《用户协议》',
            style: TextStyle(color: mainColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () => NavigatorUtils.goWebViewPage(
                  context, '用户协议', Constant.userAgreement)),
        TextSpan(text: '及', style: TextStyle(color: textColor)),
        TextSpan(
            text: '《隐私政策》',
            style: TextStyle(color: mainColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () => NavigatorUtils.goWebViewPage(
                  context, '隐私政策', Constant.privacyAgreement))
      ], style: const TextStyle(fontSize: 12)),
    );
  }

  List<Widget> get _buildBody => <Widget>[
        const Text(
          '用户名密码登录',
          style: TextStyles.textBold26,
        ),
        Gaps.vGap32,
        MyTextField(
          key: const Key('phone'),
          focusNode: _nodeName,
          controller: _nameController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: '请输入手机号',
        ),
        Gaps.vGap8,
        MyTextField(
          key: const Key('password'),
          keyName: 'password',
          focusNode: _nodePwd,
          isInputPwd: true,
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          maxLength: 16,
          hintText: '请输入密码',
        ),
        Gaps.vGap32,
        MyButton(
          key: const Key('login'),
          onPressed: _clickable ? _login : null,
          text: '登录',
        ),
        SizedBox(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text(
                    '验证码登录',
                    key: const Key('forgotPassword'),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  onTap: () =>
                      NavigatorUtils.push(context, LoginRouter.smsLoginPage),
                ),
                GestureDetector(
                  child: Text(
                    '忘记密码',
                    key: const Key('forgotPassword'),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  onTap: () => NavigatorUtils.push(
                      context, 'LoginRouter.resetPasswordPage'),
                ),
              ],
            )),
      ];
}
