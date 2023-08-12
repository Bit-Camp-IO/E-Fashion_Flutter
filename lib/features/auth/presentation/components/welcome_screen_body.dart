import 'dart:ui';

import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.sizeOf(context).width.toString());
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
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF001D34).withOpacity(.5),
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(40.0).r,
                            ),
                          ),
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
                      )),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// path.lineTo(0, height);
// path.lineTo(width, height);
// path.lineTo(width, 100);
class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final path = Path();
    path.lineTo(0, height); // point 1
    path.lineTo(width, height); // point 2
    path.lineTo(width, 0); // point 3
    path.quadraticBezierTo(width * .5, height - 100, width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
