import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/core/widgets/container_button.dart';
import 'package:efashion_flutter/core/widgets/secondary_button.dart';
import 'package:efashion_flutter/features/account/presentation/components/edit_profile/profile_picture_edit.dart';
import 'package:efashion_flutter/features/account/presentation/components/shared/account_clipped_container.dart';
import 'package:efashion_flutter/core/widgets/custom_text_form_field.dart';
import 'package:efashion_flutter/core/widgets/blurred_background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BlurredBackgroundImage(
            isLocalImage: false,
            imagePath: AssetsManager.userTestImage,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 62.0,
            child: ProfilePictureEdit(
              imageUrl: AssetsManager.userTestImage,
              onTap: () {},
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -5,
            child: AccountClippedContainer(
              height: FocusScope.of(context).hasPrimaryFocus || !FocusScope.of(context).hasFocus ? 580.h : 670.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    ClippedContainerButton(
                      onTap: () {
                        context.popRoute();
                      },
                      icon: Iconsax.arrow_left,
                    ),
                    SizedBox(
                      height: 64.h,
                    ),
                    Center(
                      child: Text(
                        "Edit Profile",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    CustomTextFormField(
                      controller: TextEditingController(text: 'Tara Slander'),
                      type: TextInputType.text,
                      prefixIcon: Iconsax.user,
                      label: "Name",
                      borderRadius: (12.0).r,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      controller: TextEditingController(text: '+201153289438'),
                      type: TextInputType.number,
                      prefixIcon: Iconsax.call,
                      label: "Phone Number",
                      borderRadius: (12.0).r,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      controller: TextEditingController(
                          text: 'abdullahahmed107@gmail.com'),
                      type: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      label: "Email",
                      borderRadius: (12.0).r,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Center(
                      child: SecondaryButton(
                        buttonTitle: 'Done',
                        width: 100.w,
                        height: 42.h,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
