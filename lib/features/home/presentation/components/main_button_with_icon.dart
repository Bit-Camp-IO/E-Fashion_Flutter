import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class MainButtonWithIcon extends StatelessWidget {
  const MainButtonWithIcon({
    super.key,
    required this.buttonTitle,
    required this.buttonIcon,
    required this.onTap,
    required this.width,
    required this.height,
  });
  final String buttonTitle;
  final Icon buttonIcon;
  final double width;
  final double height;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 230.w,
        height: 46.h,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Iconsax.bag_2, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              'Add To Bag',
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
