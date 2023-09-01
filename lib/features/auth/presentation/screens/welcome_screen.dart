import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/features/auth/presentation/components/welcome/welcome_container_component.dart';
import 'package:efashion_flutter/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/core/util/assets_manager.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const WelcomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
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
            const Positioned(
              left: 0,
              right: 0,
              bottom: -5,
              child: WelcomeContainerComponent()
            ),
          ],
        ),
      ),
    );
  }
}
