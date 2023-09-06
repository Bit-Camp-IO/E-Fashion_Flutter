import 'package:efashion_flutter/shared/presentation/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateNotification extends StatelessWidget {
  const RateNotification({
    super.key,
    required this.notificationBody,
    required this.notificationTime,
    required this.onRateTap,
  });

  final String notificationBody;
  final String notificationTime;
  final void Function() onRateTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          notificationTime,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 312.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 185.w,
                child: Text(
                  notificationBody,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  maxLines: null,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              const SizedBox(width: 10),
              SecondaryButton(
                width: 72.w,
                height: 42.h,
                buttonTitle: 'Rate',
                onTap: onRateTap,
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
