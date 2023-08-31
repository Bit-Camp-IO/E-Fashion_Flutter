import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEasyStepper extends StatelessWidget {
  const CustomEasyStepper({super.key, required this.activeStep});

  final int activeStep;

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
      lineLength: 100,
      lineSpace: 10,
      lineType: LineType.normal,
      defaultLineColor: Theme.of(context).colorScheme.outlineVariant,
      finishedLineColor: Theme.of(context).colorScheme.outlineVariant,
      finishedStepBackgroundColor:
          Theme.of(context).colorScheme.onInverseSurface,
      activeStepTextColor: Colors.black87,
      finishedStepTextColor: Theme.of(context).colorScheme.outlineVariant,
      internalPadding: 0,
      showLoadingAnimation: false,
      stepRadius: 20,
      showStepBorder: false,
      lineThickness: 1,
      steps: [
        EasyStep(
          customStep: _buildCustomStep(context: context, activeIndex: 0),
          customTitle: Text(
            textAlign: TextAlign.center,
            'On progress',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: activeStep == 0
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                ),
          ),
        ),
        EasyStep(
          customStep: _buildCustomStep(context: context, activeIndex: 1),
          customTitle: Text(
            textAlign: TextAlign.center,
            'On its way',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: activeStep == 1
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                ),
          ),
          //topTitle: true,
        ),
        EasyStep(
          customStep: _buildCustomStep(context: context, activeIndex: 2),
          customTitle: Text(
            textAlign: TextAlign.center,
            'Delivered',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: activeStep == 2
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomStep(
      {required int activeIndex, required BuildContext context}) {
    return Container(
      width: 26.w,
      height: 26.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: activeStep == activeIndex
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outlineVariant,
          width: 3.0,
        ),
      ),
      child: activeStep == activeIndex
          ? Icon(
              Icons.check,
              size: 22.0,
              color: Theme.of(context).colorScheme.primary,
            )
          : null,
    );
  }
}
