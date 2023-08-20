import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildMyMessageItem extends StatelessWidget {
  const BuildMyMessageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0).r,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                topRight: const Radius.circular(50).r,
                topLeft: const Radius.circular(50).r,
                bottomLeft: const Radius.circular(50).r,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 2.0,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              "Lorem ipsum dolor",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                  ),
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
    );
  }
}
