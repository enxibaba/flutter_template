import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {

  const MyTextField({
    Key? key,
    required this.controller,
    this.maxLength = 16,
    this.autoFocus = false,
    this.keyboardType = TextInputType.text,
    this.hintText = '',
    this.focusNode,
    this.isInputPwd = false,
    this.getVCode,
    this.keyName
}): super(key: key);

  final TextEditingController controller;
  final int maxLength;
  final bool autoFocus;
  final TextInputType keyboardType;
  final String hintText;
  final FocusNode? focusNode;
  final bool isInputPwd;
  final Future<bool> Function()? getVCode;
  /// 用于集成测试寻找widget
  final String? keyName;

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  
  bool _isShowPwd = false;
  bool _isShowDelete = false;
  bool _clickable = true;
  /// 倒计时秒数
  final int _second = 30;
  /// 当前秒数
  late int _currentSecond;
  StreamSubscription? _subscription;

  @override
  void initState() {
    /// 获取初始化值
    _isShowDelete = widget.controller.text.isNotEmpty;
    /// 监听输入改变  
    widget.controller.addListener(isEmpty);
    super.initState();
  }

  void isEmpty() {
    final bool inNotEmpty = widget.controller.text.isNotEmpty;
    /// 状态不一样在刷新，避免重复不必要的setState
    if (inNotEmpty != _isShowDelete) {
      setState(() {
        _isShowDelete = inNotEmpty;
      });
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    widget.controller.removeListener(isEmpty);
    super.dispose();
  }

  Future _getVCode() async {
    final bool isSuccess = await widget.getVCode!();
    if (isSuccess) {
      setState(() {
        _currentSecond = _second;
        _clickable = false;
      });
      _subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i).take(_second).listen((int i) {
        setState(() {
          _currentSecond = _second - i - 1;
          _clickable = _currentSecond < 1;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
  
}
