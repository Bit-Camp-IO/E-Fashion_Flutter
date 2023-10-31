import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/account/bloc/profile_cubit/profile_cubit.dart';
import 'package:efashion_flutter/presentation/account/components/edit_profile/empty_profile_picture_edit.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/presentation/account/components/edit_profile/edit_profile_container_component.dart';
import 'package:efashion_flutter/presentation/account/components/edit_profile/profile_picture_edit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/blurred_background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) =>
                previous.userData != current.userData,
            builder: (context, state) {
              return BlurredBackgroundImage(
                isLocalImage: state.userData.profileImagePath != null ? false : true,
                imagePath: state.userData.profileImagePath != null ? ApiConstants.getUserProfilePicture(
                        path: state.userData.profileImagePath!,
                      )
                    : AssetsManager.welcomeImage,
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 90.h,
            child: BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (previous, current) =>
              previous.userData != current.userData,
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Visibility(
                    key: ValueKey<bool>(FocusScope.of(context).hasPrimaryFocus || !FocusScope.of(context).hasFocus),
                    visible: FocusScope.of(context).hasPrimaryFocus || !FocusScope.of(context).hasFocus,
                    child: state.userData.profileImagePath == null
                        ? EmptyProfilePictureEdit(
                            name: state.userData.fullName,
                            onTap: () {
                              context.read<ProfileCubit>().updateProfilePicture();
                            },
                      onRefreshPress: () {
                        context.read<ProfileCubit>().getUserData();
                      },
                          )
                        : ProfilePictureEdit(
                            imageUrl: ApiConstants.getUserProfilePicture(path: state.userData.profileImagePath!),
                            onTap: () {
                              context.read<ProfileCubit>().updateProfilePicture();
                            },
                          ),
                  ),
                );
              },
            ),
          ),
          const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: EditProfileContainerComponent()),
        ],
      ),
    );
  }
}
