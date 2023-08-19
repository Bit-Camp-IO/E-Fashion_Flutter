import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AccountCustomRow extends StatelessWidget {
  const AccountCustomRow({
    super.key,
    required this.prefixIcon,
    required this.text,
    required this.onTap,
    this.suffixIcon,
  });

  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            prefixIcon,
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          Icon(
            suffixIcon ?? Iconsax.arrow_right_3,
          ),
        ],
      ),
    );
  }
}
