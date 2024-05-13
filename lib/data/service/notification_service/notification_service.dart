import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/data/repositories/account/iaccount_repository.dart';
import 'package:mobileapp/data/service/account_service.dart';
import 'package:mobileapp/data/service/notification_service/background_service.dart';
import 'package:mobileapp/routes/app_pages.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class NotificationService extends GetxService {
  final AccountService accountService;
  final IAccountRepository accountRepository;

  int notiId = 0;

  NotificationService({
    required this.accountService,
    required this.accountRepository,
  });

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  //create channel notification Android
  final AndroidNotificationChannel channel = AndroidNotificationChannel(
    'com.hitek.example',
    'HitekExample',
    importance: Importance.max,
  );

  Future onDidReceiveNotificationResponse(NotificationResponse? title) async {
    return Future;
  }

  Future init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/app_icon');
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    if (Platform.isIOS) {
      await _firebaseMessaging.requestPermission(alert: true, badge: true, sound: true, provisional: false);
    }
  }

  @override
  void onInit() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: false,
      badge: false,
      sound: false,
    ); // set false để dùng local notification không dùng của system

    var fcmToken = await _firebaseMessaging.getToken();
    print('[FCM] token => ' + (fcmToken ?? ""));

    _firebaseMessaging.subscribeToTopic('main');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      var payload = message.data; // ['data'];
      print('onMessage: ${payload}');
      showNotification(payload);
      //handle receive notification on foreground
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      var payload = message.data; // ['data'];
      print('onMessageOpenedApp: ${payload}');
      //handle click notification

      handleClickNotification(payload);
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    super.onInit();
  }

  showNotification(Map<String, dynamic> payload) async {
    final String? title = payload["title"];
    final String? body = payload["message"];
    final String? imageUrl = payload["image"];

    String? picturePath =
        imageUrl == null ? null : await _downloadAndSaveFile("${DateTime.now().millisecondsSinceEpoch}.png", imageUrl);
    final FilePathAndroidBitmap? filePath = picturePath == null ? null : FilePathAndroidBitmap(picturePath);

    var uuid = Uuid().v4();

    try {
      flutterLocalNotificationsPlugin.show(
        notiId,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            tag: uuid,
            largeIcon: filePath,
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            threadIdentifier: uuid,
            attachments: [if (picturePath != null) DarwinNotificationAttachment(picturePath)],
          ),
        ),
        payload: jsonEncode(payload),
      );
      notiId++;
    } catch (e) {
      print("e: ${e.toString()}");
    }
  }

  Future<String> _downloadAndSaveFile(String fileName, String url) async {
    final isIos = Platform.isIOS;
    final directory = isIos ? await getTemporaryDirectory() : await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  handleNotification(Map<String, dynamic> payload) async {
    print("handleNotification payload: $payload");
  }

  handleClickNotification(Map<String, dynamic> payload) async {
    print("handleClickNotification payload: $payload");
  }

  checkTerminatedNotification() async {
    if (Get.previousRoute != Routes.SPLASH)
      return; // chỉ check khi vào từ splash screen để tránh trường hợp logout ra vô lại main_controller gọi lại lần nữa

    RemoteMessage? initialMessage = await _firebaseMessaging.getInitialMessage();

    if (initialMessage != null) {
      var payload = initialMessage.data; // ['data'];
      print('onMessageOpenedApp initialMessage: ${payload}');
      handleClickNotification(payload);
    } else {
      final notificationDetial = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
      print('checkTerminatedNotification notification.getNotificationAppLaunchDetails $notificationDetial');
      if (notificationDetial != null && notificationDetial.didNotificationLaunchApp) {
        final payload = jsonDecode(notificationDetial.notificationResponse?.payload ?? '{}') as Map<String, dynamic>;
        handleClickNotification(payload);
      }
    }
  }

  subscribeToTopic(String topic) {
    _firebaseMessaging.subscribeToTopic(topic);
  }

  unsubscribeToTopic(String topic) {
    _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  Future cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
    var activeNotifications = await flutterLocalNotificationsPlugin.getActiveNotifications();
    for (var noti in activeNotifications) {
      if (noti.id != null) {
        await flutterLocalNotificationsPlugin.cancel(noti.id!);
      }
    }
  }
}
