import 'package:efashion_flutter/features/home/presentation/components/main_button_with_icon.dart';
import 'package:efashion_flutter/features/home/presentation/components/product_color.dart';
import 'package:efashion_flutter/features/home/presentation/components/product_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CartBottomSheet extends StatefulWidget {
  const CartBottomSheet({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productColors,
    required this.productSizes,
    required this.productPieces,
  });

  final String productName;
  final int productPrice;
  final int productPieces;
  final List productColors;
  final List productSizes;

  @override
  State<CartBottomSheet> createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  int productPieces = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.productColors.isEmpty && widget.productSizes.isEmpty) {
      return Container(
        height: 320.h,
        decoration: const BoxDecoration(
          color: Color(0xFFDEE3EB),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24).r,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.productName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(width: 40.w),
                  Text(
                    '\$${widget.productPrice}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.productPieces} Pieces Available',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(width: 60.w),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (productPieces != 0) productPieces--;
                            });
                          },
                          icon: const Icon(Iconsax.minus_cirlce, size: 24),
                          color: Colors.black),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Text(
                          key: ValueKey<int>(productPieces),
                          '$productPieces',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (productPieces != widget.productPieces) {
                                productPieces++;
                              }
                            });
                          },
                          icon: const Icon(Iconsax.add_circle, size: 24),
                          color: Colors.black),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30.h),
              MainButtonWithIcon(
                onTap: () {},
                width: 230.w,
                height: 46.h,
                buttonTitle: 'Add To Bag',
                buttonIcon: const Icon(Iconsax.bag_2, color: Colors.white),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 420.h,
        decoration: const BoxDecoration(
          color: Color(0xFFDEE3EB),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24).r,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.productName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(width: 40.w),
                  Text(
                    '\$${widget.productPrice}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Text(
                    'Colors : ',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.productColors.length,
                        (colorsIndex) {
                          String color = widget.productColors[colorsIndex];
                          return ProductColor(
                            color: color,
                            onTap: () {
                              setState(() {
                                selectedColorIndex = colorsIndex;
                              });
                            },
                            isSelected: colorsIndex == selectedColorIndex,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text(
                    'Sizes : ',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.productSizes.length,
                        (sizeIndex) {
                          String size = widget.productSizes[sizeIndex];
                          return ProductSize(
                            size: size,
                            onTap: () {
                              setState(() {
                                selectedSizeIndex = sizeIndex;
                              });
                            },
                            isSelected: selectedSizeIndex == sizeIndex,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text(
                    '${widget.productPieces} Pieces Available',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(width: 40.w),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (productPieces != 0) {
                                productPieces--;
                              }
                            });
                          },
                          icon: const Icon(Iconsax.minus_cirlce, size: 24),
                          color: Colors.black),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Text(
                          key: ValueKey<int>(productPieces),
                          '$productPieces',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (productPieces != widget.productPieces) {
                                productPieces++;
                              }
                            });
                          },
                          icon: const Icon(Iconsax.add_circle, size: 24),
                          color: Colors.black),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30.h),
              MainButtonWithIcon(
                onTap: () {},
                width: 230.w,
                height: 46.h,
                buttonTitle: 'Add To Bag',
                buttonIcon: const Icon(Iconsax.bag_2, color: Colors.white),
              ),
            ],
          ),
        ),
      );
    }
  }
}
