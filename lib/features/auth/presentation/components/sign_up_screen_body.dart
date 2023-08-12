import 'dart:ui';

import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:efashion_flutter/features/auth/presentation/components/custom_button.dart';
import 'package:efashion_flutter/features/auth/presentation/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreenBody extends StatefulWidget {
  const SignupScreenBody({super.key});

  @override
  State<SignupScreenBody> createState() => _SignupScreenBodyState();
}

class _SignupScreenBodyState extends State<SignupScreenBody> {
  final GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaY: 15,
                sigmaX: 15,
              ),
              child: Container(
                color: Colors.transparent,
                child: Image(
                  image: const AssetImage(
                    AssetsManager.welcomeImage,
                  ),
                  width: double.infinity,
                  height: 500.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 62.h,
                ),
                Image.asset(
                  AssetsManager.appLogo,
                  width: 180.w,
                  height: 226.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(40.0).r,
                      topLeft: const Radius.circular(40.0).r,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35.h,
                      ),
                      Text(
                        "Sign up",
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: ColorsManager.lightPrimaryColor,
                            ),
                      ),
                      SizedBox(
                        height: 57.h,
                      ),
                      CustomTextFormField(
                        controller: userNameController,
                        label: "user name",
                        obscureText: false,
                        prefixIcon: Iconsax.user,
                        type: TextInputType.name,
                        hintText: "Username",
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        label: "Email",
                        obscureText: false,
                        prefixIcon: Icons.email_outlined,
                        type: TextInputType.emailAddress,
                        hintText: "Email",
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: passwordController,
                        label: "Password",
                        obscureText: true,
                        prefixIcon: Iconsax.lock,
                        type: TextInputType.visiblePassword,
                        hintText: "Password",
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          Text.rich(
                            TextSpan(
                              text: "I Agree with",
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: [
                                TextSpan(
                                  text: " Privacy",
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: ColorsManager.lightPrimaryColor,
                                      ),
                                ),
                                TextSpan(
                                  text: " and",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                TextSpan(
                                  text: " policy",
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: ColorsManager.lightPrimaryColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      CustomButton(text: "Sign up", onPressed: () {}),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account ?",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          TextButton(
                            child: Text(
                              "Log in",
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorsManager.lightPrimaryColor,
                                  ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
