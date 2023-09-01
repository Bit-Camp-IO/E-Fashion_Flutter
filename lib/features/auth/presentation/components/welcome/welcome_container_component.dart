import 'dart:ui';

import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/core/util/size_manager.dart';
import 'package:efashion_flutter/features/auth/presentation/components/welcome/welcome_curved_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeContainerComponent extends StatelessWidget {
  const WelcomeContainerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start your new \nhopping experience",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "For fancy clothes and accessories",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 273.w,
                bottom: 142.h,
                child: const Image(
                  image: AssetImage(
                    AssetsManager.swipeUpImage,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
