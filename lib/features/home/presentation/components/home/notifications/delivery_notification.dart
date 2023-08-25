import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/core/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class DeliveryNotification extends StatelessWidget {
  const DeliveryNotification({
    super.key,
    required this.notificationImagePath,
    required this.notificationTitle,
    required this.notificationBody,
    required this.deliveryStatus,
    required this.notificationTime,
  });

  final String notificationImagePath;
  final String notificationTitle;
  final String notificationBody;
  final DeliverStatus deliveryStatus;
  final String notificationTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 312.w,
          height: 90.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6).r,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15).r,
                  child: CachedNetworkImage(
                    width: 60.w,
                    height: 80.h,
                    imageUrl: notificationImagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 140.w,
                        child: Text(
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          maxLines: null,
                          notificationTitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ),
                      SizedBox(
                        width: 120.w,
                        child: Text(
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          maxLines: null,
                          notificationBody,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
                Icon(
                  Iconsax.verify,
                  color: deliveryStatus == DeliverStatus.delivered
                      ? const Color(0xFF07D803)
                      : Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          notificationTime,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}
