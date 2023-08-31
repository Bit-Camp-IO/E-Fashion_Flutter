import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/core/widgets/blurred_background_image.dart';
import 'package:efashion_flutter/features/auth/presentation/components/sign_up/sign_up_screen_curved_container.dart';
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
    return Form(
      key: formKey,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const BlurredBackgroundImage(
            imagePath: AssetsManager.welcomeImage,
            isLocalImage: true,
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child:
                Image.asset(AssetsManager.appLogo, width: 180.w, height: 226.h),
          ),
          const Positioned(
            left: 0,
            right: -1,
            bottom: -5,
            child: SignUpScreenCurvedContainer(),
          ),
        ],
      ),
    );
  }
}
