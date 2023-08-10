import 'package:auto_route/annotations.dart';
import 'package:efashion_flutter/features/auth/presentation/components/login_screen_body.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreenBody(),
    );
  }
}
