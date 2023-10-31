import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionItemCardShimmerLoading extends StatelessWidget {
  const CollectionItemCardShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0).r,
        child: Container(
          width: 312.w,
          height: 196.h,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(16).r
          ),
        ),
      ),
    );
  }
}
