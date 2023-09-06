import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/core/util/size_manager.dart';
import 'package:efashion_flutter/shared/presentation/widgets/primary_button.dart';
import 'package:efashion_flutter/features/auth/presentation/components/shared/auth_clipped_container.dart';
import 'package:efashion_flutter/shared/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:efashion_flutter/features/auth/presentation/components/shared/blurred_auth_body.dart';


@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;
  late GlobalKey<FormState> _formKey;
  late String username;
  late String password;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurredAuthBody(
        child: Form(
          key: _formKey,
          child: AuthClippedContainer(
            height: SizeManager.screenHeight * 0.58,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Log in",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFormField(
                    label: "user name",
                    obscureText: false,
                    prefixIcon: Iconsax.user,
                    type: TextInputType.text,
                    hintText: "Username",
                    onSaved: (value) {
                      if (value != null) {
                        username = value;
                      }
                    },
                  ),
                  CustomTextFormField(
                    label: "Password",
                    obscureText: true,
                    type: TextInputType.visiblePassword,
                    prefixIcon: Iconsax.lock,
                    hintText: "Password",
                    onSaved: (value) {
                      if (value != null) {
                        password = value;
                      }
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (newBool) {
                          setState(() {
                            _isChecked = newBool!;
                          });
                        },
                      ),
                      Text(
                        "Remember me",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          context.pushRoute(const ForgetPasswordRoute());
                        },
                        child: Text(
                          "Forget Password",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  PrimaryButton(
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                      }
                      context.replaceRoute(const BottomNavBarRoute());
                    },
                    buttonTitle: 'Log in',
                  ),
                  SizedBox(
                    height: 10.h,
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
                            color: Theme.of(context).colorScheme.primary,
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
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
