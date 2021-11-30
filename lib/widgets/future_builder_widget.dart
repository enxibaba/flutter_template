import 'package:flutter/material.dart';
import 'package:flutter_demo/res/colors.dart';

/// 结合网络请求库使用，可定义 加载界面，出错界面，正常展示界面
typedef LoadDataFuture<T> = Future<T> Function(BuildContext context);

class FutureBuilderWidget<T> extends StatefulWidget {

  const FutureBuilderWidget(
      {Key? key,
        required this.commonWidget,
        required this.loadData,
        this.loadingWidget,
        this.errorWidget}) : super(key: key);

  final Widget? loadingWidget;

  final Widget? errorWidget;

  final NetNormalWidget<T> commonWidget;

  final LoadDataFuture<T> loadData;

  @override
  State<StatefulWidget> createState() => _FutureBuilderWidgetState<T>();
}

class _FutureBuilderWidgetState<T> extends State<FutureBuilderWidget<T>>
    with ErrorCallback {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      widget.loadData(context);
    });
  }

  ///默认加载界面
  final defaultLoading = const Center(
    child: CircularProgressIndicator(color: Colours.app_main),
  );

  ///默认出错界面
  Widget _defaultError(dynamic error) {
    return Center(
      child: Text(error.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: widget.loadData(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return widget.loadingWidget ?? defaultLoading;
            case ConnectionState.done:
              if (snapshot.hasError) {
                ///网络出错
                if (widget.errorWidget != null) {
                  ///自定义出错界面
                  if (widget.errorWidget is NetErrorWidget) {
                    return widget.errorWidget!;
                  } else {
                    ///只自定义界面显示内容
                    return NetErrorWidget(
                      errorChild: widget.errorWidget,
                      callback: this,
                    );
                  }
                } else {
                  ///选用默认出错界面
                  return NetErrorWidget(
                    errorChild: _defaultError(snapshot.error),
                    callback: this,
                  );
                }
              } else if (snapshot.data == null) {
                return NetErrorWidget(
                  errorChild: _defaultError('数据加载失败 :( '),
                  callback: this,
                );
              }
              return widget.commonWidget.buildContainer(context, snapshot.data as T);
          }
        });
  }

  @override
  void retryCall() {
    widget.loadData(context);

    if (mounted) {
      //mounted :判断当前页面是否存在
      setState(() {
        ///重新构建界面需要
      });
    }
  }
}

abstract class NetNormalWidget<T> {
  Widget buildContainer(BuildContext context, T t);
}

///net出错 回调
abstract class ErrorCallback {
  void retryCall();
}

///网络请求 失败 Widget
class NetErrorWidget extends StatelessWidget {

  const NetErrorWidget({Key? key, this.errorChild, this.callback}): super(key: key);

  final Widget? errorChild;
  final ErrorCallback? callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: errorChild,
      onTap: () => callback?.retryCall(),
    );
  }
}
