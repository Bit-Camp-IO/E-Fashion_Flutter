import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerEffect extends StatelessWidget {
  final Widget child;
  const CustomShimmerEffect({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [
          Theme.of(context).colorScheme.outlineVariant,
          Theme.of(context).colorScheme.outline,
          Theme.of(context).colorScheme.outlineVariant,
        ],
      ),
      period: const Duration(milliseconds: 1000),
      child: child,
    );
  }
}
