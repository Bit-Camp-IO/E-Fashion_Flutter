import 'package:efashion_flutter/shared/util/enums.dart';

class AppNotification {
  final String? notificationPic;
  final String? notificationTitle;
  final String notificationBody;
  final NotificationType notificationType;
  final DeliverStatus? notificationDeliveryStatus;
  final String notificationTime;

  const AppNotification({
    this.notificationPic,
    this.notificationTitle,
    this.notificationDeliveryStatus,
    required this.notificationBody,
    required this.notificationType,
    required this.notificationTime,
  });
}

List<AppNotification> notifications = [
  const AppNotification(
    notificationPic: 'https://images.unsplash.com/photo-1607957598810-191e891df4d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    notificationTitle: 'Your Zara Hoodie is on The Way',
    notificationBody: 'it will take up to 2h for it be delivered.',
    notificationType: NotificationType.orderStatus,
    notificationDeliveryStatus: DeliverStatus.onTheWay,
    notificationTime: '11:50 am',
  ),
  const AppNotification(
    notificationPic: 'https://images.unsplash.com/photo-1607957598810-191e891df4d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    notificationTitle: 'Your Zara Hoodie is delivered',
    notificationBody: 'Hope you loved it give us a rate',
    notificationType: NotificationType.orderStatus,
    notificationDeliveryStatus: DeliverStatus.delivered,
    notificationTime: '01:50 pm',
  ),
  const AppNotification(
    notificationBody: 'Please tap to rate our services we are more than happy to know your opinion',
    notificationType: NotificationType.rating,
    notificationTime: '02:30 pm',
  ),const AppNotification(
    notificationBody: 'We are more than happy to help you sir 💙',
    notificationType: NotificationType.supportMessage,
    notificationTime: '02:30 pm',
  ),
];
