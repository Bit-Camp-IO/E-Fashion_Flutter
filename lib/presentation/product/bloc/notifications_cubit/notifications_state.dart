part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final List<Notification> notifications;
  final CubitState notificationsState;
  final String notificationsFailMessage;

  const NotificationsState({
    this.notifications = const [],
    this.notificationsState = CubitState.initial,
    this.notificationsFailMessage = '',
  });

  @override
  List<Object?> get props => [
        notifications,
        notificationsState,
        notificationsFailMessage,
      ];

  NotificationsState copyWith({
    List<Notification>? notifications,
    CubitState? notificationsState,
    String? notificationsFailMessage,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      notificationsState: notificationsState ?? this.notificationsState,
      notificationsFailMessage:
          notificationsFailMessage ?? this.notificationsFailMessage,
    );
  }
}
