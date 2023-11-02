import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/repositories/notifications_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubscribeToNotificationsUseCase{
  final NotificationsRepository _notificationsRepository;

  const SubscribeToNotificationsUseCase(this._notificationsRepository);

  Future<Either<Failure, void>> call({required String deviceToken}) async{
    return await _notificationsRepository.subscribeToNotifications(deviceToken: deviceToken);
  }
}