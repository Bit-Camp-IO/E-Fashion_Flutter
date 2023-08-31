import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/widgets/secondary_button.dart';
import 'package:efashion_flutter/features/account/presentation/components/edit_profile/profile_picture_edit.dart';
import 'package:efashion_flutter/features/account/presentation/components/shared/account_skew_clipper.dart';
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
            imageUrl:
                "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 62.0,
            child: ProfilePictureEdit(
              imageUrl:
                  "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
              onTap: () {},
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: FocusScope.of(context).hasPrimaryFocus || !FocusScope.of(context).hasFocus  ? 0.70 : 0.84,
            minChildSize: FocusScope.of(context).hasPrimaryFocus || !FocusScope.of(context).hasFocus  ? 0.70 : 0.84,
            maxChildSize: FocusScope.of(context).hasPrimaryFocus || !FocusScope.of(context).hasFocus  ? 0.70 : 0.84,
            builder: (context, scrollController) => ClipPath(
              clipper: AccountSkewClipper(),
              child: Container(
                color: Theme.of(context).colorScheme.onInverseSurface,
                height: MediaQuery.sizeOf(context).height * 0.75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
                  child: ListView(
                    controller: scrollController,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            context.popRoute();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 10.0).r,
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
                        controller:
                            TextEditingController(text: 'Tara Slander'),
                        type: TextInputType.text,
                        prefixIcon: Iconsax.user,
                        label: "Name",
                        borderRadius: (12.0).r,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller:
                            TextEditingController(text: '+201153289438'),
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
          ),
        ],
      ),
    );
  }
}
