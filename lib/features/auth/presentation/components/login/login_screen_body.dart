import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/core/widgets/blurred_background_image.dart';
import 'package:efashion_flutter/features/auth/presentation/components/login/login_screen_curved_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  late GlobalKey formKey;
  late DraggableScrollableController draggableScrollableController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    draggableScrollableController = DraggableScrollableController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const BlurredBackgroundImage(imagePath:  AssetsManager.welcomeImage, isLocalImage: true),
          Positioned(
            top: 40,
            left: 100,
            right: 0,
            child: Stack(
              children: [
                Image.asset(
                  AssetsManager.appLogo,
                  width: 180.w,
                  height: 226.h,
                ),
              ],
            ),
          ),
          const Positioned(
            left: 0,
            right: -1,
            bottom: -5,
            child: LoginScreenCurvedContainer(),
          ),
        ],
      ),
    );
  }
}
