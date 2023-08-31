
import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/features/auth/presentation/components/welcome/welcome_screen_body.dart';
import 'package:efashion_flutter/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const WelcomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeScreenBody(),
    );
  }
}
