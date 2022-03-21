import 'dart:async';
import 'dart:typed_data';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

const String appKey = '4951d0943ed3a17b72e0f200b634e170';

class NIMMessageManage {
  factory NIMMessageManage() => _singleton;

  static final NIMMessageManage _singleton = NIMMessageManage._();

  static NIMMessageManage get instance => NIMMessageManage();

  final subsriptions = <StreamSubscription>[];

  final sessionSubject = BehaviorSubject<List<MessageSession>>();

  Uint8List? _deviceToken;

  NIMMessageManage._() {
    // const MethodChannel('com.netease.NIM.demo/settings')
    //     .setMethodCallHandler((call) async {
    //   if (call.method == 'updateAPNsToken') {
    //     print('update APNs token');
    //     _deviceToken = call.arguments as Uint8List;
    //   }
    //   return null;
    // });
    //
    // subsriptions.add(NimCore.instance.authService.authStatus.listen((event) {
    //   print('AuthService##auth status event: ${event.status.name}');
    // }));
    //
    // subsriptions
    //     .add(NimCore.instance.messageService.onMessage.listen((messages) {
    //   for (final message in messages) {
    //     print(
    //         'MessageService##receive message: ${message
    //             .fromNickname} says ${message.content}');
    //   }
    // }));
    //
    // subsriptions
    //     .add(NimCore.instance.messageService.onMessagePinNotify.listen((event) {
    //   print('MessageService##receive message pin: $event ');
    // }));
    //
    // subsriptions.add(
    //     NimCore.instance.messageService.onStickTopSessionAdd.listen((session) {
    //       print('MessageService##onStickTopSessionAdd: $session ');
    //     }));
    //
    // subsriptions.add(NimCore.instance.messageService.onStickTopSessionUpdate
    //     .listen((session) {
    //   print('MessageService##onStickTopSessionUpdate: $session ');
    // }));
    //
    // subsriptions.add(NimCore.instance.messageService.onStickTopSessionRemove
    //     .listen((session) {
    //   print('MessageService##onStickTopSessionRemove: $session ');
    // }));
    //
    // subsriptions.add(
    //     NimCore.instance.messageService.onSyncStickTopSession.listen((session) {
    //       print(
    //           'MessageService##onSyncStickTopSession: ${session.join('##')} ');
    //     }));
    //
    // subsriptions.add(
    //     NimCore.instance.messageService.onQuickCommentAdd.listen((comment) {
    //       print('MessageService##onQuickCommentAdd: $comment');
    //     }));
    //
    // subsriptions.add(
    //     NimCore.instance.messageService.onQuickCommentRemove.listen((comment) {
    //       print('MessageService##onQuickCommentRemove: $comment');
    //     }));
    //
    // subsriptions.add(
    //     NimCore.instance.messageService.onMySessionUpdate.listen((session) {
    //       print('MessageService##onMySessionUpdate: $session');
    //     }));
  }

  void updateAPNsToken() {
    // if (NimCore.instance.isInitialized &&
    //     Device.isIOS &&
    //     _deviceToken != null) {
    //   NimCore.instance.settingsService.updateAPNSToken(_deviceToken!, null);
    // }
  }

  void loginNIM() async {
    // late NIMSDKOptions options;
    // if (Device.isAndroid) {
    //   final directory = await getExternalStorageDirectory();
    //   options = NIMAndroidSDKOptions(
    //       appKey: appKey,
    //       shouldSyncStickTopSessionInfos: true,
    //       sdkRootDir:
    //       directory != null ? '${directory.path}/NIMFlutter' : null);
    // } else if (Device.isIOS) {
    //   final directory = await getApplicationDocumentsDirectory();
    //   options = NIMIOSSDKOptions(
    //     appKey: appKey,
    //     shouldSyncStickTopSessionInfos: true,
    //     sdkRootDir: '${directory.path}/NIMFlutter',
    //     apnsCername: 'imcdCloudDev',
    //     pkCername: 'imcdCloudVoipDev',
    //   );
    // }
    //
    // final String account = UserDefaultUtils.doctorId ?? '';
    // final String token = UserDefaultUtils.netEasyToken ?? '';
    // if (account.isEmpty || token.isEmpty) {}
    //
    // NimCore.instance.initialize(options).then((value) async {
    //   final loginResult = await NimCore.instance.authService.login(NIMLoginInfo(
    //     account: account,
    //     token: token,
    //     authType: NIMAuthType.authTypeDefault,
    //   ));
    //
    //   if (loginResult.isSuccess) {
    //     Toast.show('IM登录成功');
    //     /// 获取消息列表
    //     _fetchSessionList();
    //   } else {
    //     Toast.show('IM登录失败');
    //   }
    //   updateAPNsToken();
    // });
  }

  void fetchSessionList() {
    // NimCore.instance.messageService
    //     .querySessionList()
    //     .then((value) => {
    //        sessionSubject.add(value.data?.map((e) => MessageSession.latest(e)).toList() ?? [])
    // });

    final List<NIMSession> tmp = [
      NIMSession('sxxasd', 1, '恩熙爸爸', '哈哈哈摄氏度好杀很大合适的话', 167781339),
      NIMSession('sxxasd1', 3, '恩熙', '哈哈哈摄氏话', 167781339),
      NIMSession('sxxas2d', 4, '爸爸', '我卡可适当卡', 167781339),
      NIMSession('sxxas3d', 1, '加手机端', '按时卡达克撒看得开', 167781339),
      NIMSession('sxxasd4', 11, '小啊桥', '奥斯卡打卡SD卡看', 167781339),
    ];

    final List<MessageSession> transFrom =
        tmp.map((e) => MessageSession.latest(e)).toList();

    sessionSubject.add(transFrom);
  }
}

class MessageSession {
  MessageSession(
      this._session,
      this.sessionId,
      this.unReadCount,
      this.userName,
      this.userSex,
      this.updateTime,
      this.userImage,
      this.lastMessage,
      this.nameImage);

  factory MessageSession.latest(NIMSession session) {
    final String name = session.userName.substring(0, 2);
    return MessageSession(
        session,
        session.sessionId,
        session.unreadCount,
        session.userName,
        'userSex',
        session.lastMessageTime,
        '/logo',
        session.lastMessageContent,
        name);
  }

  @override
  String toString() => '$updateTime: $lastMessage';

  late NIMSession _session;
  String? sessionId;
  int? unReadCount;
  String? userName;
  String? userSex;
  int? updateTime;
  String? userImage;
  String? lastMessage;
  String? nameImage;
}

class NIMSession {
  NIMSession(this.sessionId, this.unreadCount, this.userName,
      this.lastMessageContent, this.lastMessageTime);
  String userName;
  String sessionId;
  int unreadCount;
  int lastMessageTime;
  String lastMessageContent;
}
