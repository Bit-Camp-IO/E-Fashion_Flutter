import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesShimmerLoading extends StatelessWidget {
  const CategoriesShimmerLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: Padding(
        padding: const EdgeInsets.only(left: 15).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18).r,
              child: Container(
                height: 8.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(10).r,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 80.h,
                  width: 137.w,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(20).r),
                ),
                const Spacer(),
                Container(
                  height: 80.h,
                  width: 190.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ).r,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
