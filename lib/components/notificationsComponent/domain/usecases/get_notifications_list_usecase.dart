import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/entities/app_notification.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/repositories/notifications_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetNotificationsListUseCase{
  final NotificationsRepository _notificationsRepository;

  const GetNotificationsListUseCase(this._notificationsRepository);

  Future<Either<Failure, List<AppNotification>>> call() async{
    return await _notificationsRepository.getNotificationsList();
  }
}