import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/core/util/strings_manager.dart';
import 'package:efashion_flutter/presentation/auth/cubits/login/login_cubit.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/shared/widgets/dots_loading_indicator.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/auth/components/shared/auth_clipped_container.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:efashion_flutter/presentation/auth/components/shared/blurred_auth_body.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;
  bool _isLoading = false;
  late GlobalKey<FormState> _formKey;
  late String email;
  late String password;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            _isLoading = true;
          } else if (state is LoginSuccessState) {
            context.replaceRoute(const BottomNavBarRoute());
            _isLoading = false;
          } else {
            _isLoading = false;
          }
        },
        child: BlurredAuthBody(
          child: Form(
            key: _formKey,
            child: AuthClippedContainer(
              height: 450.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height: 40.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        StringsManager.loginTitle,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    CustomTextFormField(
                      label: StringsManager.email,
                      obscureText: false,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      hintText: StringsManager.email,
                      onSaved: (value) {
                        if (value != null) {
                          email = value;
                        }
                      },
                    ),
                    CustomTextFormField(
                      label: StringsManager.password,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Iconsax.lock,
                      hintText: StringsManager.password,
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
                          StringsManager.rememberMe,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            context.pushRoute(const ForgetPasswordRoute());
                          },
                          child: Text(
                            StringsManager.forgetPasswordTitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context.read<LoginCubit>().userLogin(
                                    email: email,
                                    password: password,
                                  );
                            }
                          },
                          buttonTitle: StringsManager.loginTitle,
                          child:
                              _isLoading ? const DotsLoadingIndicator() : null,
                        );
                      },
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringsManager.noAccount,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        TextButton(
                          child: Text(
                            StringsManager.signupTitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
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
