import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/notifications/componenets/notification_shimmer_loading.dart';
import 'package:efashion_flutter/presentation/shared/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/notifications/componenets/delivery_notification.dart';
import 'package:efashion_flutter/presentation/notifications/componenets/message_notification.dart';
import 'package:efashion_flutter/presentation/shared/widgets/no_internet_connection_widget.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

@RoutePage()
class NotificationsScreen extends StatefulWidget{
  const NotificationsScreen({super.key});


  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isLoading = false;
  @override
  void initState() {
    context.read<NotificationsCubit>().getNotificationsList();
    super.initState();
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
              child: BlocConsumer<NotificationsCubit, NotificationsState>(
                listener: (context, state) {
                  if (state.notificationsState == CubitState.loading) {
                    isLoading = true;
                  } else{
                    isLoading = false;
                  }
                },
                builder: (context, state) {
                  if(state.notificationsState == CubitState.failure){
                    return NoInternetConnectionWidget(
                      onButtonTap: () {
                        context.read<NotificationsCubit>().getNotificationsList();
                      },
                      isButtonLoading: isLoading,
                    );
                  }else{
                    return ListView.builder(
                      itemCount: state.notificationsState == CubitState.loading ? 6 : state.notifications.length,
                      padding: const EdgeInsets.only(top: 30, bottom: 100).r,
                      itemBuilder: (context, index) {
                        if (state.notificationsState == CubitState.initial || state.notificationsState == CubitState.loading) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0).r,
                            child: const NotificationShimmerLoading(),
                          );
                        } else {
                          String formattedDate = DateFormat.jm().format(
                            DateTime.parse(state.notifications[index].date)
                                .toLocal(),
                          );
                          if (state.notifications[index].type == NotificationType.newMessage.value) {
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
                                notificationTitle:
                                state.notifications[index].title,
                                notificationBody: state.notifications[index].body,
                                deliveryStatus: 2,
                                notificationTime: formattedDate,
                              ),
                            );
                          }
                        }
                      },
                    );
                  }

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
