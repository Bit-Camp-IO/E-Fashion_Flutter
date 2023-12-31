import 'package:efashion_flutter/shared/util/size_manager.dart';
import 'package:efashion_flutter/presentation/auth/components/shared/auth_container_clipper.dart';
import 'package:flutter/material.dart';

class AuthClippedContainer extends StatelessWidget {
  final double height;
  final Widget child;
  const AuthClippedContainer({super.key, required this.height, required this.child});
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
