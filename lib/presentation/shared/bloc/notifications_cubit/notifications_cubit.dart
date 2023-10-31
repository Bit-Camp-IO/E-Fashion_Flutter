import 'package:efashion_flutter/components/authComponent/domain/usecases/check_if_tokens_exist_use_case.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/entities/app_notification.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/usecases/get_notifications_list_usecase.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/usecases/subscribe_to_notifications_usecase.dart';
import 'package:efashion_flutter/components/notificationsComponent/domain/usecases/unsubscribe_from_notifications_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/shared/util/notifications_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

part 'notifications_state.dart';

@singleton
class NotificationsCubit extends Cubit<NotificationsState> {
  final GetUserAccessTokenUseCase _getUserAccessTokenUseCase;
  final GetNotificationsListUseCase _getNotificationsListUseCase;
  final SubscribeToNotificationsUseCase _subscribeToNotificationsUseCase;
  final UnSubscribeFromNotificationsUseCase
      _unSubscribeFromNotificationsUseCase;
  final CheckIfTokensExistUseCase _checkIfTokensExistUseCase;
  late String userAccessToken;

  NotificationsCubit(
    this._getUserAccessTokenUseCase,
    this._getNotificationsListUseCase,
    this._subscribeToNotificationsUseCase,
    this._unSubscribeFromNotificationsUseCase,
    this._checkIfTokensExistUseCase,
  ) : super(const NotificationsState());

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

  Future<void> subscribeToNotifications() async {
    if (state.notificationsPermissionsState ==
        NotificationsPermissionsState.granted) {
      final getAccessToken = await _getUserAccessTokenUseCase();
      userAccessToken = getAccessToken.getOrElse(() => '');
      final String? deviceToken = await NotificationsManager.getDeviceToken();
      await _subscribeToNotificationsUseCase(
        userAccessToken: userAccessToken,
        deviceToken: deviceToken!,
      );
      emit(state.copyWith(isUserSubscribedToNotifications: true));
    } else {
      emit(state.copyWith(isUserSubscribedToNotifications: false));
    }
  }

  Future<void> unSubscribeFromNotifications() async {
    final getAccessToken = await _getUserAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    final String? deviceToken = await NotificationsManager.getDeviceToken();
    await _unSubscribeFromNotificationsUseCase(
      userAccessToken: userAccessToken,
      deviceToken: deviceToken!,
    );
    emit(state.copyWith(isUserSubscribedToNotifications: false));
  }

  Future<void> getNotificationsState() async {
    await checkForNotificationsPermission();
    final isUserLoggedIn = _checkIfTokensExistUseCase();
    isUserLoggedIn.fold(
      (l) => emit(
        state.copyWith(
          isUserSubscribedToNotifications: false,
        ),
      ),
      (r) => emit(
        state.copyWith( isUserSubscribedToNotifications: state.notificationsPermissionsState == NotificationsPermissionsState.granted
                  ? true
                  : false,
        ),
      ),
    );
  }

  Future<void> checkForNotificationsPermission() async {
    emit(state.copyWith(
        notificationsPermissionsState: NotificationsPermissionsState.loading));
    final bool isNotificationsPermissionsGranted =
        await Permission.notification.isGranted;
    if (isNotificationsPermissionsGranted) {
      emit(
        state.copyWith(
          notificationsPermissionsState: NotificationsPermissionsState.granted,
        ),
      );
    } else {
      unSubscribeFromNotifications();
      emit(
        state.copyWith(
          notificationsPermissionsState: NotificationsPermissionsState.denied,
        ),
      );
    }
  }

  Future<void> requestNotificationsPermissions() async {
    emit(state.copyWith(notificationsPermissionsState: NotificationsPermissionsState.loading));
    final bool isPermissionsPermanentlyDenied = await Permission.notification.isPermanentlyDenied;
    if (isPermissionsPermanentlyDenied) {
      emit(
        state.copyWith(
          notificationsPermissionsState: NotificationsPermissionsState.permanentlyDenied,
        ),
      );
    } else {
      emit(
        state.copyWith(
          notificationsPermissionsState: NotificationsPermissionsState.denied,
        ),
      );
      Permission.notification.request();
    }
  }
}

enum NotificationsPermissionsState {
  loading,
  granted,
  denied,
  permanentlyDenied,
}
