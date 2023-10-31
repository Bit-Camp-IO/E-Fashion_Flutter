import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationShimmerLoading extends StatelessWidget {
  const NotificationShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: Container(
        width: 312.w,
        height: 85.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(10).r,
        ),
      ),
    );
  }
}
