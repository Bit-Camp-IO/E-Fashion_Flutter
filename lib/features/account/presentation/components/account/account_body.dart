import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:efashion_flutter/core/util/size_manager.dart';
import 'package:efashion_flutter/shared/presentation/widgets/container_button.dart';
import 'package:efashion_flutter/features/account/presentation/components/account/account_custom_row.dart';
import 'package:efashion_flutter/features/account/presentation/components/shared/account_clipped_container.dart';
import 'package:efashion_flutter/features/account/presentation/components/shared/icon_switcher.dart';
import 'package:efashion_flutter/shared/presentation/bloc/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AccountContainerComponent extends StatelessWidget {
  const AccountContainerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: -5,
      child: AccountClippedContainer(
        height: SizeManager.screenHeight * 0.75,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              ClippedContainerButton(
                onTap: () {
                  context.replaceRoute(const AuthRoute());
                },
                icon: Iconsax.logout5,
              ),
              SizedBox(
                height: 50.h,
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
                  context.pushRoute(const OrdersStatusRoute());
                },
                text: "Orders Status",
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
                onTap: () {
                  context.pushRoute(
                    const ChangePasswordRoute(),
                  );
                },
                text: "Change Password",
                prefixIcon: Iconsax.lock,
              ),
              SizedBox(
                height: 14.h,
              ),
              AccountCustomRow(
                enableOnTap: false,
                text: "Notifications",
                prefixIcon: Iconsax.notification,
                suffixWidget: IconSwitcher(
                  initialSwitcherValue: true,
                  activeTrackColor: Theme.of(context).colorScheme.error,
                  activeIconColor: Colors.white,
                  activeThumbColor: Colors.white,
                  disabledTrackColor: ColorsManager.successColor,
                  onChanged: (switched) {
                    debugPrint(switched.toString());
                  },
                  activeIcon: Icons.notifications_off_outlined,
                  disabledIcon: Icons.notifications_active_outlined,
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              AccountCustomRow(
                enableOnTap: false,
                text: "App Theme",
                prefixIcon: Iconsax.sun_1,
                suffixWidget: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return IconSwitcher(
                      initialSwitcherValue: state.appTheme.isDarkTheme,
                      onChanged: (switched) {
                        context.read<ThemeCubit>().changeAppTheme(switched);
                      },
                      activeIcon: Iconsax.sun_1,
                      disabledIcon: Iconsax.moon5,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
