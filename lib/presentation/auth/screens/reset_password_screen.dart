import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/auth/cubits/forget_password/forget_password_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_snack_bar.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/auth/components/shared/auth_clipped_container.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_text_form_field.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:efashion_flutter/shared/util/validation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:efashion_flutter/presentation/auth/components/shared/blurred_auth_body.dart';

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
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool _isLoading = false;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoadingState) {
          _isLoading = true;
        } else if (state is ResetPasswordSuccessState) {
          _isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar.show(
              customSnackBarType: CustomSnackBarType.success,
              message: state.message,
              context: context,
            ),
          );
          context.replaceRoute(const LoginRoute());
        } else if (state is ResetPasswordFailState) {
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
      child: Scaffold(
        body: BlurredAuthBody(
          child: Form(
            key: _formKey,
            child: AuthClippedContainer(
              height: 480.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                      StringsManager.resetPasswordTitle,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      textAlign: TextAlign.center,
                      StringsManager.resetPasswordSubtitle,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomTextFormField(
                      label: StringsManager.password,
                      controller: _passwordController,
                      obscureText: true,
                      prefixIcon: Iconsax.lock,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: StringsManager.password,
                      onSaved: (value) {
                        if (value != null) {
                          password = value;
                        }
                      },
                      validator: ValidationManager.changePasswordValidator(
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                      ),
                    ),
                    CustomTextFormField(
                      label: StringsManager.confirmPassword,
                      controller: _confirmPasswordController,
                      obscureText: true,
                      prefixIcon: Iconsax.lock,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: StringsManager.confirmPassword,
                      onSaved: (value) {
                        if (value != null) {
                          confirmPassword = value;
                        }
                      },
                      validator: ValidationManager.changePasswordValidator(
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context.read<ForgetPasswordCubit>().resetPassword(newPassword: confirmPassword);
                            }
                          },
                          buttonTitle: StringsManager.continueButtonTitle,
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
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
