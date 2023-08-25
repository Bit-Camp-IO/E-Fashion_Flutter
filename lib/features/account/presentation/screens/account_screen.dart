import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/features/account/presentation/components/account_clipped_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: CachedNetworkImage(
              height: double.infinity,
              imageUrl:
                  "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 32.0,
            child: Column(
              children: [
                SizedBox(
                  height: 32.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(60.0).r,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                    width: 120.w,
                    height: 120.h,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Tara Slander",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
          const AccountClippedContainer(),
        ],
      ),
    );
  }
}
