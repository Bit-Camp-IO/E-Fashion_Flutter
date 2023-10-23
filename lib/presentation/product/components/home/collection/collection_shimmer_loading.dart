import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionShimmerLoading extends StatelessWidget {
  const CollectionShimmerLoading({super.key});


  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: Container(
        height: 320.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outlineVariant,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ).r,
        ),
      ),
    );
  }
}
