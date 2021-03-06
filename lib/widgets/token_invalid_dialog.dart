import 'package:flutter/material.dart';
import 'package:flutter_demo/login/login_router.dart';
import 'package:flutter_demo/res/styles.dart';
import 'package:flutter_demo/routers/fluro_navigator.dart';
import 'package:flutter_demo/widgets/base_dialog.dart';

class TokenInvalidDialog extends StatefulWidget {
  const TokenInvalidDialog({
    Key? key,
  }) : super(key: key);

  @override
  _TokenInvalidDialog createState() => _TokenInvalidDialog();
}

class _TokenInvalidDialog extends State<TokenInvalidDialog> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '提示',
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text('你的账号在其它地方登录？', style: TextStyles.textSize16),
      ),
      onPressed: () {
        NavigatorUtils.push(context, LoginRouter.loginPage, clearStack: true);
      },
    );
  }
}
