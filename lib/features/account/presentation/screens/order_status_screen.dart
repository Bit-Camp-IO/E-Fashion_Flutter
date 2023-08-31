import 'package:auto_route/annotations.dart';
import 'package:efashion_flutter/features/account/presentation/components/order_status/custom_easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});
  final int activeStep = 1;
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
          const Spacer(flex: 1),
           CustomEasyStepper(
            activeStep: activeStep,
          ),
          const Spacer(flex: 4),
          Center(
            child: Image(
              image: AssetImage(_buildStepImagePath(activeStep)),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            textAlign: TextAlign.center,
            _buildStepText(activeStep),
            style: Theme.of(context).textTheme.bodySmall,
          ),
         
          const Spacer(flex: 8),
        ],
      ),
    );
  }

  String _buildStepImagePath(int activeStep){
    if(activeStep == 0){
      return 'assets/images/stepper_image1.png';
    }else if(activeStep == 1){
      return 'assets/images/stepper_image2.png';
    }else{
      return 'assets/images/stepper_image3.png';
    }

  }
  String _buildStepText(int activeStep){
    if(activeStep == 0){
      return 'Your order still on progress\n it may take hours.';
    }else if(activeStep == 1){
      return 'The delivery man on his\n way to your location.';
    }else{
      return 'Your order has been\n delivered, hope you liked it.';
    }
  }
}
