import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/features/account/presentation/components/account_custom_row.dart';
import 'package:efashion_flutter/features/account/presentation/components/account_skew_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AccountClippedContainer extends StatelessWidget {
  const AccountClippedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: -5,
      child: ClipPath(
        clipper: AccountSkewClipper(),
        child: Container(
          color: Theme.of(context).colorScheme.onInverseSurface,
          height: MediaQuery.sizeOf(context).height * 0.75,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: const EdgeInsets.all(12.0).r,
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Iconsax.logout5,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 64.h,
                ),
                Text(
                  "Profile Settings",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 18.0,
                      ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                AccountCustomRow(
                  onTap: () {
                    context.pushRoute(const EditProfileRoute());
                  },
                  text: "My Profile",
                  prefixIcon: Iconsax.user,
                ),
                SizedBox(
                  height: 24.h,
                ),
                AccountCustomRow(
                  onTap: () {
                    context.pushRoute(const LocationRoute());
                  },
                  text: "Location",
                  prefixIcon: Iconsax.location,
                ),
                SizedBox(
                  height: 24.h,
                ),
                AccountCustomRow(
                  onTap: () {
                    context.pushRoute(const OrderStatusRoute());
                  },
                  text: "Order Status",
                  prefixIcon: Iconsax.bag_2,
                ),
                SizedBox(
                  height: 24.h,
                ),
                AccountCustomRow(
                  onTap: () {
                    context.pushRoute(
                      const ChatSupportRoute(),
                    );
                  },
                  text: "Chat Support",
                  prefixIcon: Iconsax.message,
                ),
                SizedBox(
                  height: 24.h,
                ),
                AccountCustomRow(
                  onTap: () {},
                  text: "Notifications",
                  prefixIcon: Iconsax.notification,
                ),
                SizedBox(
                  height: 32.h,
                ),
                AccountCustomRow(
                  onTap: () {},
                  text: "Dark Theme",
                  prefixIcon: Iconsax.sun_1,
                  suffixIcon: Iconsax.moon5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
