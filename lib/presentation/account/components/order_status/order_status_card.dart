import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    super.key,
    required this.orderPicture,
    required this.orderName,
    required this.orderCost,
    this.orderSize,
    required this.orderProgress,
  });

  final String orderPicture;
  final String orderName;
  final int orderCost;
  final String? orderSize;
  final int orderProgress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(
          DeliveryStatusRoute(
            activeStep: orderProgress,
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
            child: Stack(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15).r,
                      child: CachedNetworkImage(
                        width: 90.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                        imageUrl: orderPicture,
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          orderName,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        orderSize != null
                            ? Text(
                                'Size : ${orderSize!}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                              )
                            : const SizedBox.shrink(),
                        SizedBox(
                            height: orderSize != null
                                ? 8.h
                                : 4.h),
                        Text(
                          '\$$orderCost',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Delivery Status',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
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
