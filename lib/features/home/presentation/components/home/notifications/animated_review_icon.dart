import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedReviewIcon extends StatelessWidget {
  const AnimatedReviewIcon({
    super.key,
    required this.isSelected,
    required this.svgIconPath,
    required this.label,
    required this.onTap,
  });

  final bool isSelected;
  final String svgIconPath;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Column(
          key: ValueKey<bool>(isSelected),
          children: [
            SvgPicture.asset(
             svgIconPath,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? const Color(0xFFFFF504)
                    : Theme.of(context).colorScheme.outline,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
