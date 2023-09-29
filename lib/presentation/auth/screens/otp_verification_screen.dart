import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/auth/components/forget_password/otp_timer.dart';
import 'package:efashion_flutter/presentation/auth/cubits/forget_password/forget_password_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/snack_bar.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:efashion_flutter/presentation/auth/components/shared/auth_clipped_container.dart';
import 'package:efashion_flutter/presentation/auth/components/shared/blurred_auth_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late String otpCode;
  bool _otpError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is VerifyOtpFailState) {
            _otpError = true;
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                customSnackBarType: CustomSnackBarType.error,
                message: state.message,
                context: context,
              ),
            );
          } else if (state is VerifyOtpSuccessState) {
            context.pushRoute(const ResetPasswordRoute());
          } else {
            _otpError = false;
          }
        },
        child: BlurredAuthBody(
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
                    StringsManager.otpVerifyTitle,
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
                  BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                    builder: (context, state) {
                      return Pinput(
                        length: 6,
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        forceErrorState: _otpError,
                        onCompleted: (value) async {
                          otpCode = value;
                          await context
                              .read<ForgetPasswordCubit>()
                              .verifyOtp(otpCode: otpCode);
                        },
                        defaultPinTheme: PinTheme(
                          width: 40.w,
                          height: 40.w,
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
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
                        errorPinTheme: PinTheme(
                          width: 40.w,
                          height: 40.w,
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .errorContainer),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ).r,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  OtpTimer(
                    onResendPress: () {
                      final forgetPasswordCubit = context.read<ForgetPasswordCubit>();
                     forgetPasswordCubit.forgetPassword(email: forgetPasswordCubit.email);
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
