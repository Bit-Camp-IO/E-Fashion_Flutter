import 'dart:ui';

import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/features/auth/presentation/components/welcome_screen_custom_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsManager.welcomeImage,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          fit: BoxFit.cover,
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
                    clipper: CustomClipPath(),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                        child: Container(
                          color: const Color(0xFF001D34).withOpacity(.5),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 128.h,
                    left: 24.w,
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
                    child: InkWell(
                      onTap: () {},
                      child: const Image(
                        image: AssetImage(
                          AssetsManager.swipeUpImage,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
