import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconSwitcher extends StatelessWidget {
  final void Function(bool switched) onChanged;
  final IconData activeIcon;
  final Color activeIconColor;
  final IconData disabledIcon;
  final Color disabledIconColor;
  final bool isSwitcherActive;
  final Color activeTrackColor;
  final Color activeThumbColor;
  final Color disabledTrackColor;
  final Color disabledThumbColor;

  const IconSwitcher({
    super.key,
    required this.onChanged,
    required this.activeIcon,
    required this.disabledIcon,
    required this.isSwitcherActive,
    this.activeIconColor = ColorsManager.switcherActiveIconColor,
    this.activeTrackColor = ColorsManager.switcherActiveTrackColor,
    this.activeThumbColor = ColorsManager.switcherActiveThumbColor,
    this.disabledIconColor = ColorsManager.switcherDisabledIconColor,
    this.disabledTrackColor = ColorsManager.switcherDisabledTrackColor,
    this.disabledThumbColor = ColorsManager.switcherDisabledThumbColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 52.w,
          height: 32.h,
          child: Transform.scale(
            scale: 0.9,
            child: Switch(
              activeColor: activeThumbColor,
              activeTrackColor: activeTrackColor,
              inactiveTrackColor: disabledTrackColor,
              inactiveThumbColor: disabledThumbColor,
              onChanged: (value) {
                onChanged(value);
              },
              value: isSwitcherActive,
            ),
          ),
        ),
        isSwitcherActive
            ? Positioned(
                top: 0,
                bottom: 0,
                left: 7.w,
                child: Icon(
                  activeIcon,
                  color: activeIconColor,
                  size: 14.sp,
                ),
              )
            : Positioned(
                top: 0,
                bottom: 0,
                right: 7.w,
                child: Icon(
                  disabledIcon,
                  color: disabledIconColor,
                  size: 14.sp,
                ),
              ),
      ],
    );
  }
}
