import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/core/util/size_manager.dart';
import 'package:efashion_flutter/core/widgets/primary_button.dart';
import 'package:efashion_flutter/features/auth/presentation/components/shared/auth_clipped_container.dart';
import 'package:efashion_flutter/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:efashion_flutter/features/auth/presentation/components/shared/blurred_auth_body.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isChecked = false;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlurredAuthBody(
        child: Form(
          key: _formKey,
          child: AuthClippedContainer(
            height: SizeManager.screenHeight * 0.65,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        "Sign up",
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomTextFormField(
                        label: "user name",
                        obscureText: false,
                        prefixIcon: Iconsax.user,
                        type: TextInputType.name,
                        hintText: "Username",
                        onSaved: (value) {},
                      ),
                      CustomTextFormField(
                        label: "Email",
                        obscureText: false,
                        prefixIcon: Icons.email_outlined,
                        type: TextInputType.emailAddress,
                        hintText: "Email",
                        onSaved: (value) {},
                      ),
                      CustomTextFormField(
                        label: "Password",
                        obscureText: true,
                        prefixIcon: Iconsax.lock,
                        type: TextInputType.visiblePassword,
                        hintText: "Password",
                        onSaved: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (newBool) {
                              setState(() {
                                _isChecked = newBool!;
                              });
                            },
                          ),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: "I Agree with",
                                style: Theme.of(context).textTheme.bodyMedium,
                                children: [
                                  TextSpan(
                                    text: " Privacy",
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " and",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  TextSpan(
                                    text: " policy",
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      PrimaryButton(
                        width: 312.w,
                        height: 46.h,
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                          }
                          context.replaceRoute(const BottomNavBarRoute());
                        },
                        buttonTitle: 'Sign up',
                      ),
                      SizedBox(height: 10.h),
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
                                color: Theme.of(context).colorScheme.primary,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
