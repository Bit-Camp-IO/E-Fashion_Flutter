import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class NoSearchYet extends StatelessWidget {
  const NoSearchYet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.search_normal_1,
            color: Theme.of(context).colorScheme.primary,
            size: 80.sp,
          ),
          SizedBox(height: 16.h),
          Text(
            textAlign: TextAlign.center,
            'No results yet\n try to type something.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          )
        ],
      ),
    );
  }
}
