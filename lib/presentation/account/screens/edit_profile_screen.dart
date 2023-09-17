import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/presentation/account/components/edit_profile/edit_profile_container_component.dart';
import 'package:efashion_flutter/presentation/account/components/edit_profile/profile_picture_edit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/blurred_background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
            left: 0,
            right: 0,
            top: 90.h,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Visibility(
                key: ValueKey<bool>(FocusScope.of(context).hasPrimaryFocus || !FocusScope.of(context).hasFocus),
                visible: FocusScope.of(context).hasPrimaryFocus || !FocusScope.of(context).hasFocus,
                child: ProfilePictureEdit(
                  imageUrl: AssetsManager.userTestImage,
                  onTap: () {},
                ),
              ),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: EditProfileContainerComponent()
          ),
        ],
      ),
    );
  }
}
