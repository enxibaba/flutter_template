import 'package:flutter/material.dart';
import 'package:flutter_demo/login/login_router.dart';
import 'package:flutter_demo/res/styles.dart';
import 'package:flutter_demo/routers/fluro_navigator.dart';
import 'package:flutter_demo/widgets/base_dialog.dart';

class SmsTipsAlert extends StatefulWidget {
  const SmsTipsAlert({
    Key? key,
  }) : super(key: key);

  @override
  _SmsTipsAlertState createState() => _SmsTipsAlertState();
}

class _SmsTipsAlertState extends State<SmsTipsAlert> {
  final String tipsMessage = """如您未收到短信，请参照以下方式进行：
1、短信可能被拦截进垃圾箱，请打开垃圾短信箱读取短信，并将其添加为白名单
2、运营商通道故障导致发送延迟，请稍等片刻或重新获取验证码
3、若上述方式均未解决请联系平台运营人员""";

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '提示',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(tipsMessage, style: TextStyles.textSize16),
      ),
      onPressed: () {
        NavigatorUtils.goBack(context);
      },
    );
  }
}
