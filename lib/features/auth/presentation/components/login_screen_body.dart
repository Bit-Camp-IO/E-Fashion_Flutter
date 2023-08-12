import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:efashion_flutter/features/auth/presentation/components/custom_button.dart';
import 'package:efashion_flutter/features/auth/presentation/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  bool isChecked = false;
  final GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        child: Stack(
          children: [
            Image.asset(
              AssetsManager.welcomeImage,
              width: MediaQuery.sizeOf(context).width,
              height: 500.h,
              fit: BoxFit.cover,
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
                        "Log in",
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
                        type: TextInputType.text,
                        hintText: "Username",
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: passwordController,
                        label: "Password",
                        obscureText: true,
                        prefixIcon: Iconsax.lock,
                        type: TextInputType.number,
                        hintText: "Password",
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          Text(
                            "Remember me",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget Password",
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorsManager.lightPrimaryColor,
                                  ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      CustomButton(text: "Log in", onPressed: () {}),
                      SizedBox(
                        height: 80.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ?",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          TextButton(
                            child: Text(
                              "Sign up",
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
