import 'package:efashion_flutter/firebase_options.dart';
import 'package:efashion_flutter/main.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

abstract class NotificationManager{
  Future<void> init();
  void onNotificationTap(NotificationResponse notificationResponse);
  Future<void> requestNotificationsPermissions();
  void showNotification({
    required RemoteMessage message,
    bool isForeground = true,
  });
  Future<String?> getDeviceToken();
  Future<void> close();
}
class NotificationsManagerImpl extends NotificationManager{
  final FlutterLocalNotificationsPlugin _notification = FlutterLocalNotificationsPlugin();
  final BehaviorSubject<NotificationResponse> onClickNotification = BehaviorSubject<NotificationResponse>();
  static final NotificationsManagerImpl _notificationService = NotificationsManagerImpl._internal();

  factory NotificationsManagerImpl() {
    return _notificationService;
  }

  NotificationsManagerImpl._internal();

  @override
  Future<void> init() async {
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
      await NotificationsManagerImpl().showNotification(message: event);
    });
    final NotificationAppLaunchDetails? notificationBackgroundDetails = await _notification.getNotificationAppLaunchDetails();
    if(notificationBackgroundDetails!.didNotificationLaunchApp){
      onNotificationTap(notificationBackgroundDetails.notificationResponse!);
    }
  }

  @override
  void onNotificationTap(NotificationResponse notificationResponse) {
    onClickNotification.add(notificationResponse);
  }

  @override
  Future<void> requestNotificationsPermissions() async{
    await _notification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  Future<String?> getDeviceToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (kDebugMode) {
      debugPrint('Token: $fcmToken');
    }
    return fcmToken;
  }

  @override
  Future<void> showNotification({
    required RemoteMessage message,
    bool isForeground = true,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'high_importance_channel',
      'eFashion Notifications',
      channelDescription: 'channel used for very important notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    DarwinNotificationDetails iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
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

  @override
  Future<void> close() async{
    await onClickNotification.close();
    await FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.generalNotificationsTopic);
  }
}
