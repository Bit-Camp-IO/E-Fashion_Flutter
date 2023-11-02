import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationsPermissionsDialog extends StatelessWidget {
  const NotificationsPermissionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 250, horizontal: 0).r,
      child: SizedBox(
        width: 300.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_active,
              color: Theme.of(context).colorScheme.primary,
              size: 24.sp,
            ),
            SizedBox(height: 20.h),
            Text(
              StringsManager.notificationPermissionDialog,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                context.popRoute();
                openAppSettings();
              },
              child: Container(
                width: 240.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ).r,
                ),
                child: Center(
                  child: Text(
                    StringsManager.notificationOpenSettingButton,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            GestureDetector(
              onTap: () {
                context.popRoute();
              },
              child: Container(
                width: 240.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ).r,
                ),
                child: Center(
                  child: Text(
                    StringsManager.notificationDialogCloseButton,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.white,
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
