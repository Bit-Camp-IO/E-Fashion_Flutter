import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/presentation/account/bloc/profile_cubit/profile_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/no_profile_picture.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/presentation/account/components/account/account_container_component.dart';
import 'package:efashion_flutter/presentation/shared/bloc/tokens_cubit/tokens_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/blurred_background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<TokensCubit, TokensState>(
        listener: (context, state) {
          if (state is TokensUnAuthenticatedState) {
            context.replaceRoute(const AuthRoute());
          }
        },
        child: Stack(
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (previous, current) =>
                  previous.userData != current.userData,
              builder: (context, state) {
                return BlurredBackgroundImage(
                  isLocalImage:
                      state.userData.profileImagePath != null ? false : true,
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
              child: BlocBuilder<ProfileCubit, ProfileState>(
                buildWhen: (previous, current) =>
                    previous.userData != current.userData,
                builder: (context, state) {
                  return Column(
                    children: [
                      state.userData.profileImagePath == null
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
                                    stalePeriod:
                                    const Duration(days: AppConstants.cacheDuration),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        state.userData.fullName,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const AccountContainerComponent(),
          ],
        ),
      ),
    );
  }
}
