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
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Image.asset(
                key: ValueKey<bool>(FocusScope.of(context).hasPrimaryFocus),
                AssetsManager.appLogo,
                width: FocusScope.of(context).hasPrimaryFocus ? 180.w : 90.w,
                height: FocusScope.of(context).hasPrimaryFocus ? 226.h : 113.h,
              ),
            ),
          ),
          DraggableScrollableSheet(
            controller: draggableScrollableController,
            initialChildSize: 0.70,
            minChildSize: 0.70,
            maxChildSize:0.70,
            builder: (context, scrollController) => LoginScreenCurvedContainer(
              scrollController: scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
