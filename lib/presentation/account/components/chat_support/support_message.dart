import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SupportMessage extends StatelessWidget {
  final String message;
  final String date;
  const SupportMessage({super.key, required this.message, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0).r,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(30).r,
                    topLeft: const Radius.circular(30).r,
                    bottomRight: const Radius.circular(30).r,
                  ),
                ),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                date,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: ColorsManager.messageTimeColor,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 75.w,
        ),
      ],
    );
  }
}
