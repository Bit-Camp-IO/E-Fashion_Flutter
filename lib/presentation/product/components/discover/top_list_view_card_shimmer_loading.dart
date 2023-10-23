import 'package:efashion_flutter/presentation/shared/widgets/card_bottom_skew_clipper.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopListViewCardShimmerLoading extends StatelessWidget {
  const TopListViewCardShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: ClipPath(
        clipper: CardBottomSkewClipper(skewAmount: 0.12, reverse: true),
        child: Container(
          width: 312.w,
          height: 300.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outlineVariant,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ).r,
          ),
        ),
      ),
    );
  }
}
