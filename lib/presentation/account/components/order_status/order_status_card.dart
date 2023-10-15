import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.orderId,
    required this.orderCost,
    required this.orderStatus,
  });

  final String orderId;
  final int orderCost;
  final int orderStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(
          TrackOrderRoute(
            activeStep: orderStatus - 1,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0).r,
        child: Container(
          width: 312.w,
          height: 120.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(20).r,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8,
            ).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.box, size: 20.sp, color: Theme.of(context).colorScheme.onSurface,),
                    SizedBox(width: 16.w),
                    Text(
                      'OrderId : #${orderId.length > 15 ? '${orderId.substring(0,15)}..' : orderId}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    IconButton(
                      onPressed: () async{
                        await Clipboard.setData(ClipboardData(text: orderId));
                      },
                      icon: Icon(Iconsax.copy, color: Theme.of(context).colorScheme.primary, size: 20.sp,),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Order Price : \$$orderCost',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Track Order',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
