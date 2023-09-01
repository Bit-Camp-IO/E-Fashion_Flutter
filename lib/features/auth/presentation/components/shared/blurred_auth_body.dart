import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/core/widgets/blurred_background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlurredAuthBody extends StatelessWidget {
  const BlurredAuthBody({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const BlurredBackgroundImage(
          imagePath: AssetsManager.welcomeImage,
          isLocalImage: true,
        ),
        Positioned(
          top: 80,
          left: 0,
          right: 0,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Visibility(
              key: ValueKey<bool>(FocusScope.of(context).hasPrimaryFocus ||
                  !FocusScope.of(context).hasFocus),
              visible: FocusScope.of(context).hasPrimaryFocus ||
                  !FocusScope.of(context).hasFocus,
              child: Image.asset(
                AssetsManager.appLogo,
                width: 180.w,
                height: 226.h,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: -1,
          bottom: -5,
          child: child,
        ),
      ],
    );
  }
}
