import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class MessageNotification extends StatelessWidget {
  const MessageNotification({
    super.key,
    required this.notificationBody,
    required this.notificationTime,
  });

  final String notificationBody;
  final String notificationTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You received a message fom chat support',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        Container(
          width: 312.w,
          height: 85.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16).r,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    notificationTime,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      Iconsax.message,
                      color: Theme.of(context).colorScheme.primary,
                      size: 14.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                     notificationBody,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: null,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
