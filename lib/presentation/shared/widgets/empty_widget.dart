import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWidget extends StatelessWidget{
  final String image;
  final String title;
  final String subTitle;
  const EmptyWidget({super.key, required this.image, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return CustomFadeAnimation(
      duration: const Duration(milliseconds: 300),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 120.w,
              height: 120.h,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            )
          ],
        ),
      ),
    );
  }

}