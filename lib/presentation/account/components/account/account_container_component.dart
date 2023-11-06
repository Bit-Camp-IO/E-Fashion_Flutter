import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/shared/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_snack_bar.dart';
import 'package:efashion_flutter/presentation/shared/widgets/notifications_permissions_dialog.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:efashion_flutter/presentation/shared/bloc/tokens_cubit/tokens_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/container_button.dart';
import 'package:efashion_flutter/presentation/account/components/account/account_custom_row.dart';
import 'package:efashion_flutter/presentation/account/components/shared/account_clipped_container.dart';
import 'package:efashion_flutter/presentation/account/components/shared/icon_switcher.dart';
import 'package:efashion_flutter/presentation/shared/bloc/theme_cubit/theme_cubit.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
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
      bottom: 0.0,
      child: AccountClippedContainer(
        height: 560.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12).r,
                  child: ClippedContainerButton(
                    onTap: () {
                      context.read<TokensCubit>().deleteUserToken();
                    },
                    icon: Iconsax.logout5,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(StringsManager.profileTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(
                height: 10.h,
              ),
              AccountCustomRow(
                onTap: () {
                  context.pushRoute(const EditProfileRoute());
                },
                text: StringsManager.profileTitle,
                prefixIcon: Iconsax.user,
              ),
              AccountCustomRow(
                onTap: () {
                  context.pushRoute(const LocationRoute());
                },
                text: StringsManager.locationTab,
                prefixIcon: Iconsax.location,
              ),
              AccountCustomRow(
                onTap: () {
                  context.pushRoute(const OrdersRoute());
                },
                text: StringsManager.ordersTab,
                prefixIcon: Iconsax.bag_2,
              ),
              AccountCustomRow(
                onTap: () {
                  context.pushRoute(const ChatSupportRoute());
                },
                text: StringsManager.chatTab,
                prefixIcon: Iconsax.message,
              ),
              AccountCustomRow(
                onTap: () {
                  context.pushRoute(
                    const ChangePasswordRoute(),
                  );
                },
                text: StringsManager.changePasswordTab,
                prefixIcon: Iconsax.lock,
              ),
              BlocConsumer<NotificationsCubit, NotificationsState>(
                listenWhen: (previous, current) => previous.notificationsPermissionsState != current.notificationsPermissionsState,
                listener: (context, state) {
                  if (state.notificationsPermissionsState == NotificationsPermissionsState.permanentlyDenied) {
                    showDialog(
                      routeSettings: const RouteSettings(name: 'PermissionsDialogRoute'),
                      context: context,
                      builder: (context) {
                        return const NotificationsPermissionsDialog();
                      },
                    );
                  }else if (state.notificationsPermissionsState == NotificationsPermissionsState.granted && state.isUserSubscribedToNotifications == false){
                    context.read<NotificationsCubit>().subscribeToNotifications();
                  }
                  if (state.userNotificationsSubscriptionState == CubitState.failure){
                    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.show(customSnackBarType: CustomSnackBarType.error, message: "ERROR! Check your internet connection", context: context));
                  }
                },
                builder: (context, state) {
                  return AccountCustomRow(
                    enableOnTap: false,
                    text: StringsManager.notificationSwitch,
                    prefixIcon: Iconsax.notification,
                    suffixWidget: IconSwitcher(
                      isSwitcherActive: state.isUserSubscribedToNotifications,
                      activeTrackColor: Theme.of(context).colorScheme.error,
                      activeIconColor: Colors.white,
                      activeThumbColor: Colors.white,
                      disabledTrackColor: ColorsManager.successColor,
                      onChanged: (switched) {
                        if (switched && state.notificationsPermissionsState == NotificationsPermissionsState.granted) {
                          context.read<NotificationsCubit>().subscribeToNotifications();
                        } else if (state.notificationsPermissionsState == NotificationsPermissionsState.denied || state.notificationsPermissionsState == NotificationsPermissionsState.permanentlyDenied) {
                          context.read<NotificationsCubit>().requestNotificationsPermissions();
                        } else {
                          context.read<NotificationsCubit>().unSubscribeFromNotifications();
                        }
                      },
                      activeIcon: Icons.notifications_off_outlined,
                      disabledIcon: Icons.notifications_active_outlined,
                    ),
                  );
                },
              ),
              AccountCustomRow(
                enableOnTap: false,
                text: StringsManager.appThemeSwitch,
                prefixIcon: Iconsax.sun_1,
                suffixWidget: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return IconSwitcher(
                      isSwitcherActive: state.appTheme.isDarkTheme,
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
