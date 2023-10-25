import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/entities/notification.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/usecases/get_notifications_list_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final GetUserAccessTokenUseCase _getUserAccessTokenUseCase;
  final GetNotificationsListUseCase _getNotificationsListUseCase;
  late String userAccessToken;

  NotificationsCubit(
      this._getUserAccessTokenUseCase, this._getNotificationsListUseCase)
      : super(const NotificationsState());

  Future<void> getNotificationsList() async {
    emit(state.copyWith(notificationsState: CubitState.loading));
    final getAccessToken = await _getUserAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty) {
      final response =
          await _getNotificationsListUseCase(userAccessToken: userAccessToken);
      response.fold(
        (failure) => emit(state.copyWith(
          notificationsFailMessage: failure.message,
          notificationsState: CubitState.failure,
        )),
        (notificationsList) => emit(state.copyWith(
          notifications: notificationsList,
          notificationsState: CubitState.success,
        )),
      );
    }
  }
}
