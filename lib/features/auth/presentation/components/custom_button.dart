import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
  });

  final void Function() onPressed;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 46.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12.r,
        ),
        color: ColorsManager.lightPrimaryColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: color ?? Colors.white,
              ),
        ),
      ),
    );
  }
}
