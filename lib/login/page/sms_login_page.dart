import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/login/widgets/my_text_field.dart';
import 'package:flutter_demo/login/widgets/sms_tips_alert.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/res/gaps.dart';
import 'package:flutter_demo/res/styles.dart';
import 'package:flutter_demo/routers/fluro_navigator.dart';
import 'package:flutter_demo/util/app_navigator.dart';
import 'package:flutter_demo/util/change_notifier_manage.dart';
import 'package:flutter_demo/util/other_utils.dart';
import 'package:flutter_demo/util/theme_utils.dart';
import 'package:flutter_demo/util/toast_utils.dart';
import 'package:flutter_demo/widgets/my_app_bar.dart';
import 'package:flutter_demo/widgets/my_button.dart';
import 'package:flutter_demo/widgets/my_scroll_view.dart';

import '../login_router.dart';

class SmsLoginPage extends StatefulWidget {
  const SmsLoginPage({Key? key}) : super(key: key);

  @override
  _SmsLoginPageState createState() => _SmsLoginPageState();
}

class _SmsLoginPageState extends State<SmsLoginPage>
    with ChangeNotifierMixin<SmsLoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _smsCodeController = TextEditingController();
  final FocusNode _phoneNode = FocusNode();
  final FocusNode _smsCodeNode = FocusNode();

  /// 标记当前登录按钮的是否可点击状态
  bool _clickable = false;

  @override
  Map<ChangeNotifier?, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> callbacks = <VoidCallback>[_verify];
    return <ChangeNotifier, List<VoidCallback>?>{
      _phoneController: callbacks,
      _smsCodeController: callbacks,
      _phoneNode: null,
      _smsCodeNode: null
    };
  }

  @override
  void initState() {
    super.initState();
  }

  void _verify() {
    final String phone = _phoneController.text;
    final String smsCode = _smsCodeController.text;
    bool clickable = true;
    if (phone.isEmpty || phone.length < 11) {
      clickable = false;
    }
    if (smsCode.isEmpty || smsCode.length < 6) {
      clickable = false;
    }

    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  void _login() {}

  void _showTipsAlert() {
    showDialog<void>(context: context, builder: (_) => const SmsTipsAlert());
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDark;

    return Scaffold(
        appBar: const MyAppBar(isBack: false),
        body: MyScrollView(
          keyboardConfig: Utils.getKeyboardActionsConfig(
              context, <FocusNode>[_phoneNode, _smsCodeNode]),
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
              ..onTap = () => NavigatorUtils.goWebViewPage(context, '用户协议',
                  'https://zyy.holoalpha.com/hybrid/agreements/userAgreement/iOS')),
        TextSpan(text: '及', style: TextStyle(color: textColor)),
        TextSpan(
            text: '《隐私政策》',
            style: TextStyle(color: mainColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () => NavigatorUtils.goWebViewPage(context, '隐私政策',
                  'https://zyy.holoalpha.com/hybrid/agreements/privacyAgreement/iOS'))
      ], style: const TextStyle(fontSize: 12)),
    );
  }

  List<Widget> get _buildBody => <Widget>[
        const Text(
          '手机快捷登录',
          style: TextStyles.textBold26,
        ),
        Gaps.vGap32,
        MyTextField(
          key: const Key('phone'),
          focusNode: _phoneNode,
          controller: _phoneController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: '请输入手机号',
        ),
        Gaps.vGap8,
        MyTextField(
          key: const Key('sms'),
          keyName: 'smsCode',
          focusNode: _smsCodeNode,
          controller: _smsCodeController,
          keyboardType: TextInputType.none,
          maxLength: 16,
          hintText: '请输入短信验证码',
          getVCode: () {
            Toast.show('获取验证码');
            return Future<bool>.value(true);
          },
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
                    '密码登录',
                    key: const Key('forgotPassword'),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  onTap: () => AppNavigator.goBack(context),
                ),
                GestureDetector(
                    child: Text(
                      '收不到验证码？',
                      key: const Key('forgotPassword'),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    onTap: _showTipsAlert)
              ],
            )),
      ];
}
