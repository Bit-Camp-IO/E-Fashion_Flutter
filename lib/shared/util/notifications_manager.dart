import 'package:efashion_flutter/firebase_options.dart';
import 'package:efashion_flutter/main.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationsManager {
  static final _notification = FlutterLocalNotificationsPlugin();
  static final onClickNotification = BehaviorSubject<NotificationResponse>();
  static bool isInit = false;
  static final NotificationsManager _notificationService =
      NotificationsManager._internal();

  factory NotificationsManager() {
    return _notificationService;
  }

  NotificationsManager._internal();

  static void onNotificationTap(NotificationResponse notificationResponse) {
    onClickNotification.add(notificationResponse);
  }

  static Future<void> requestNotificationsPermissions() async{
    await _notification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.instance.subscribeToTopic(AppConstants.generalNotificationsTopic);
    _notification.initialize(
      onDidReceiveNotificationResponse: onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: onNotificationTap,
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/notifications'),
        iOS: DarwinInitializationSettings(
          requestSoundPermission: true,
          requestAlertPermission: true,
          requestBadgePermission: true,
        ),
      ),
    );
    FirebaseMessaging.onMessage.listen((event) async {
      await NotificationsManager.showNotification(message: event);
    });
    final NotificationAppLaunchDetails? notificationBackgroundDetails = await _notification.getNotificationAppLaunchDetails();
    if(notificationBackgroundDetails!.didNotificationLaunchApp){
      onNotificationTap(notificationBackgroundDetails.notificationResponse!);
    }
  }

  static Future<String?> getDeviceToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (kDebugMode) {
      debugPrint('Token: $fcmToken');
    }
    return fcmToken;
  }

  static showNotification({
    required RemoteMessage message,
    bool isForeground = true,
  }) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'high_importance_channel',
      'eFashion Notifications',
      channelDescription: 'channel used for very important notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await _notification.show(
      DateTime.now().microsecond,
      message.data['title'],
      message.data['body'],
      platformChannelSpecifics,
      payload: message.data['type'],
    );
  }

  static close() async{
    await onClickNotification.close();
    await FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.generalNotificationsTopic);
  }
}
