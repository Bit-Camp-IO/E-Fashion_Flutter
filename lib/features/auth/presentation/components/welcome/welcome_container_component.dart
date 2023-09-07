import 'dart:ui';

import 'package:efashion_flutter/core/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/core/animations/custom_rotation_animation.dart';
import 'package:efashion_flutter/core/animations/custom_slide_animation.dart';
import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/core/util/size_manager.dart';
import 'package:efashion_flutter/features/auth/presentation/components/welcome/welcome_curved_clipper.dart';
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
            height: SizeManager.screenHeight * 0.4,
            color: const Color(0xFF001D34).withOpacity(0.5),
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  bottom: 100,
                  child: CustomSlideAnimation(
                    duration: const Duration(milliseconds: 1500),
                    animationDirection: AnimationDirection.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start your new \nhopping experience",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "For fancy clothes and accessories",
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
                    right: 30,
                    top: 60,
                    child: CustomFadeAnimation(
                      child: Stack(
                        children: [
                          CustomRotationAnimation(
                            child: Image.asset(AssetsManager.swipeToStartImage),
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
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
