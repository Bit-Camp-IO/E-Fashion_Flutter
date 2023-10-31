import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
class CustomSnackBar{
  static SnackBar show({
    required CustomSnackBarType customSnackBarType,
    required String message,
    required BuildContext context,
    TextStyle? textStyle,
  }) {
    return SnackBar(
      duration: const Duration(milliseconds: 1500),
      width: customSnackBarType == CustomSnackBarType.clipboard ? 250.w : null,
      animation: CurvedAnimation(
        curve: Curves.bounceIn,
        parent: kAlwaysCompleteAnimation,
      ),
      backgroundColor: _buildSnackBarColor(customSnackBarType, context),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10).r),
      behavior: SnackBarBehavior.floating,
      content: CustomFadeAnimation(
        duration: const Duration(milliseconds: 250),
        child: Row(
          children: [
            Icon(_buildSnackBarIcon(customSnackBarType, context),
              color: Colors.white,
              size: 20.sp,
            ),
            SizedBox(width: 3.w),
            Text(
              message,
              style: textStyle ?? Theme.of(context).textTheme.labelMedium!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
  static Color _buildSnackBarColor(CustomSnackBarType customSnackBarType, BuildContext context){
    if(customSnackBarType == CustomSnackBarType.success || customSnackBarType == CustomSnackBarType.clipboard){
      return ColorsManager.successColor;
    }else{
      return ColorsManager.errorColor;
    }
  }
  static IconData _buildSnackBarIcon(CustomSnackBarType customSnackBarType, BuildContext context){
    switch(customSnackBarType){
      case CustomSnackBarType.success:
        return Iconsax.verify;
      case CustomSnackBarType.error:
        return Iconsax.close_circle;
      case CustomSnackBarType.clipboard:
        return Iconsax.clipboard_text;
    }
  }
}




enum CustomSnackBarType {
  error,
  success,
  clipboard,
}
