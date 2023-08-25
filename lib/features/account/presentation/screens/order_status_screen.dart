import 'package:auto_route/annotations.dart';
import 'package:efashion_flutter/features/account/presentation/components/custom_easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          const CustomEasyStepper(),
          SizedBox(
            height: 97.h,
          ),
          Image(
            height: 194.h,
            width: 134.w,
            image: const AssetImage("assets/images/welcome_image.jpeg"),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            "Your order still on progress",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            "it may take hours",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
