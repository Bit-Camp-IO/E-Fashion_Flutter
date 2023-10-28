import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/notificationsComponent/data/datasources/notifications_datasource.dart';
import 'package:efashion_flutter/components/notificationsComponent/data/models/app_notification_model.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/repositories/notifications_repository.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl extends NotificationsRepository{
  final NotificationsDataSource _notificationsDataSource;

  NotificationsRepositoryImpl(this._notificationsDataSource);
  @override
  Future<Either<Failure, List<AppNotificationModel>>> getNotificationsList({required String userAccessToken}) async{
    try{
      final List<AppNotificationModel> notificationsList = await _notificationsDataSource.getNotificationsList(userAccessToken: userAccessToken);
      return right(notificationsList);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, void>> subscribeToNotifications({required String userAccessToken, required deviceToken}) async{
    try{
      final void response = await _notificationsDataSource.subscripeToNotifications(userAccessToken: userAccessToken, deviceToken: deviceToken);
      return Right(response);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, void>>  unSubscribeFromNotifications({required String userAccessToken, required deviceToken}) async{
    try{
      final void response = await _notificationsDataSource.unSubscripeFromNotifications(userAccessToken: userAccessToken, deviceToken: deviceToken);
      return Right(response);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

}