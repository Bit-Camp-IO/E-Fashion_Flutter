import 'package:efashion_flutter/components/notificationsComponent/domain/entities/app_notification.dart';

class AppNotificationModel extends AppNotification {
  const AppNotificationModel({
    required super.type,
    required super.title,
    required super.body,
    required super.date,
  });

  factory AppNotificationModel.fromJson(Map<String, dynamic> jsonData) {
    return AppNotificationModel(
      type: jsonData['type'],
      title: jsonData['title'],
      body: jsonData['body'],
      date: jsonData['date']
    );
  }
}
