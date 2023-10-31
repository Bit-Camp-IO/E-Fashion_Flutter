import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_snack_bar.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:efashion_flutter/presentation/auth/components/sign_up/privacy_and_policy.dart';
import 'package:efashion_flutter/presentation/auth/cubits/signup/signup_cubit.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/auth/components/shared/auth_clipped_container.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_text_form_field.dart';
import 'package:efashion_flutter/shared/util/validation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:efashion_flutter/presentation/auth/components/shared/blurred_auth_body.dart';

@RoutePage()
class SignupScreen extends StatefulWidget implements AutoRouteWrapper {
  const SignupScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: this,
    );
  }

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _passwordController;
  late TextEditingController _phoneNumberController;
  late String _fullName;
  late String _email;
  late String _password;
  late String _confirmPassword;
  bool _isLoading = false;
  bool isChecked = false;
  ValueNotifier<bool> checkBoxError = ValueNotifier<bool>(false);

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _passwordController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupLoadingState) {
            _isLoading = true;
          } else if (state is SignupSuccessState) {
            context.replaceRoute(const BottomNavBarRoute());
            _isLoading = false;
          } else if (state is SignupFailState) {
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.show(
                customSnackBarType: CustomSnackBarType.error,
                message: state.failMessage,
                context: context,
              ),
            );
            _isLoading = false;
          } else {
            _isLoading = false;
          }
        },
        child: BlurredAuthBody(
          logoPosition: 50.h,
          child: Form(
            key: _formKey,
            child: AuthClippedContainer(
              height: 565.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      StringsManager.signupTitle,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomTextFormField(
                      label: StringsManager.name,
                      prefixIcon: Iconsax.user,
                      keyboardType: TextInputType.name,
                      hintText: StringsManager.name,
                      onSaved: (value) {
                        if (value != null) {
                          _fullName = value;
                        }
                      },
                    ),
                    CustomTextFormField(
                      label: StringsManager.email,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      hintText: StringsManager.email,
                      onSaved: (value) {
                        if (value != null) {
                          _email = value;
                        }
                      },
                      validator: ValidationManager.emailValidator(),
                    ),
                    CustomTextFormField(
                        controller: _phoneNumberController,
                        label: StringsManager.phoneNumber,
                        prefixIcon: Iconsax.call,
                        keyboardType: TextInputType.phone,
                        hintText: StringsManager.phoneNumber,
                        onSaved: (value) {
                          if (value != null) {
                            _confirmPassword = value;
                          }
                        },
                        validator: ValidationManager.phoneNumberValidator(phoneController: _phoneNumberController)
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      label: StringsManager.password,
                      obscureText: true,
                      prefixIcon: Iconsax.lock,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: StringsManager.password,
                      onSaved: (value) {
                        if (value != null) {
                          _password = value;
                        }
                      },
                      validator: ValidationManager.passwordValidator(
                        passwordController: _passwordController,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: checkBoxError,
                      builder: (context, value, child) => PrivacyAndPolicy(
                        isChecked: (isChecked) {
                          this.isChecked = isChecked;
                        },
                        isError: value,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    BlocBuilder<SignupCubit, SignupState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          width: 312.w,
                          height: 46.h,
                          onTap: () {
                            if (_formKey.currentState!.validate() &&
                                isChecked) {
                              _formKey.currentState!.save();
                              checkBoxError.value = false;
                              context.read<SignupCubit>().signUp(
                                    fullName: _fullName,
                                    email: _email,
                                    password: _password,
                                    phoneNumber: _confirmPassword,
                                  );
                            } else {
                              debugPrint(isChecked.toString());
                              _formKey.currentState!.validate();
                              checkBoxError.value = true;
                            }
                          },
                          buttonTitle: StringsManager.signupTitle,
                          isLoading: _isLoading,
                        );
                      },
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringsManager.accountExist,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        TextButton(
                          child: Text(
                            StringsManager.loginTitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
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
    _phoneNumberController.dispose();
    checkBoxError.dispose();
    super.dispose();
  }
}
