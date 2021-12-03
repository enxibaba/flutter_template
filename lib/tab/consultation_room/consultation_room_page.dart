import 'package:badges/badges.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/net/dio_utils.dart';
import 'package:flutter_demo/net/http_api.dart';
import 'package:flutter_demo/net/nim_message_manage.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/res/gaps.dart';
import 'package:flutter_demo/tab/consultation_room/widgets/inquiry_session_list.dart';
import 'package:flutter_demo/util/image_utils.dart';
import 'package:flutter_demo/util/log_utils.dart';
import 'package:flutter_demo/util/userdefault_utils.dart';
import 'package:flutter_demo/widgets/future_builder_widget.dart';
import 'package:flutter_demo/widgets/load_image.dart';
import 'package:flutter_demo/widgets/my_scroll_view.dart';
import 'package:marquee/marquee.dart';
import 'model/home_status_entity.dart';

class ConsultationRoomPage extends StatefulWidget {
  const ConsultationRoomPage({Key? key}) : super(key: key);

  @override
  _ConsultationRoomPageState createState() => _ConsultationRoomPageState();
}

class _ConsultationRoomPageState extends State<ConsultationRoomPage>
    with ErrorCallback {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildBar(context),
        body: FutureBuilderWidget<HomeStatusEntity?>(
          commonWidget: CommonHomeWidget(),
          loadData: _initData,
        ));
  }

  /// 创建AppBar
  AppBar _buildBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gaps.hGap16,
          Text(UserDefaultUtils.dockerName ?? '余运芳',
              style: Theme.of(context).textTheme.headline6),
          Gaps.hGap8,
          const LoadAssetImage(
            'home/work_status_on',
            format: ImageFormat.webp,
            width: 12,
          ),
          Gaps.hGap8,
          Text('工作中', style: Theme.of(context).textTheme.subtitle2),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () => {Log.d('')},
            icon: const LoadAssetImage('home/home_more',
                format: ImageFormat.webp, width: 20),
            color: Colours.text)
      ],
    );
  }

  Future<HomeStatusEntity?> _initData(BuildContext context) async {
    HomeStatusEntity? info;
    await DioUtils.instance.requestFormNetwork(Method.post, HttpApi.homeStatus,
        onSuccess: (data) {
      info = HomeStatusEntity.fromJson(data ?? <String, dynamic>{});
    }, onError: (_, __) {
      info = null;
    });
    return info;
  }

  @override
  void retryCall() {}
}

class CommonHomeWidget implements NetNormalWidget<HomeStatusEntity> {
  List<MessageSession> session = [];

  @override
  Widget buildContainer(BuildContext context, HomeStatusEntity t) {
    final noticeTitle = t.info!.msgInfo?.detail ?? '';
    final List<HomeStatusInfoMenulist> list = t.info!.menulist ?? [];
    final List<Widget> menuList = list
        .map((item) => InkWell(
              onTap: () => {Log.d(item.menuTitle ?? '')},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Badge(
                    animationType: BadgeAnimationType.fade,
                    showBadge: (item.unReadCount ?? 0) > 0,
                    badgeContent: Text('${item.unReadCount ?? 0}',
                        style: const TextStyle(color: Colors.white)),
                    child: LoadImage(item.maxImage ?? '', width: 60),
                  ),
                  Gaps.vGap8,
                  Text(item.menuTitle ?? '',
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            ))
        .toList();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gaps.vGap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: menuList,
          ),
          Gaps.vGap15,
          const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: LoadAssetImage('/home/home_banner',
                  format: ImageFormat.webp)),
          Gaps.vGap5,
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LoadAssetImage('/home/home_new_notice',
                    format: ImageFormat.webp, width: 15),
                Gaps.hGap8,
                InkWell(
                  onTap: () => {Log.d('message')},
                  child: SizedBox(
                      height: 30,
                      width: ScreenUtil.getScreenW(context) - 110,
                      child: Marquee(
                          key: const Key('MarqueeText'),
                          text: noticeTitle,
                          velocity: 50.0)),
                ),
                Expanded(
                    child: InkWell(
                  onTap: () => {NIMMessageManage.instance.fetchSessionList()},
                  child: const Text('| 更多', textAlign: TextAlign.right),
                )),
                Gaps.hGap8,
              ],
            ),
          ),
          const InquirySessionList()
        ],
      ),
    );
  }
}
