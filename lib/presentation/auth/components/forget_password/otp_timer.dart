import 'dart:async';

import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTimer extends StatefulWidget {
  const OtpTimer({super.key, required this.onResendPress});

  final void Function() onResendPress;

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  late int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
          currentSeconds = -1;
        }
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: currentSeconds >= 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'RESEND OTP IN',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                timerText,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              )
            ],
          ),
        ),
        Visibility(
          visible: currentSeconds == -1,
          child: CustomFadeAnimation(
            duration: const Duration(milliseconds: 250),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Didn't Receive OTP Code ?",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                ),
                TextButton(
                  onPressed: widget.onResendPress,
                  child: Text(
                    'Resend',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
