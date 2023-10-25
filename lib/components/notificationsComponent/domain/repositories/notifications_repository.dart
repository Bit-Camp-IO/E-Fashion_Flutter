import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/entities/notification.dart';
import 'package:efashion_flutter/shared/error/failure.dart';


abstract class NotificationsRepository{
  Future<Either<Failure, void>> subscribeToNotifications({required String userAccessToken, required String deviceToken});
  Future<Either<Failure, void>> unSubscribeFromNotifications({required String userAccessToken, required String deviceToken});
  Future<Either<Failure, List<Notification>>> getNotificationsList({required String userAccessToken});
}