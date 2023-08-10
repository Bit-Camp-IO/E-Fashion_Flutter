import 'dart:ui';

import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

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
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF001D34).withOpacity(.5),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(40.0).r,
                          topRight: const Radius.circular(40.0).r,
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
                      child: Column(
                        children: [
                          const Icon(
                            Iconsax.add,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "Swipe up",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
