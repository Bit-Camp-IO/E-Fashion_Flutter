import 'package:efashion_flutter/features/account/presentation/components/shared/account_skew_clipper.dart';
import 'package:flutter/material.dart';

class AccountClippedContainer extends StatelessWidget {
  const AccountClippedContainer({super.key, required this.height, required this.child});
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AccountSkewClipper(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        color: Theme.of(context).colorScheme.onInverseSurface,
        height: height,
        child: child,
      ),
    );
  }
}
