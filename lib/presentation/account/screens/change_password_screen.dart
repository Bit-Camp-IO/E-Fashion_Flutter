import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/account/bloc/change_password_cubit/change_password_cubit.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/presentation/shared/widgets/blurred_background_image.dart';
import 'package:efashion_flutter/presentation/account/components/change_password/change_password_container_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ChangePasswordScreen extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChangePasswordCubit>(),
      child: this,
    );
  }

  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlurredBackgroundImage(
            isLocalImage: false,
            imagePath: AssetsManager.userTestImage,
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 90.h,
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Visibility(
                    key: ValueKey<bool>(
                        FocusScope.of(context).hasPrimaryFocus ||
                            !FocusScope.of(context).hasFocus),
                    visible: FocusScope.of(context).hasPrimaryFocus ||
                        !FocusScope.of(context).hasFocus,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: AssetsManager.userTestImage,
                        width: 120.w,
                        height: 120.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -5.h,
            child: const ChangePasswordContainerComponent(),
          ),
        ],
      ),
    );
  }
}
