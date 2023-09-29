import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

SnackBar customSnackBar({
  required CustomSnackBarType customSnackBarType,
  required String message,
  required BuildContext context,
}) {
  return SnackBar(
    animation: CurvedAnimation(
      curve: Curves.bounceIn,
      parent: kAlwaysCompleteAnimation,
    ),
    backgroundColor: customSnackBarType == CustomSnackBarType.error
        ? Theme.of(context).colorScheme.errorContainer
        : ColorsManager.successColor,
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10).r),
    behavior: SnackBarBehavior.floating,
    content: CustomFadeAnimation(
      duration: const Duration(milliseconds: 250),
      child: Row(
        children: [
          Icon(
            customSnackBarType == CustomSnackBarType.error
                ? Iconsax.close_circle
                : Iconsax.verify,
            color: Colors.white,
            size: 20.sp,
          ),
          SizedBox(width: 3.w),
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

enum CustomSnackBarType {
  error,
  success,
}
