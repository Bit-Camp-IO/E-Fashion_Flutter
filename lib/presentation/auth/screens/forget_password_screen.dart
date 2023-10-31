import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/auth/cubits/forget_password/forget_password_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_snack_bar.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/auth/components/shared/auth_clipped_container.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:efashion_flutter/presentation/auth/components/shared/blurred_auth_body.dart';

@RoutePage()
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool _isLoading = false;
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
      body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoadingState) {
            _isLoading = true;
          } else if (state is ForgetPasswordSuccessState) {
            _isLoading = false;
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.show(
                customSnackBarType: CustomSnackBarType.success,
                message: state.message,
                context: context,
              ),
            );
            context.pushRoute(const OtpVerificationRoute());
          } else if (state is ForgetPasswordFailState) {
            _isLoading = false;
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.show(
                customSnackBarType: CustomSnackBarType.error,
                message: state.message,
                context: context,
              ),
            );
          } else {
            _isLoading = false;
          }
        },
        child: BlurredAuthBody(
          child: Form(
            key: _formKey,
            child: AuthClippedContainer(
              height: 440.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Text(
                      StringsManager.forgetPasswordTitle,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      textAlign: TextAlign.center,
                      StringsManager.forgetPasswordSubtitle,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomTextFormField(
                      label: StringsManager.email,
                      obscureText: false,
                      prefixIcon: Icons.mail_outline,
                      keyboardType: TextInputType.text,
                      hintText: StringsManager.email,
                      onSaved: (value) {
                        if (value != null) {
                          email = value;
                        }
                      },
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context
                                  .read<ForgetPasswordCubit>()
                                  .forgetPassword(email: email);
                            }
                          },
                          buttonTitle:
                              StringsManager.recoverPasswordButtonTitle,
                          isLoading: _isLoading,
                        );
                      },
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
      ),
    );
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
