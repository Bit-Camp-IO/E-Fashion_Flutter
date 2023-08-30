import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:efashion_flutter/features/auth/presentation/components/auth_container_clipper.dart';
import 'package:efashion_flutter/features/auth/presentation/components/custom_button.dart';
import 'package:efashion_flutter/features/auth/presentation/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreenCurvedContainer extends StatefulWidget {
  const LoginScreenCurvedContainer({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<LoginScreenCurvedContainer> createState() => _LoginScreenCurvedContainerState();
}

class _LoginScreenCurvedContainerState extends State<LoginScreenCurvedContainer> {
  bool isChecked = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AuthContainerClipper(),
      child: Container(
        color: Theme.of(context).colorScheme.onInverseSurface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Log in",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorsManager.lightPrimaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: ListView(
                  controller: widget.scrollController,
                  children: [
                    SizedBox(
                      height: 37.h,
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
                      type: TextInputType.visiblePassword,
                      hintText: "Password",
                      suffixIcon: Icons.visibility_outlined,
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
                    CustomButton(text: "Log in", onPressed: () {
                      context.replaceRoute(const BottomNavBarRoute());
                    }),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        TextButton(
                          child: Text(
                            "Sign up",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: ColorsManager.lightPrimaryColor,
                                ),
                          ),
                          onPressed: () {
                            context.pushRoute(const SignupRoute());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
