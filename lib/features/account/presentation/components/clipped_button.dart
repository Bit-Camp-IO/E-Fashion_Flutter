import 'package:efashion_flutter/features/account/presentation/components/button_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClippedButton extends StatelessWidget {
  const ClippedButton({super.key, required this.text, required this.backgroundColor, required this.onTap});
  final String text;
  final Color backgroundColor;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipPath(
        clipper: ButtonClipper(),
        child: Container(
          padding: const EdgeInsets.only(top: 10.0).r,
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          width: 100.w,
          height: 42.h,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
