
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';


class DeliveryNotification extends StatelessWidget {
  const DeliveryNotification({
    super.key,
    required this.notificationTitle,
    required this.notificationBody,
    required this.deliveryStatus,
    required this.notificationTime,
  });

  final String notificationTitle;
  final String notificationBody;
  final int deliveryStatus;
  final String notificationTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 312.w,
          height: 95.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).r,
            child: Row(
              children: [
                Image.asset(
                  _notificationImage(),
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 140.w,
                      child: Text(
                        textAlign: TextAlign.center,
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
                const Spacer(),
                Icon(
                  Iconsax.verify,
                  color: _notificationIconColor(context)
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
  Color _notificationIconColor(BuildContext context){
    if(notificationBody == DeliveryNotificationStatus.inProgress.value){
      return Colors.white;
    }else if (notificationBody == DeliveryNotificationStatus.onItsWay.value){
      return Theme.of(context).colorScheme.primary;
    }else{
      return  ColorsManager.successColor;
    }
  }
  String _notificationImage(){
    if(notificationBody == DeliveryNotificationStatus.inProgress.value){
      return AssetsManager.deliveryImage1;
    }else if (notificationBody == DeliveryNotificationStatus.onItsWay.value){
      return AssetsManager.deliveryImage2;
    }else{
      return  AssetsManager.deliveryImage3;
    }
  }
}

enum DeliveryNotificationStatus{
  inProgress('Your order is being processed'),
  onItsWay("Your order is on it's way"),
  delivered('Your order has been delivered');
  const DeliveryNotificationStatus(this.value);
  final String value;
}
