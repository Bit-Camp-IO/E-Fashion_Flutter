import 'package:auto_route/annotations.dart';
import 'package:efashion_flutter/features/auth/presentation/components/sign_up/sign_up_screen_body.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SignupScreenBody(),
    );
  }
}
