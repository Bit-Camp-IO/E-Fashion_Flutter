import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsManager {
  static final _notification = FlutterLocalNotificationsPlugin();
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    await _firebaseMessaging.requestPermission();
    _firebaseMessaging.subscribeToTopic(AppConstants.generalNotificationsTopic);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );
    FirebaseMessaging.onMessage.listen((event) async {
      if(event.notification != null){
        await NotificationsManager.showNotification(event);

      }
    });
  }

   Future<String?> getDeviceToken() async{
    final fcmToken = await _firebaseMessaging.getToken();
    debugPrint('Token: $fcmToken');
    return fcmToken;
  }

  static showNotification(
    RemoteMessage message,
  ) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'high_importance_channel',
      'high_importance_notifications',
      channelDescription: 'channel used for very important notifications',
      importance: Importance.max,
      priority: Priority.high,
        icon: message.notification!.android?.smallIcon
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await _notification.show(
        DateTime.now().microsecond,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: message.data.toString());
  }
}
