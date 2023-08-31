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
  });
  final String buttonTitle;
  final Icon? buttonIcon;
  final double? width;
  final double? height;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 312.w,
        height: height ?? 46.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(12)).r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonIcon ?? const SizedBox.shrink(),
            buttonIcon != null ? const SizedBox(width: 10) : const SizedBox.shrink(),
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
