import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/features/auth/presentation/components/welcome/welcome_curved_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
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
          Positioned(
            left: 0,
            right: 0,
            child: Image.asset(
              AssetsManager.appLogo,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -5,
            child: ClipPath(
              clipper: WelcomeCurvedClipper(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
                child: Container(
                  height: 300.h,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              "For fancy clothes and accessories",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
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
            ),
          ),
        ],
      ),
    );
  }
}
