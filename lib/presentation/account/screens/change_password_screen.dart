import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/account/bloc/change_password_cubit/change_password_cubit.dart';
import 'package:efashion_flutter/presentation/account/bloc/profile_cubit/profile_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/no_profile_picture.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/presentation/shared/widgets/blurred_background_image.dart';
import 'package:efashion_flutter/presentation/account/components/change_password/change_password_container_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
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
          BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) => previous.userData != current.userData,
            builder: (context, state) {
              return BlurredBackgroundImage(
                isLocalImage: state.userData.profileImagePath != null ? false : true,
                imagePath: state.userData.profileImagePath != null
                    ? ApiConstants.getUserProfilePicture(
                        path: state.userData.profileImagePath!,
                      )
                    : AssetsManager.welcomeImage,
              );
            },
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
                    key: ValueKey<bool>(FocusScope.of(context).hasPrimaryFocus || !FocusScope.of(context).hasFocus),
                    visible: FocusScope.of(context).hasPrimaryFocus || !FocusScope.of(context).hasFocus,
                    child: BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return state.userData.profileImagePath == null
                            ? EmptyProfilePicture(
                                name: state.userData.fullName,
                                width: 120.w,
                                height: 120.h,
                                isLarge: true,
                              )
                            : ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: ApiConstants.getUserProfilePicture(
                                    path: state.userData.profileImagePath!,
                                  ),
                                  width: 120.w,
                                  height: 120.h,
                                  cacheManager: CacheManager(
                                    Config(
                                      AppConstants.cacheFolder,
                                      stalePeriod: const Duration(
                                        days: AppConstants.cacheDuration,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      },
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
