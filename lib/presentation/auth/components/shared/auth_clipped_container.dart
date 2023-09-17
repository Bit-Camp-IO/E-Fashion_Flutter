import 'package:efashion_flutter/core/util/size_manager.dart';
import 'package:efashion_flutter/presentation/auth/components/shared/auth_container_clipper.dart';
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
        width: SizeManager.screenWidth,
        height: height,
        color: Theme.of(context).colorScheme.onInverseSurface,
        child: child,
      ),
    );
  }
}
