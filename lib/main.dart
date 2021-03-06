import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/home/splash_page.dart';
import 'package:flutter_demo/net/dio_utils.dart';
import 'package:flutter_demo/net/intercept.dart';
import 'package:flutter_demo/res/constant.dart';
import 'package:flutter_demo/routers/not_found_page.dart';
import 'package:flutter_demo/routers/routers.dart';
import 'package:flutter_demo/setting/provider/theme_provider.dart';
import 'package:flutter_demo/util/device_utils.dart';
import 'package:flutter_demo/util/handle_error_utils.dart';
import 'package:flutter_demo/util/log_utils.dart';
import 'package:flutter_demo/util/theme_utils.dart';
import 'package:flutter_demo/util/toast_utils.dart';
import 'package:flutter_demo/widgets/custom_animation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:sp_util/sp_util.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
//  debugProfileBuildsEnabled = true;
//  debugPaintLayerBordersEnabled = true;
//  debugProfilePaintsEnabled = true;
//  debugRepaintRainbowEnabled = true;

  /// 确保初始化完成
  WidgetsFlutterBinding.ensureInitialized();

  /// 去除URL中的“#”(hash)，仅针对Web。默认为setHashUrlStrategy
  /// 注意本地部署和远程部署时`web/index.html`中的base标签，https://github.com/flutter/flutter/issues/69760
  setPathUrlStrategy();

  /// sp初始化
  await SpUtil.getInstance();

  /// 1.22 预览功能: 在输入频率与显示刷新率不匹配情况下提供平滑的滚动效果
  // GestureBinding.instance?.resamplingEnabled = true;
  /// 异常处理
  handleError(() => runApp(MyApp()));

  /// 隐藏状态栏。为启动页、引导页设置。完成后修改回显示状态栏。
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  // TODO(ZhouJia): 启动体验不佳。状态栏、导航栏在冷启动开始的一瞬间为黑色，且无法通过隐藏、修改颜色等方式进行处理。。。
  // 相关问题跟踪：https://github.com/flutter/flutter/issues/73351

  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.dark
    ..contentPadding = const EdgeInsets.symmetric(
      vertical: 15.0,
      horizontal: 30.0,
    )
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, this.home, this.theme}) : super(key: key) {
    Log.init();
    initDio();
    Routes.initRoutes();
    initQuickActions();
  }

  final Widget? home;
  final ThemeData? theme;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  void initDio() {
    final List<Interceptor> interceptors = <Interceptor>[];

    /// 统一添加身份验证请求头
    interceptors.add(AuthInterceptor());

    /// 刷新Token
    interceptors.add(TokenInterceptor());

    /// 打印Log(生产模式去除)
    if (!Constant.inProduction) {
      interceptors.add(LoggingInterceptor());
    }

    /// 适配数据(根据自己的数据结构，可自行选择添加)
    interceptors.add(AdapterInterceptor());
    configDio(
      baseUrl: Constant.baseUrl,
      interceptors: interceptors,
    );
  }

  void initQuickActions() {
    if (Device.isMobile) {
      const QuickActions quickActions = QuickActions();
      if (Device.isIOS) {
        // Android每次是重新启动activity，所以放在了splash_page处理。
        // 总体来说使用不方便，这种动态的方式在安卓中局限性高。这里仅做练习使用。
        // quickActions.initialize((String shortcutType) async {
        //   if (shortcutType == 'demo') {
        //     navigatorKey.currentState?.push<dynamic>(MaterialPageRoute<dynamic>(
        //       builder: (BuildContext context) => const DemoPage(),
        //     ));
        //   }
        // });
      }

      quickActions.setShortcutItems(<ShortcutItem>[
        const ShortcutItem(
            type: 'demo', localizedTitle: 'Demo', icon: 'flutter_dash_black'),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: Consumer<ThemeProvider>(
        builder: (_, ThemeProvider provider, __) {
          return _buildMaterialApp(provider);
        },
      ),
    );
  }

  Widget _buildMaterialApp(ThemeProvider provider) {
    // ignore: prefer_final_locals
    TransitionBuilder loadingBuilder() =>
        (BuildContext context, Widget? child) {
          /// 仅针对安卓
          if (Device.isAndroid) {
            /// 切换深色模式会触发此方法，这里设置导航栏颜色
            ThemeUtils.setSystemNavigationBar(provider.getThemeMode());
          }

          /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        };

    return MaterialApp(
      title: 'Flutter Deer',
      // showPerformanceOverlay: true, //显示性能标签
      // debugShowCheckedModeBanner: false, // 去除右上角debug的标签
      // checkerboardRasterCacheImages: true,
      // showSemanticsDebugger: true, // 显示语义视图
      // checkerboardOffscreenLayers: true, // 检查离屏渲染

      theme: theme ?? provider.getTheme(),
      darkTheme: provider.getTheme(isDarkMode: true),
      themeMode: provider.getThemeMode(),
      home: home ?? const SplashPage(),
      onGenerateRoute: Routes.router.generator,
      navigatorKey: navigatorKey,

      builder: EasyLoading.init(builder: loadingBuilder()),

      /// 因为使用了fluro，这里设置主要针对Web
      onUnknownRoute: (_) {
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const NotFoundPage(),
        );
      },
      restorationScopeId: 'app',
    );
  }
}
