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
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late GlobalKey<FormState> _formKey;
  late String password;
  late String confirmPassword;

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
            height: SizeManager.screenHeight * 0.60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    "Reset Password",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    textAlign: TextAlign.center,
                    "Your new password must be different\n from previous used password.",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFormField(
                    label: "Password",
                    obscureText: true,
                    prefixIcon: Iconsax.lock,
                    type: TextInputType.visiblePassword,
                    hintText: "Password",
                    onSaved: (value) {
                      if (value != null) {
                        password = value;
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    label: "Confirm Password",
                    obscureText: true,
                    prefixIcon: Iconsax.lock,
                    type: TextInputType.visiblePassword,
                    hintText: "Password",
                    onSaved: (value) {
                      if (value != null) {
                        password = value;
                      }
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  PrimaryButton(
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                      }
                      context.replaceRoute(const BottomNavBarRoute());
                    },
                    buttonTitle: 'Continue',
                  ),
                  SizedBox(
                    height: 20.h,
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
