import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';

class GridCardShimmerLoading extends StatelessWidget {
  final bool reverse;
  const GridCardShimmerLoading({super.key, this.reverse = false});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: Transform(
        transform: reverse ? Matrix4.skewY(0.13) : Matrix4.skewY(-0.13),
        alignment: reverse ? Alignment.topRight : Alignment.topLeft,
        child: Container(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
    );
  }
}
