import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconSwitcher extends StatefulWidget {
  const IconSwitcher({
    super.key,
    required this.onChanged,
    required this.activeIcon,
    required this.disabledIcon,
    required this.initialSwitcherValue,
    this.activeIconColor = const Color(0xFF1A1C1E),
    this.activeTrackColor = const Color(0xFFFFFFFF),
    this.activeThumbColor = const Color(0xFF1A1C1E),
    this.disabledIconColor = const Color(0xFFFFFFFF),
    this.disabledTrackColor = const Color(0xFF1A1C1E),
    this.disabledThumbColor = const Color(0xFFFFFFFF),
  });

  @override
  State<IconSwitcher> createState() => _IconSwitcherState();
  final void Function(bool switched) onChanged;
  final IconData activeIcon;
  final Color activeIconColor;
  final IconData disabledIcon;
  final Color disabledIconColor;
  final bool initialSwitcherValue;
  final Color activeTrackColor;
  final Color activeThumbColor;
  final Color disabledTrackColor;
  final Color disabledThumbColor;
}

class _IconSwitcherState extends State<IconSwitcher> {
  late bool switcherValue;

  @override
  void initState() {
    switcherValue = widget.initialSwitcherValue;
    super.initState();
  }

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
              activeColor: widget.activeThumbColor,
              activeTrackColor: widget.activeTrackColor,
              inactiveTrackColor: widget.disabledTrackColor,
              inactiveThumbColor: widget.disabledThumbColor,
              onChanged: (value) {
                setState(() {
                  switcherValue = value;
                  widget.onChanged(value);
                });
              },
              value: switcherValue,
            ),
          ),
        ),
        switcherValue
            ? Positioned(
                top: 0,
                bottom: 0,
                left: 7.w,
                child: Icon(
                  widget.activeIcon,
                  color: widget.activeIconColor,
                  size: 14.sp,
                ),
              )
            : Positioned(
                top: 0,
                bottom: 0,
                right: 7.w,
                child: Icon(
                  widget.disabledIcon,
                  color: widget.disabledIconColor,
                  size: 14.sp,
                ),
              ),
      ],
    );
  }
}
