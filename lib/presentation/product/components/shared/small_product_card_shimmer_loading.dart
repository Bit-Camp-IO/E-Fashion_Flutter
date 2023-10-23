import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallProductCardShimmerLoading extends StatelessWidget {
  const SmallProductCardShimmerLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: Container(
        width: 150.w,
        height: 280.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outlineVariant,
          borderRadius: BorderRadius.circular(20).r,
        ),
      ),
    );
  }
}
