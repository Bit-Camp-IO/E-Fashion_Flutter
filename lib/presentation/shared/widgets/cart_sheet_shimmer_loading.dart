import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartSheetShimmerLoading extends StatelessWidget {
  const CartSheetShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomShimmerEffect(
      child: Padding(
        padding: const EdgeInsets.all(24.0).r,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                SizedBox(width: 40.w),
                Container(
                  width: 40.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 45.h,
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16).r,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: List.generate(
                          5, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0).r,
                            child: Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.outlineVariant,
                                  shape: BoxShape.circle
                              ),
                            ),
                          );
                        },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 45.h,
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16).r,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: List.generate(
                          5, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0).r,
                            child: Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.outlineVariant,
                                  shape: BoxShape.circle
                              ),
                            ),
                          );
                        },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 45.h,
                child: Row(
                  children: [
                    Container(
                      width: 120.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    SizedBox(width: 40.w),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16).r,
                      child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.outlineVariant,
                                  shape: BoxShape.circle
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Container(
                              width: 15.w,
                              height: 5.h,
                              color: Theme.of(context).colorScheme.outlineVariant,
                            ),
                            SizedBox(width: 5.w),
                            Container(
                              width: 24.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.outlineVariant,
                                  shape: BoxShape.circle
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              width: 230.w,
              height: 46.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(12).r,
              ),
            )
          ],
        ),
      ),
    );
  }
}
