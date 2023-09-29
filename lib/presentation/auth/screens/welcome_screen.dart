import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/shared/util/size_manager.dart';
import 'package:efashion_flutter/presentation/auth/components/welcome/welcome_container_component.dart';
import 'package:efashion_flutter/presentation/shared/bloc/tokens_cubit/tokens_cubit.dart';
import 'package:flutter/material.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TokensCubit, TokensState>(
        listener: (context, state) {
          if (state is TokensAuthenticatedState) {
            context.replaceRoute(const BottomNavBarRoute());
          }
        },
        child: GestureDetector(
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity! < 0) {
              context.pushRoute(const LoginRoute());
            }
          },
          child: Stack(
            children: [
              Image.asset(
                width: SizeManager.screenWidth,
                height: SizeManager.screenHeight,
                AssetsManager.welcomeImage,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 150.h,
                child: CustomFadeAnimation(
                  child: Image.asset(
                    AssetsManager.appLogo,
                    width: 238.w,
                    height: 300.h,
                  ),
                ),
              ),
              const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: WelcomeContainerComponent()),
            ],
          ),
        ),
      ),
    );
  }
}
