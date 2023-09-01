import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/core/util/size_manager.dart';
import 'package:efashion_flutter/core/widgets/primary_button.dart';
import 'package:efashion_flutter/features/auth/presentation/components/shared/auth_clipped_container.dart';
import 'package:efashion_flutter/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:efashion_flutter/features/auth/presentation/components/shared/blurred_auth_body.dart';


@RoutePage()
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late GlobalKey<FormState> _formKey;
  late String email;

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
            height: SizeManager.screenHeight * 0.55,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Forget Password",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    textAlign: TextAlign.center,
                    "Enter the email address associated\n with your account",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFormField(
                    label: "Email",
                    obscureText: false,
                    prefixIcon: Icons.mail_outline,
                    type: TextInputType.text,
                    hintText: "Email",
                    onSaved: (value) {
                      if (value != null) {
                        email = value;
                      }
                    },
                  ),
                  SizedBox(
                    height: 75.h,
                  ),
                  PrimaryButton(
                    onTap: () {
                      context.pushRoute(const EmailVerificationRoute());
                    },
                    buttonTitle: 'Recover password',
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
