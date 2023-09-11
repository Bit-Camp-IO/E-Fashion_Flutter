import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AccountCustomRow extends StatelessWidget {
  const AccountCustomRow({
    super.key,
    required this.prefixIcon,
    required this.text,
    this.onTap,
    this.enableOnTap = true,
    this.suffixWidget,
  });

  final IconData prefixIcon;
  final Widget? suffixWidget;
  final String text;
  final bool enableOnTap;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enableOnTap ? onTap : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10).r,
        child: Row(
          children: [
            Icon(
              prefixIcon,
              size: 24.sp,
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Spacer(),
            suffixWidget ?? Icon(
               Iconsax.arrow_right_3,
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
