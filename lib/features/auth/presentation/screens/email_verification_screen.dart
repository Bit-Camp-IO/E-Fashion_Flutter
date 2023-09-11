import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/core/util/strings_manager.dart';
import 'package:efashion_flutter/shared/presentation/widgets/primary_button.dart';
import 'package:efashion_flutter/features/auth/presentation/components/shared/auth_clipped_container.dart';
import 'package:efashion_flutter/features/auth/presentation/components/shared/blurred_auth_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  late String verifyCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurredAuthBody(
        child: AuthClippedContainer(
          height: 400.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  StringsManager.emailVerifyTitle,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  textAlign: TextAlign.center,
                  StringsManager.emailVerifySubTitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Pinput(
                  length: 6,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  onChanged: (value) {
                  },
                  onCompleted: (value) {
                    verifyCode = value;
                  },
                  defaultPinTheme: PinTheme(
                    width: 40.w,
                    height: 40.w,
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ).r,
                    ),
                  ),
                ),
                SizedBox(
                  height: 75.h,
                ),
                PrimaryButton(
                  onTap: () {
                    context.pushRoute(const ResetPasswordRoute());
                  },
                  buttonTitle: StringsManager.emailVerifyButtonTitle,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
