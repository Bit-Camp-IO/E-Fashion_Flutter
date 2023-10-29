import 'package:efashion_flutter/presentation/shared/widgets/dots_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.buttonTitle,
    this.buttonIcon,
    required this.onTap,
    this.width,
    this.height,
    this.isLoading = false,
  });

  final String buttonTitle;
  final Icon? buttonIcon;
  final double? width;
  final double? height;
  final void Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 312.w,
        height: height ?? 46.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonIcon ?? const SizedBox.shrink(),
            buttonIcon != null
                ? SizedBox(width: 10.w)
                : const SizedBox.shrink(),
            isLoading ?  const DotsLoadingIndicator() :
                Text(
                  buttonTitle,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white),
                ),
          ],
        ),
      ),
    );
  }
}
