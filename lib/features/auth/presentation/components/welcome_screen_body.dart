import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/features/auth/presentation/components/welcome_curved_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dy < 0) {
          context.pushRoute(const LoginRoute());
        }
      },
      child: Stack(
        children: [
          const Image(
            fit: BoxFit.cover,
            height: double.infinity,
            image: AssetImage(
              AssetsManager.welcomeImage,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 154.h,
              ),
              Image.asset(
                AssetsManager.appLogo,
              ),
              SizedBox(
                height: 50.h,
              ),
              Expanded(
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: WelcomeCurvedClipper(),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
                        child: Container(
                          width: double.infinity,
                          color: const Color(0xFF001D34).withOpacity(0.5),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24.w,
                      bottom: 90.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start your new",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          Text(
                            "shopping experience",
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
            ],
          ),
        ],
      ),
    );
  }
}
