import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEasyStepper extends StatefulWidget {
  const CustomEasyStepper({super.key});

  @override
  State<CustomEasyStepper> createState() => _CustomEasyStepperState();
}

class _CustomEasyStepperState extends State<CustomEasyStepper> {
  int activeColor = 0;
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: 0,
      lineLength: 100,
      lineSpace: 0,
      lineType: LineType.normal,
      defaultLineColor: Theme.of(context).colorScheme.outlineVariant,
      finishedLineColor: Colors.orange,
      activeStepTextColor: Colors.black87,
      finishedStepTextColor: Colors.black87,
      internalPadding: 0,
      showLoadingAnimation: false,
      stepRadius: 20,
      showStepBorder: false,
      lineThickness: 1,
      steps: [
        EasyStep(
          customStep: Container(
            width: 26.w,
            height: 26.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: activeColor == 0 ? Theme.of(context).colorScheme.primary : Colors.grey[300]!,
                width: 3.0,
              ),
            ),
            child: activeColor == 0
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
                color: activeColor == 1 ? Theme.of(context).colorScheme.primary : Colors.grey[300]!,
                width: 3.0,
              ),
            ),
            child: activeColor == 1
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
                color: activeColor == 2 ? Theme.of(context).colorScheme.primary : Colors.grey[300]!,
                width: 3.0,
              ),
            ),
            child: activeColor == 2
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
      // onStepReached: (index) => setState(() => activeStep = index),
    );
  }
}
