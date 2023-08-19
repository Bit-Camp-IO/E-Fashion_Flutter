import 'package:auto_route/annotations.dart';
import 'package:efashion_flutter/features/account/presentation/components/custom_easy_stepper.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Status",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: const CustomEasyStepper(),
    );
  }
}
