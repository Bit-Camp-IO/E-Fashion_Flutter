import 'package:efashion_flutter/features/auth/presentation/components/shared/auth_container_clipper.dart';
import 'package:flutter/material.dart';

class AuthClippedContainer extends StatelessWidget {
  const AuthClippedContainer({super.key, required this.height, required this.child});
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AuthContainerClipper(),
      child: Container(
        height: height,
        color: Theme.of(context).colorScheme.onInverseSurface,
        child: child,
      ),
    );
  }
}
