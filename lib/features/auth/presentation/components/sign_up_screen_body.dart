import 'dart:ui';

import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/features/auth/presentation/components/sign_up_screen_curved_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreenBody extends StatefulWidget {
  const SignupScreenBody({super.key});

  @override
  State<SignupScreenBody> createState() => _SignupScreenBodyState();
}

class _SignupScreenBodyState extends State<SignupScreenBody> {
  final GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaY: 15,
                sigmaX: 15,
              ),
              child: Image(
                image: const AssetImage(
                  AssetsManager.welcomeImage,
                ),
                width: double.infinity,
                height: 500.h,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 62.h,
                ),
                Image(
                  width: 180.w,
                  height: 226.h,
                  image: const AssetImage(
                    AssetsManager.appLogo,
                  ),
                ),
                const SignUpScreenCurvedContainer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
