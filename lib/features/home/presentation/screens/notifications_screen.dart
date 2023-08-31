import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/util/enums.dart';
import 'package:efashion_flutter/core/widgets/custom_appbar.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/notifications/delivery_notification.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/notifications/message_notification.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/notifications/rating_bottom_sheet.dart';
import 'package:efashion_flutter/features/home/presentation/mock/notifications_mock.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/notifications/rate_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
              child: ListView.builder(
                itemCount: notifications.length,
                padding: const EdgeInsets.only(top: 30).r,
                itemBuilder: (context, index) {
                  if (notifications[index].notificationType ==
                      NotificationType.orderStatus) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0).r,
                      child: DeliveryNotification(
                        notificationImagePath: notifications[index].notificationPic!,
                        notificationTitle: notifications[index].notificationTitle!,
                        notificationBody: notifications[index].notificationBody,
                        deliveryStatus:
                            notifications[index].notificationDeliveryStatus!,
                        notificationTime: notifications[index].notificationTime,
                      ),
                    );
                  } else if (notifications[index].notificationType ==
                      NotificationType.rating) {
                    return RateNotification(
                      notificationTime: notifications[index].notificationTime,
                      notificationBody: notifications[index].notificationBody,
                      onRateTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const RatingBottomSheet();
                          },
                        );
                      },
                    );
                  } else {
                    return Column(
                      children: [
                        MessageNotification(
                          notificationBody: notifications[index].notificationBody,
                          notificationTime: notifications[index].notificationTime,
                        ),
                      ],
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
