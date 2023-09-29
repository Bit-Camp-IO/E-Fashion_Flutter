import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_color.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_pieces_counter.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_size.dart';
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
    required this.productStock,
  });

  final String productName;
  final int productPrice;
  final int productStock;
  final List productColors;
  final List productSizes;

  @override
  State<CartBottomSheet> createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  int productPieces = 0;

  double _cartHeight() {
    if (widget.productColors.isNotEmpty && widget.productSizes.isNotEmpty) {
      return 450.h;
    } else if (widget.productColors.isNotEmpty ||
        widget.productSizes.isNotEmpty) {
      return 390.h;
    } else {
      return 340.h;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.productName.isNotEmpty) {
      return CustomFadeAnimation(
        duration: const Duration(milliseconds: 250),
        child: Container(
          height: _cartHeight(),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ).r,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0).r,
            child: Column(
              children: [
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(10).r),
                ),
                Padding(
                  padding: const EdgeInsets.all(24).r,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.productName.length > 20
                                ? '${widget.productName.substring(0, 20)}..'
                                : widget.productName,
                            overflow: TextOverflow.ellipsis,
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
                      widget.productColors.isNotEmpty
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                height: 45.h,
                                child: SingleChildScrollView(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Colors : ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16).r,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: List.generate(
                                              widget.productColors.length,
                                              (colorsIndex) {
                                                String color = widget
                                                    .productColors[colorsIndex]
                                                    .hex;
                                                return ProductColor(
                                                  color: color,
                                                  onTap: () {
                                                    setState(() {
                                                      selectedColorIndex =
                                                          colorsIndex;
                                                    });
                                                  },
                                                  isSelected: colorsIndex ==
                                                      selectedColorIndex,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            )
                          : const SizedBox.shrink(),
                      widget.productColors.isNotEmpty
                          ? SizedBox(height: 24.h)
                          : const SizedBox.shrink(),
                      widget.productSizes.isNotEmpty
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                  height: 45.h,
                                  child: SingleChildScrollView(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Sizes : ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 24).r,
                                          child: Row(
                                            children: List.generate(
                                              widget.productSizes.length,
                                              (sizeIndex) {
                                                String size = widget
                                                    .productSizes[sizeIndex];
                                                return ProductSize(
                                                  size: size,
                                                  onTap: () {
                                                    setState(() {
                                                      selectedSizeIndex =
                                                          sizeIndex;
                                                    });
                                                  },
                                                  isSelected:
                                                      selectedSizeIndex ==
                                                          sizeIndex,
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            )
                          : const SizedBox.shrink(),
                      widget.productSizes.isNotEmpty
                          ? SizedBox(height: 24.h)
                          : const SizedBox.shrink(),
                      Row(
                        mainAxisAlignment: widget.productColors.isEmpty &&
                                widget.productSizes.isEmpty
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.productStock} Pieces Available',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          SizedBox(width: 40.w),
                          ProductPiecesCounter(
                            onIncrementPress: () {
                              setState(() {
                                if (productPieces != widget.productStock) {
                                  productPieces++;
                                }
                              });
                            },
                            onDecrementPress: () {
                              setState(() {
                                if (productPieces != 0) {
                                  productPieces--;
                                }
                              });
                            },
                            productPieces: productPieces,
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      PrimaryButton(
                        width: 230.w,
                        onTap: () {},
                        buttonTitle: 'Add To Bag',
                        buttonIcon:
                            const Icon(Iconsax.bag_2, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: 450.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ).r,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0).r,
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(10).r),
              ),
            ),
            Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
