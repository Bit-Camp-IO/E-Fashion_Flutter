part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final List<AppNotification> notifications;
  final CubitState notificationsState;
  final String notificationsFailMessage;
  final bool isUserSubscribedToNotifications;
  final CubitState userNotificationsSubscriptionState;
  final NotificationsPermissionsState notificationsPermissionsState;

  const NotificationsState({
    this.notifications = const [],
    this.notificationsState = CubitState.initial,
    this.notificationsFailMessage = '',
    this.isUserSubscribedToNotifications = false,
    this.userNotificationsSubscriptionState = CubitState.initial,
    this.notificationsPermissionsState = NotificationsPermissionsState.loading,
  });

  @override
  List<Object?> get props => [
        notifications,
        notificationsState,
        notificationsFailMessage,
        isUserSubscribedToNotifications,
        userNotificationsSubscriptionState,
        notificationsPermissionsState,
      ];

  NotificationsState copyWith({
    List<AppNotification>? notifications,
    CubitState? notificationsState,
    String? notificationsFailMessage,
    bool? isUserSubscribedToNotifications,
    CubitState? userNotificationsSubscriptionState,
    NotificationsPermissionsState? notificationsPermissionsState,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      notificationsState: notificationsState ?? this.notificationsState,
      notificationsFailMessage: notificationsFailMessage ?? this.notificationsFailMessage,
      isUserSubscribedToNotifications: isUserSubscribedToNotifications ?? this.isUserSubscribedToNotifications,
      userNotificationsSubscriptionState: userNotificationsSubscriptionState ?? this.userNotificationsSubscriptionState,
      notificationsPermissionsState: notificationsPermissionsState ?? this.notificationsPermissionsState,
    );
  }
}
