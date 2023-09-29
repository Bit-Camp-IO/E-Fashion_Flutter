import 'dart:ui';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_rotation_animation.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_slide_animation.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:efashion_flutter/presentation/auth/components/welcome/welcome_curved_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeContainerComponent extends StatelessWidget {
  const WelcomeContainerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSlideAnimation(
      duration: const Duration(seconds: 1),
      animationDirection: AnimationDirection.bottom,
      child: ClipPath(
        clipper: WelcomeCurvedClipper(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
          child: Container(
            height: 297.h,
            color: ColorsManager.welcomeColor.withOpacity(0.5),
            child: Stack(
              children: [
                Positioned(
                  left: 20.w,
                  bottom: 70.h,
                  child: CustomSlideAnimation(
                    duration: const Duration(milliseconds: 1500),
                    animationDirection: AnimationDirection.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringsManager.welcomeTitle,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          StringsManager.welcomeSubtitle,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 30.w,
                  top: 50.h,
                  child: CustomFadeAnimation(
                    child: Stack(
                      children: [
                        CustomRotationAnimation(
                          child: Image.asset(
                            AssetsManager.swipeToStartImage,
                            height: 80.h,
                            width: 80.w,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(AssetsManager.swipeUpArrowImage),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
