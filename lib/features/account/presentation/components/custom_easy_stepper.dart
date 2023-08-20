import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEasyStepper extends StatefulWidget {
  const CustomEasyStepper({super.key});

  @override
  State<CustomEasyStepper> createState() => _CustomEasyStepperState();
}

class _CustomEasyStepperState extends State<CustomEasyStepper> {
  int activeIndex = 1;
  final List<String> orderStatusImages = const [
    "assets/images/stepper_image1.jpg",
    "assets/images/stepper_image2.jpg",
    "assets/images/stepper_image3.jpg",
  ];
  final List<String> orderStatusMessages = const [
    "Your order still on progress \n it may take hours",
    "The delivery man on his \n way to your location",
    "Your order has been \n delivered, hope you liked it",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        EasyStepper(
          activeStep: activeIndex,
          lineLength: 100,
          lineSpace: 0,
          lineType: LineType.normal,
          defaultLineColor: Theme.of(context).colorScheme.outlineVariant,
          //finishedLineColor: Theme.of(context).colorScheme.primary,
          activeStepTextColor: Colors.black87,
          finishedStepTextColor: Theme.of(context).colorScheme.outlineVariant,
          internalPadding: 0,
          showLoadingAnimation: false,
          stepRadius: 20,
          showStepBorder: false,
          lineThickness: 1,
          activeStepBorderColor: Theme.of(context).colorScheme.primary,
          activeStepIconColor: Theme.of(context).colorScheme.primary,
          finishedStepBorderColor: Colors.grey[300],
          finishedStepBorderType: BorderType.normal,
          //activeLineColor: Theme.of(context).colorScheme.primary,
          finishedStepBackgroundColor: Colors.transparent,
          steps: [
            EasyStep(
              customStep: Container(
                width: 26.w,
                height: 26.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: activeIndex == 0 ? Theme.of(context).colorScheme.primary : Colors.grey[300]!,
                    width: 3.0,
                  ),
                ),
                child: activeIndex == 0
                    ? Icon(
                        Icons.check,
                        size: 22.0,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : null,
              ),
              title: 'On progress',
            ),
            EasyStep(
              customStep: Container(
                width: 26.w,
                height: 26.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: activeIndex == 1 ? Theme.of(context).colorScheme.primary : Colors.grey[300]!,
                    width: 3.0,
                  ),
                ),
                child: activeIndex == 1
                    ? Icon(
                        Icons.check,
                        size: 22.0,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : null,
              ),
              title: 'On its way',
              //topTitle: true,
            ),
            EasyStep(
              customStep: Container(
                width: 26.w,
                height: 26.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: activeIndex == 2 ? Theme.of(context).colorScheme.primary : Colors.grey[300]!,
                    width: 3.0,
                  ),
                ),
                child: activeIndex == 2
                    ? Icon(
                        Icons.check,
                        size: 22.0,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : null,
              ),
              title: 'Delivered',
            ),
          ],
          onStepReached: (index) => setState(() => activeIndex = index),
        ),
        SizedBox(
          height: 97.h,
        ),
        Image(
          fit: BoxFit.cover,
          image: AssetImage(orderStatusImages[activeIndex]),
        ),
        SizedBox(
          height: 24.h,
        ),
        Text(
          orderStatusMessages[activeIndex],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
