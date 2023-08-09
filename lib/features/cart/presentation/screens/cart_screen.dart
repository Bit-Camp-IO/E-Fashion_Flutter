import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Cart Screen',
        ),
      ),
    );
  }
}