import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/shared/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/product/components/notifications/delivery_notification.dart';
import 'package:efashion_flutter/presentation/product/components/notifications/message_notification.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget implements AutoRouteWrapper {
  const NotificationsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.read<NotificationsCubit>()..getNotificationsList(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 24, right: 24).r,
        child: Column(
          children: [
            const CustomAppBar(
              appBarTitle: 'Notifications',
              appBarType: AppBarType.normal,
            ),
            Expanded(
              child: BlocBuilder<NotificationsCubit, NotificationsState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.notifications.length,
                    padding: const EdgeInsets.only(top: 30, bottom: 100).r,
                    itemBuilder: (context, index) {
                      String formattedDate = DateFormat.jm().format(
                        DateTime.parse(
                          state.notifications[index].date,
                        ).toLocal(),
                      );
                      if (state.notifications[index].type ==
                          NotificationType.newMessage.value) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0).r,
                          child: MessageNotification(
                            notificationBody: state.notifications[index].body,
                            notificationTime: formattedDate,
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0).r,
                          child: DeliveryNotification(
                            notificationTitle: state.notifications[index].title,
                            notificationBody: state.notifications[index].body,
                            deliveryStatus: 2,
                            notificationTime: formattedDate,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
