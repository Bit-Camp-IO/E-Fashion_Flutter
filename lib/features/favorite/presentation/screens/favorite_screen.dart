import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Favorite Screen',
        ),
      ),
    );
  }
}