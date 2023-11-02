import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CartIconButton extends StatelessWidget {

  final void Function()? onCartTap;
  const CartIconButton({
    super.key,
    required this.onCartTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onCartTap,
      icon: Icon(
        Iconsax.bag_2,
        color: Theme.of(context).colorScheme.primary,
        size: 24.sp,
      ),
    );
  }
}
