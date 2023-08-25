import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/features/account/presentation/components/account_skew_clipper.dart';
import 'package:efashion_flutter/features/account/presentation/components/clipped_button.dart';
import 'package:efashion_flutter/features/auth/presentation/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: CachedNetworkImage(
              height: double.infinity,
              imageUrl:
                  "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 32.0,
            child: Column(
              children: [
                SizedBox(
                  height: 32.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(60.0).r,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                    width: 120.w,
                    height: 120.h,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 140.0,
            top: 75.0,
            child: CircleAvatar(
              radius: 14.0,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Iconsax.edit_2,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: -5,
            child: ClipPath(
              clipper: AccountSkewClipper(),
              child: Container(
                color: Theme.of(context).colorScheme.onInverseSurface,
                height: MediaQuery.sizeOf(context).height * 0.75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
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
                        type: TextInputType.text,
                        prefixIcon: Iconsax.user,
                        label: "Tara Slander",
                        borderRadius: (12.0).r,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        type: TextInputType.number,
                        prefixIcon: Iconsax.call,
                        label: "+201153289438",
                        borderRadius: (12.0).r,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        type: TextInputType.emailAddress,
                        prefixIcon: Icons.email_outlined,
                        label: "abdullahahmed107@gmail.com",
                        borderRadius: (12.0).r,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Center(
                        child: ClippedButton(
                          onTap: () {},
                          text: "Done",
                          backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
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
