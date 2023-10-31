import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/account/bloc/profile_cubit/profile_cubit.dart';
import 'package:efashion_flutter/presentation/cart/components/payment_clipper.dart';
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/secondary_button.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:efashion_flutter/shared/util/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

@RoutePage()
class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24).r,
        child: Column(
          children: [
            Center(
                child: Text(
              'ORDER RECEIPT',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 30.sp, color: Theme.of(context).colorScheme.onSurface, fontFamily: AssetsManager.primaryFontFamily),
            )),
            Expanded(
              child: Center(
                child: ClipPath(
                  clipper: PaymentClipper(),
                  child: Container(
                    width: 312.w,
                    height: SizeManager.screenHeight * 0.7,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 8.h),
                        Icon(
                          Iconsax.verify,
                          color: ColorsManager.successColor,
                          size: 40.sp,
                        ),
                        Text(
                          'Congratulations',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          'Your order is confirmed',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorsManager.textColorPrimary,
                                  ),
                        ),
                        SizedBox(height: 12.h),
                        const DashDivider(),
                        Padding(
                          padding: const EdgeInsets.all(24.0).r,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ordered By : ${context.read<ProfileCubit>().state.userData.fullName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: ColorsManager.textColorPrimary,
                                      ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Date : ${DateFormat('d, MMM, y').format(DateTime.now())}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: ColorsManager.textColorPrimary,
                                      ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Time : ${DateFormat('h:mm a').format(DateTime.now())}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color:
                                              ColorsManager.textColorPrimary),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Delivery Date : ${DateFormat('d, MMM, y').format(DateTime.now().add(const Duration(days: 2)))}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: ColorsManager.textColorPrimary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24).r,
                          child: const DashDivider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0).r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Order Price : ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                '\$${context.read<CartCubit>().state.cart.total} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        SecondaryButton(
                          width: 170.w,
                          height: 42.h,
                          buttonTitle: 'Go Back',
                          onTap: () {
                            context.popRoute();
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashDivider extends StatelessWidget {
  const DashDivider({super.key, this.height = 1, this.color = Colors.black});

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 5.h;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(
            dashCount,
            (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
