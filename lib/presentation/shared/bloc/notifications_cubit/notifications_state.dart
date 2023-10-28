part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final List<AppNotification> notifications;
  final CubitState notificationsState;
  final String notificationsFailMessage;
  final bool isUserSubscribedToNotifications;

  final NotificationsPermissionsState notificationsPermissionsState;

  const NotificationsState({
    this.notifications = const [],
    this.notificationsState = CubitState.initial,
    this.notificationsFailMessage = '',
    this.isUserSubscribedToNotifications = false,
    this.notificationsPermissionsState = NotificationsPermissionsState.loading,
  });

  @override
  List<Object?> get props => [
        notifications,
        notificationsState,
        notificationsFailMessage,
        isUserSubscribedToNotifications,
        notificationsPermissionsState,
      ];

  NotificationsState copyWith({
    List<AppNotification>? notifications,
    CubitState? notificationsState,
    String? notificationsFailMessage,
    bool? isUserSubscribedToNotifications,
    NotificationsPermissionsState? notificationsPermissionsState,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      notificationsState: notificationsState ?? this.notificationsState,
      notificationsFailMessage:
          notificationsFailMessage ?? this.notificationsFailMessage,
      isUserSubscribedToNotifications: isUserSubscribedToNotifications ??
          this.isUserSubscribedToNotifications,
      notificationsPermissionsState: notificationsPermissionsState ?? this.notificationsPermissionsState
    );
  }
}
