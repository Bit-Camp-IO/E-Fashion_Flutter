import 'dart:ui';

import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/features/auth/presentation/components/login_screen_curved_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
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
                Image.asset(
                  AssetsManager.appLogo,
                  width: 180.w,
                  height: 226.h,
                ),
                const LoginScreenCurvedContainer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
