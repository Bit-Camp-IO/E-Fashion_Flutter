import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClippedContainerButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final Color? iconColor;
  final double? width;
  final double? height;

  const ClippedContainerButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0).r,
        width: width ?? 48.w,
        height: height ?? 48.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor ?? Colors.white,
        ),
      ),
    );
  }
}
