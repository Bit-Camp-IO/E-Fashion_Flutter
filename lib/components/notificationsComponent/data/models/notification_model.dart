import 'package:efashion_flutter/components/notificationsComponent/domain/entities/notification.dart';

class NotificationModel extends Notification {
  const NotificationModel({
    required super.type,
    required super.title,
    required super.body,
    required super.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> jsonData) {
    return NotificationModel(
      type: jsonData['type'],
      title: jsonData['title'],
      body: jsonData['body'],
      date: jsonData['date']
    );
  }
}
