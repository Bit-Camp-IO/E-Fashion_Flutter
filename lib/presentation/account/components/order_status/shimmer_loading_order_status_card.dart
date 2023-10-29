import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerLoadingOrderStatusCard extends StatelessWidget {
  const ShimmerLoadingOrderStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0).r,
        child: Container(
          width: 320.w,
          height: 120.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(20).r,
          ),
        ),
      ),
    );
  }
}
