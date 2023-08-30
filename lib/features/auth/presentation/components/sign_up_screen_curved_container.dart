import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:efashion_flutter/features/auth/presentation/components/auth_container_clipper.dart';
import 'package:efashion_flutter/features/auth/presentation/components/custom_button.dart';
import 'package:efashion_flutter/features/auth/presentation/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SignUpScreenCurvedContainer extends StatefulWidget {
  const SignUpScreenCurvedContainer({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<SignUpScreenCurvedContainer> createState() =>
      _SignUpScreenCurvedContainerState();
}

class _SignUpScreenCurvedContainerState
    extends State<SignUpScreenCurvedContainer> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isChecked = false;

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
                  "Sign up",
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
                    CustomTextFormField(
                      controller: userNameController,
                      label: "user name",
                      obscureText: false,
                      prefixIcon: Iconsax.user,
                      type: TextInputType.name,
                      hintText: "Username",
                    ),
                    SizedBox(
                      height: 20.h,
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
                      suffixIcon: Icons.visibility_outlined,
                      hintText: "Password",
                    ),
                    SizedBox(
                      height: 14.h,
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
                      height: 28.h,
                    ),
                    CustomButton(text: "Sign up", onPressed: () {}),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        TextButton(
                          child: Text(
                            "Log in",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorsManager.lightPrimaryColor,
                            ),
                          ),
                          onPressed: () {
                            context.popRoute();
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
