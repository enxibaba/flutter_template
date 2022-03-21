import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/net/nim_message_manage.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/res/gaps.dart';
import 'package:flutter_demo/util/image_utils.dart';
import 'package:flutter_demo/util/log_utils.dart';
import 'package:flutter_demo/widgets/load_image.dart';

class InquirySessionList extends StatefulWidget {
  const InquirySessionList({Key? key}) : super(key: key);

  @override
  _InquirySessionListState createState() => _InquirySessionListState();
}

class _InquirySessionListState extends State<InquirySessionList> {
  List<MessageSession> session = [];

  @override
  Widget build(BuildContext context) {
    final List<Widget> sessionItem = session
        .map((item) => Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: Colours.line,
                          style: BorderStyle.solid))),
              child: InkWell(
                onTap: () => {Log.d(item.sessionId ?? '')},
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Badge(
                        position: BadgePosition.topEnd(top: -2, end: -2),
                        animationType: BadgeAnimationType.fade,
                        showBadge: (item.unReadCount ?? 0) > 0,
                        badgeContent: Text('${item.unReadCount}',
                            style: const TextStyle(color: Colors.white)),
                        child: ClipOval(
                          child: Container(
                              width: 60,
                              height: 60,
                              color: Colours.app_main,
                              alignment: Alignment.center,
                              child: Text(item.nameImage ?? '',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18))),
                        ),
                      ),
                      Gaps.hGap16,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(item.userName ?? 'EnXi'),
                                Gaps.hGap8,
                                const LoadAssetImage('/home/sex_man',
                                    format: ImageFormat.webp,
                                    width: 15,
                                    height: 15),
                                Gaps.hGap8,
                                Text('18岁',
                                    style:
                                        Theme.of(context).textTheme.subtitle2),
                                Gaps.hGap8,
                                const RawChip(
                                    label: Text('复诊'),
                                    labelStyle:
                                        TextStyle(color: Colours.app_main),
                                    backgroundColor:
                                        Color.fromRGBO(0, 198, 174, 0.2)),
                                const Spacer(),
                                Text('09:23',
                                    style: Theme.of(context).textTheme.caption),
                              ],
                            ),
                            Gaps.vGap12,
                            Text(item.lastMessage ?? '',
                                style: Theme.of(context).textTheme.subtitle1)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
        .toList();

    return Column(
      children: sessionItem,
    );
  }

  @override
  void initState() {
    super.initState();
    NIMMessageManage.instance.sessionSubject.stream.listen((event) {
      setState(() {
        session = event;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
