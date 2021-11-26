import 'package:flutter/foundation.dart';

class Constant {
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction = kReleaseMode;

  static const String environment = 'dev';

  static bool isDriverTest = false;
  static bool isUnitTest = false;

  static const String data = 'data';
  static const String message = 'msg';
  static const String code = 'code';

  static const String keyGuide = 'keyGuide';
  static const String phone = 'phone';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  static const String theme = 'AppTheme';
  static const String locale = 'locale';

  static const String userInfoKey = 'userInfoKey';

  static String get baseUrl {
    switch (environment) {
      case 'dev':
        return 'https://devdoctor.holoalpha.com/webapp/';
      case 'test':
        return 'https://testdoctor.holoalpha.com/webapp/';
      case 'pre':
        return 'https://predoctor.holoalpha.com/webapp/';
      case 'pub':
        return 'https://doctor.holoalpha.com/webapp/';
      default:
        return 'https://doctor.holoalpha.com/webapp/';
    }
  }

  static String get staticRelativeAPI {
    switch (environment) {
      case 'dev':
        return 'https://devzyy.holoalpha.com/hybrid/';
      case 'test':
        return 'https://testzyy.holoalpha.com/hybrid/';
      case 'pre':
        return 'https://prezyy.holoalpha.com/hybrid/';
      case 'pub':
        return 'https://zyy.holoalpha.com/hybrid/';
      default:
        return 'https://zyy.holoalpha.com/hybrid/';
    }
  }

  /// 费用结算服务协议
  static String costSettlementAgreement =
      '${staticRelativeAPI}agreements/costSettlementAgreement/iOS';

  /// 隐私政策
  static String privacyAgreement =
      '${staticRelativeAPI}agreements/privacyAgreement/iOS';

  /// 用户协议
  static String userAgreement =
      '${staticRelativeAPI}agreements/userAgreement/iOS';

  /// 关于我们
  static String aboutAs = '${staticRelativeAPI}agreements/aboutUs/iOS';
}
