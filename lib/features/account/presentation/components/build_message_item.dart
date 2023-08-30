import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildMessageItem extends StatelessWidget {
  const BuildMessageItem({super.key});

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
                    topRight: const Radius.circular(50).r,
                    topLeft: const Radius.circular(50).r,
                    bottomRight: const Radius.circular(50).r,
                  ),
                  // boxShadow: const [
                  //   BoxShadow(
                  //     color: Colors.black38,
                  //     spreadRadius: 2.0,
                  //     blurRadius: 5,
                  //     offset: Offset(0, 2),
                  //   ),
                  // ],
                ),
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur. Et nulla non pulvinar sit elit at velit.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "11:50 Am",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: const Color(0xFF247BA0),
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
