import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({super.key, required this.message, required this.date});
  final String message;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 75.w,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0).r,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(30).r,
                    topLeft: const Radius.circular(30).r,
                    bottomLeft: const Radius.circular(30).r,
                  ),
                  boxShadow: const [
                  ],
                ),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                DateFormat.jm().format(date),
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: ColorsManager.messageTimeColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
