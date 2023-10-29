import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartShimmerLoading extends StatelessWidget {
  const CartShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: Column(
        children: [
          Column(
            children: List.generate(
              4,
                  (index) => Padding(
                padding: const EdgeInsets.only(top: 8.0).r,
                child: Container(
                  width: 312.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(20).r),
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 8.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                ),
                Container(
                  height: 8.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 312.w,
            height: 46.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(12).r,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
