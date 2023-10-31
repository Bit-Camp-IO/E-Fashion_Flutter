import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class NoSearchResult extends StatelessWidget {
  const NoSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.close_circle,
            color: Theme.of(context).colorScheme.primary,
            size: 80.sp,
          ),
          SizedBox(height: 16.h),
          Text(
            textAlign: TextAlign.center,
            "We couldn't find any\n search results.",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
          )
        ],
      ),
    );
  }
}
