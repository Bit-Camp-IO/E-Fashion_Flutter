import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/repositories/notifications_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UnSubscribeFromNotificationsUseCase{
  final NotificationsRepository _notificationsRepository;

  const UnSubscribeFromNotificationsUseCase(this._notificationsRepository);

  Future<Either<Failure, void>> call({required String userAccessToken, required String deviceToken}) async{
    return await _notificationsRepository.unSubscribeFromNotifications(userAccessToken: userAccessToken, deviceToken: deviceToken);
  }
}