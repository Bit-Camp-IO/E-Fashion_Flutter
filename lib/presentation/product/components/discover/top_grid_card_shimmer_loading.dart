import 'package:efashion_flutter/presentation/shared/widgets/card_bottom_skew_clipper.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopGridCardShimmerLoading extends StatelessWidget {
  final bool reverse;
  const TopGridCardShimmerLoading({super.key, this.reverse = false});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: ClipPath(
        clipper: CardBottomSkewClipper(skewAmount: 0.1, reverse: reverse),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outlineVariant,
            borderRadius: BorderRadius.only(
              topRight:
                  reverse ? const Radius.circular(20) : const Radius.circular(0),
              topLeft:
                  reverse ? const Radius.circular(0) : const Radius.circular(20),
            ).r,
          ),
        ),
      ),
    );
  }
}
