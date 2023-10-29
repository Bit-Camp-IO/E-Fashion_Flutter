import 'dart:math';

import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerLoadingMessage extends StatelessWidget {
  final bool isReversed;
  const ShimmerLoadingMessage({super.key, required this.isReversed});
  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: Align(
        alignment: isReversed ? Alignment.centerLeft : Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0).r,
          child: UnconstrainedBox(
            child: Container(
              width: (80 + Random().nextInt(70)).w,
              height: 50.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  topRight: const Radius.circular(30).r,
                  topLeft: const Radius.circular(30).r,
                  bottomLeft: isReversed ?  const Radius.circular(0) : const Radius.circular(30).r,
                  bottomRight: isReversed ? const Radius.circular(30).r : const Radius.circular(0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
