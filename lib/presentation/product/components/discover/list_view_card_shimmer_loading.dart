import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewCardShimmerLoading extends StatelessWidget {
  const ListViewCardShimmerLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewY(0.1),
      alignment: Alignment.topRight,
      child: CustomShimmerEffect(
        child: Container(
          width: 312.w,
          height: 300.h,
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
    );
  }
}
